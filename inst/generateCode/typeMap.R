lookupTypeMap =
  # rvar is the name of the SEXP target variable
function(map, typeName, what, type, ...)
{
   if(!(typeName %in% names(map)))
      return(character())

   el = map[[typeName]]
   val = el[[what]]
   if(is.null(val))
     return(character())

   if(is.function(val))
      val(..., type = type)
   else if(is.character(val)) {
      args = list(...)
      switch(what,
             convertValueToR = sprintf("%s(%s)", val, args[[1]]),
             character())
   }
}
