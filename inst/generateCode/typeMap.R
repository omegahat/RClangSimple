lookupTypeMap =
function(map, name, what, type, ...)
{
   if(!(name %in% names(map)))
      return(character())

   el = map[[name]]
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
