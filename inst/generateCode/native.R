createNativeProxy =
  # GetRefAddsStar  controls whether we reduce the pointer declaration's * by 1
  # depending on how we define GET_REF() in the C code.
  # RCUDA for  example does not add a *, but in RCIndex we do add the *.
function(fun, name = sprintf("R_%s", getName(fun)), typeMap = NULL, GetRefAddsStar = TRUE)
{
   argNames = names(fun@params)
   if(any(w <- (argNames == ""))) 
      argNames[w] = sprintf("arg%d", which(w))

   rargNames = sprintf("r_%s", argNames)

   call = sprintf("%s(%s);", getName(fun), paste(argNames, collapse = ", "))

   cvtCode = convertValueToR(fun@returnType, "ans", typeMap = typeMap)

   convertResult = if(length(cvtCode) == 0 || is(cvtCode, "AsIs") || length(cvtCode) > 1) cvtCode else paste("r_ans =", cvtCode, ";")
     
   code = c(sprintf("SEXP %s(%s)", name,
                        if(length(rargNames)) paste("SEXP", rargNames, collapse = ", ") else ""),
            "{",
             "SEXP r_ans = R_NilValue;",
             makeLocalVars(fun@params, rargNames, argNames, GetRefAddsStar = GetRefAddsStar),
             "",
             if(getTypeKind(fun@returnType) != CXType_Void)
                c(paste(getName(fun@returnType), "ans;"), paste("ans =", call))
             else
                call,
             "",
             convertResult,
             "", # can clean up here.
             "return(r_ans);",
            "}"
           )

   CRoutineDefinition(name, code, length(fun@params), as.character(NA))
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
  

   primitive = names(k) %in% c(BasicTypeKindNames, gsub("CXType_", "", BasicTypeKindNames))
   if(primitive)
     return(switch(names(k),
                   LongLong = ,
                   Long=,
                   Double=,
                   Float=,
                   Int128=,
                   ULong =,
                   UInt = sprintf("ScalarReal(%s)", var),
                   Short=,
                   Int = sprintf("ScalarInteger(%s)", var),
                   Bool = sprintf("ScalarLogical(%s)", var),
                   NullPtr = "R_NilValue",
                   Void= character()
                   ))

   if(k  == CXType_Record) {
       # copy to R.
       # if we want to treat this as an opaque type, create a routine that
       # allocates new memory and copies the contents.
       # Allow the caller to say what she wants, like the .copy parameter.

      sprintf("R_copyStruct_%s(&%s)", gsub("struct ", "", name), var)
   } else if(k == CXType_Typedef) {
      convertValueToR(getCanonicalType(type), var, name = name) #  was name instead of getName(type)
   } else if(k == CXType_Enum || (k == CXType_Unexposed && grepl("^enum ", name))) {
      sprintf("Renum_convert_%s(%s)", gsub("^enum ", "", name), var)
   } else if(k == CXType_Pointer) {
#cat("convertValueToR\n");browser()
      if(grepl("*", name, fixed = TRUE))
         name = gsub(" ?\\*", "Ptr", name)
      sprintf('R_createRef(%s, "%s")', var, name)
   } else if(k == CXType_Unexposed) {
      I(c(sprintf("%s * _tmp = (%s *) malloc( sizeof( %s ));", name, name, name),
             sprintf("*_tmp = %s;", var), 
             sprintf('%s%sR_createRef(_tmp, "%s");', rvar, if(nchar(rvar)) " = " else "", gsub("struct ", "", name))))
   } else
     #    browser()
   warning("possible  problem in convertValueToR for ", name)
}


makeLocalVars =
  # Define and initialize
function(params, rNames, argNames = names(params), ...)
{
  if(length(params) == 0)
     return(character())
  mapply(makeLocalVar, params, rNames, argNames, ...)
}

makeLocalVar =
function(param, inputName,  localName = getName(param), type = getType(param),
            decl = getName(type), GetRefAddsStar = TRUE, typeMap = NULL)
{
   kind = getTypeKind(type)

   ans = derefRarg(decl, localName, inputName)

   if(length(ans) == 0) {

     typeName = getName(type)
     if(kind == CXType_Enum || (kind == CXType_Unexposed && grepl("^enum ", typeName))) 
          ans = sprintf("%s = (%s) INTEGER(%s)[0];", localName, decl, inputName)
     
     else if(kind == CXType_Typedef) {
          # we want to use the typedef name (in decl). But we have to know if this is a pointer or not.
      canon = getCanonicalType(type)
      ckind = getTypeKind(canon)
      if(ckind == CXType_Pointer)
#         ans = sprintf('%s = (%s) getRReference(%s);', localName, decl, inputName)
         ans = sprintf('%s = GET_REF(%s, %s);', localName, inputName, typeName)
      else {     #XXX looks wrong.
          # see when we use the name of the canonical type whether this corresponds to a primitive.
         ans = derefRarg(getName(canon), localName, inputName)
         if(length(ans) == 0)
           return(makeLocalVar( , inputName, localName, type = canon, decl = decl))
       }
     } else if(kind == CXType_Record) {
       ans = sprintf('%s = * GET_REF(%s, %s);', localName, inputName, decl)
     } else if(kind == CXType_Pointer) {
       info = getPointerInfo(type)

       if(info$depth == 2L && getTypeKind(info$base) == CXType_Char_S) {
           # char **
          ans = sprintf("%s = getCharArrayPtr(%s);", localName, inputName)
       } else if(isStringType(type)) {
          ans = sprintf("%s = CHAR(STRING_ELT(%s, 0));", localName, inputName)
       } else if(info$depth == 1L && isIntegerType(info$baseType)) {
          ans = sprintf("%s = INTEGER(%s);", localName, inputName)
       } else {
      #add 1 back.  For something in CUDA. But what ?  Doesn't work for clang_getDiagnosticOption in libclang.
      # issue is that GET_REF is defined differently in the two systems.
      # So add a GetRefAddsStar parameter.
         stars = paste(rep("*", info$depth - 1L + !GetRefAddsStar), collapse = "")
         ans = sprintf('%s = GET_REF(%s, %s %s);', localName, inputName, getName(info$base), stars)
       }
       
    } else if(kind == CXType_Unexposed) {
         # So an opaque data type ?
      ans = sprintf('%s = * GET_REF(%s, %s);', localName, inputName, sprintf("%s *", decl))
      #  ans = sprintf('%s = GET_REF(%s, %s);', localName, inputName, getName(type))
    } else {
#cat('hi\n'); browser()
       ans = derefRarg(names(kind), localName, inputName)
      # ans = paste(localName, ";")
    }
   }

   if(length(ans) == 0 || ans == "") {
      warning("possible problem ", decl)
#      browser()
    }

   paste(decl, ans)
}

derefRarg =
function(decl, localName, inputName)
{
 switch(decl,
        "const char *" =
            sprintf("%s = CHAR(STRING_ELT(%s, 0));", localName, inputName),
        "unsigned int" =,
        "long" =,
        "unsigned long" =,     
        "double" = ,
        ULongLong = ,
        "float" = 
            sprintf("%s = REAL(%s)[0];", localName, inputName),
        "short" = ,
        "int" = sprintf("%s = INTEGER(%s)[0];", localName, inputName),
        "unsigned char" = ,
        "unsigned short" = ,        
        "char" =
             sprintf("%s = (%s) INTEGER(%s)[0];", localName, decl, inputName),
       character())
}

getNativeDeclaration =
function(varName, type, addSemiColon = TRUE)
{
  makeLocalVar(, varName, varName, type = type)
}


convertRValue =
function(localName, rName, type, typeMap = NULL)
{
  makeLocalVar(, rName, localName, type = type, typeMap = typeMap)
}
