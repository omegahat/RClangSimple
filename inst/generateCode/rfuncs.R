createRProxy =
function(fun, name = getName(fun), argNames = names(fun$params),
          nativeProxyName = sprintf("R_%s", getName(fun)),
          PACKAGE = NA, defaultValues = character(), guessDefaults = FALSE,
          typeMap = NULL)
{
   if(any(w <- (argNames == ""))) 
      argNames[w] = sprintf("arg%d", which(w))
  
   coercedArgs = makeCoercedArgs(fun$params, argNames)
   call = c(sprintf(".Call('%s'",  nativeProxyName),
             if(length(fun$params)) ", ", 
             paste(c(coercedArgs, if(!is.na(PACKAGE)) c(PACKAGE = PACKAGE)), collapse = ", "),
            ")")

   sig = makeSignature(argNames, fun$params, defaultValues, guessDefaults)
   
   code = c(#paste(name, "<-"),
            #paste("function(", paste(sig, collapse = ", "), ")"),
            #"{",
             paste(call, collapse = "")
           # "}"
          )

   RFunctionDefinition(name, code, argNames)
}

makeSignature =
function(argNames, params, defaultValues = character(), guessDefaults = !inherits(defaultValues, "AsIs"))
{
  if(length(defaultValues) == 0 && length(params) > 0 && guessDefaults)
      defaultValues = guessDefaultValues(params, argNames)

  argNames
}
  
makeCoercedArgs =
function(params, names)
{
  unlist(mapply(makeCoerceArg, params, names))
}

makeCoerceArg =
function(parm, name, type = getType(parm), kind = getTypeKind(type))
{
   class = switch(names(kind),
                   LongLong= ,
                   Double=,
                   Float=,
                   Int128=,
                   UInt = "numeric",
                   Short=,
                   Int = "integer",
                   Bool = "logical",
                   NullPtr = "NULL",
                  character())

   if(length(class) == 0) {
     typeName = getName(type)
     
     if(kind == CXType_Enum || (kind == CXType_Unexposed && grepl("^enum ", typeName))) 
          class = gsub('^enum ', '', typeName)
     
     else if(kind == CXType_Typedef) {
#       browser()
       class = getName(type)
       #return(makeCoerceArg(type = getCanonicalType(type), name = name))
     } else if(kind == CXType_Record)
        class = getName(type)
     else if(kind == CXType_Pointer) {
         # XXX What should the name be for this representation
         # Make more specific
       info = getPointerInfo(type)
       if(info$depth <= 2 && getTypeKind(info$baseType) == CXType_Char_S)
         class = "character"
       else {
         browser()
         if(grepl("*", name, fixed = TRUE))
           class = getName(info$baseType)
         else
            class = name # assume we are using the name
         #class = "RC++Reference"
       }
     } else if(kind == CXType_ConstantArray) {
        elTy = getArrayElementType(type)
        elKind = getTypeKind(elTy)
        if(elKind == CXType_Char_S) 
          class = "character"
        else 
          class = "raw"
     } else if(kind == CXType_Unexposed) {

         if(grepl("^struct ", typeName)) 
            class =  gsub("^struct ", "", typeName)
         else
            browser()

     } else {
         browser()
     }
   }

   sprintf("as(%s, '%s')", name, class)
}
