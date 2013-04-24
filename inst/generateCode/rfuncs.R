createRProxy =
function(fun, name = getName(fun), argNames = names(fun$params),
          nativeProxyName = sprintf("R_%s", getName(fun)),
          PACKAGE = NA, defaultValues = character(), guessDefaults = FALSE,
          typeMap = NULL)
{
   coercedArgs = makeCoercedArgs(fun$params, argNames)
   call = c(sprintf(".Call('%s'",  nativeProxyName),
             if(length(fun$params)) ", ", 
             paste(c(coercedArgs, if(!is.na(PACKAGE)) c(PACKAGE = PACKAGE)), collapse = ", "),
            ")")

   sig = makeSignature(argNames, fun$params, defaultValues, guessDefaults)
   
   code = c(paste(name, "<-"),
            paste("function(", paste(sig, collapse = ", "), ")"),
            "{",
             paste(call, collapse = ""),
            "}")
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

   class = switch(kind,
                   LongLong = ,
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
     if(kind == CXType_Typedef)
        return(makeCoerceArg(type = getCanonicalType(type), name = name))
     else if(kind == CXType_Record)
        class = getName(type)
     else if(kind == CXType_Pointer) {
         # XXX What should the name be for this representation
         # Make more specific
       browser()
       class = getName(type)
        #class = "RC++Reference"
     } else 
        browser()
   }

   sprintf("as(%s, '%s')", name, class)
}
