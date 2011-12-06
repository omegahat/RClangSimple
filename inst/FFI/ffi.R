library(Rffi)

genCIFWrapper = 
function(def, name = getName(def$def))
{
  cif = genCIF(def)
  f = function(...) {   # want the actual parameter names
      callCIF(cif, name, ...)
  }
  f
}


genCIF = 
function(fun)
{
  retType = mapCIndexTypeToFFI(fun$returnType)
  paramTypes = lapply(fun$params, mapCIndexTypeToFFI)
  CIF(retType, paramTypes)
}


setGeneric("mapCIndexTypeToFFI", 
            function(type, ...) 
               standardGeneric("mapCIndexTypeToFFI"))

setMethod("mapCIndexTypeToFFI", "CXCursor",
           function(type, ...)
             mapCIndexTypeToFFI(as(type, "CXType"), ...))

setMethod("mapCIndexTypeToFFI", "CXType",
           function(type, ...)
{
  map = list(sint32Type = CXType_Int,
             doubleType = CXType_Double)

  k = getTypeKind(type)
  i = match(k, map)
  if(!is.na(i)) {
      get(names(map)[i])
  } else {
      if(k == CXType_Record) {
        structType(lapply(getStructDef(type)$fields, mapCIndexTypeToFFI)) # XXX put names on these elements.
      } else
         stop("Don't know how to handle this")
  }
})

