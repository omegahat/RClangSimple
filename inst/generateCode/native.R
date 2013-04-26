createNativeProxy =
function(fun, name = sprintf("R_%s", getName(fun)), typeMap = NULL)
{
   argNames = names(fun$params)
   if(any(w <- (argNames == ""))) 
      argNames[w] = sprintf("arg%d", which(w))

   rargNames = sprintf("r_%s", argNames)

   call = sprintf("%s(%s);", getName(fun), paste(argNames, collapse = ", "))

   cvtCode = convertValueToR(fun$returnType, "ans", typeMap = typeMap)
   
   convertResult = if(is(cvtCode, "AsIs") || length(cvtCode) > 1) cvtCode else paste("r_ans =", cvtCode, ";")
     
   code = c(sprintf("SEXP %s(%s)", name, paste("SEXP", rargNames, collapse = ", ")),
            "{",
             "SEXP r_ans = R_NilValue;",
             makeLocalVars(fun$params, rargNames, argNames),
             "",
             if(getTypeKind(fun$returnType) != CXType_Void)
                c(paste(getName(fun$returnType), "ans;"), paste("ans =", call))
             else
                call,
             "",
             convertResult,
             "", # can clean up here.
             "return(r_ans);",
            "}"
           )

   CRoutineDefinition(name, code, length(fun$params), as.character(NA))
}

BasicTypeKindNames =
 c("CXType_Void", "CXType_Bool", "CXType_Char_U", 
   "CXType_UChar", "CXType_Char16", "CXType_Char32", "CXType_UShort", 
   "CXType_UInt", "CXType_ULong", "CXType_ULongLong", "CXType_UInt128", 
   "CXType_Char_S", "CXType_SChar", "CXType_WChar", "CXType_Short", 
   "CXType_Int", "CXType_Long", "CXType_LongLong", "CXType_Int128", 
   "CXType_Float", "CXType_Double", "CXType_LongDouble" )

convertValueToR =
function(type, var, name = getName(type), typeMap = NULL, rvar = "r_ans")
{

   k = getTypeKind(type)

   if(length(m <- lookupTypeMap(typeMap, name, "convertValueToR", type, var, rvar)))
       return(m)
  

   primitive = names(k) %in% gsub("CXType_", "", BasicTypeKindNames)
   if(primitive)
     return(switch(names(k),
                   LongLong = ,
                   Long=,
                   Double=,
                   Float=,
                   Int128=,
                   UInt = sprintf("ScalarReal(%s)", var),
                   Short=,
                   Int = sprintf("ScalarInteger(%s)", var),
                   Bool = sprintf("ScalarLogical(%s)", var),
                   NullPtr = "R_NilValue"
                   ))

   if(k  == CXType_Record) {
       # copy to R.
       # if we want to treat this as an opaque type, create a routine that
       # allocates new memory and copies the contents.
       # Allow the caller to say what she wants, like the .copy parameter.
      sprintf("R_copyStruct_%s(%s)", name, var)
   } else if(k == CXType_Typedef) {
      convertValueToR(getCanonicalType(type), var, name)
   } else if(k == CXType_Enum || (k == CXType_Unexposed && grepl("^enum ", name))) {
     sprintf("Renum_convert_%s(%s)", gsub("^enum ", "", name), var)
   } else if(k == CXType_Pointer) {
      sprintf('R_createRef(%s, "%s")', var, name)
   } else
      browser()
}


makeLocalVars =
  # Define and initialize
function(params, rNames, argNames = names(params))
{
  mapply(makeLocalVar, params, rNames, argNames)
}

makeLocalVar =
function(param, inputName,  localName = getName(param), type = getType(param),
            decl = getName(type))
{
   kind = getTypeKind(type)

   ans = switch(decl,
                "const char *" =
                    sprintf("%s = CHAR(STRING_ELT(%s, 0));", localName, inputName),
                "unsigned int" =
                    sprintf("%s = REAL(%s)[0];", localName, inputName),
                 character())

   if(length(ans) == 0) {

     typeName = getName(type)
     if(kind == CXType_Enum || (kind == CXType_Unexposed && grepl("^enum ", typeName))) 
          ans = sprintf("%s = (%s) INTEGER(%s)[0];", localName, decl, inputName)
     
     else if(kind == CXType_Typedef) {
          # we want to use the typedef name (in decl). But we have to know if this is a pointer or not.
      canon = getCanonicalType(type)
      ckind = getTypeKind(canon)
      if(ckind == CXType_Pointer)
         ans = sprintf('%s = (%s) getRReference(%s);', localName, decl, inputName)
      else
         #XXX looks wrong.
         return(makeLocalVar( , inputName, localName, type = getCanonicalType(type)))
     } else if(kind == CXType_Record) {
       ans = sprintf('%s = * GET_REF(%s, %s);', localName, inputName, decl)
     } else if(kind == CXType_Pointer) {
       info = getPointerInfo(type)
       if(info$depth == 2L && getTypeKind(info$base) == CXType_Char_S) {
           # char **
          ans = sprintf("%s = getCharArrayPtr(%s)", localName, inputName)
       } else {
         stars = paste(rep("*", info$depth - 1L), collapse = "")
         ans = sprintf('%s = GET_REF(%s, %s %s);', localName, inputName, getName(info$base), stars)
       }
       
    } else
       browser()

   }

   if(length(ans) == 0 || ans == "")
     browser()

   paste(decl, ans)
}
