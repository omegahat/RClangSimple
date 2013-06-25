getRTypeName = 
function(type,  kind = getTypeKind(type), name = getName(type), typeMap = NULL)
{

  if(!is.null(typeMap) && !is.null(map <- typeMap[[name]])) {
    tmp =  map[["rclass"]]
    if(!is.null(tmp))
      return(tmp)
  }

  if(isFnPointer(type))
    "FunctionOrNULL" # or name FunctionSymbolOrNULL but that is handled by the class defn in RGraphicsDevice
  else if(kind == CXType_ConstantArray) {
    tmp = getRTypeName(getElementType(type), typeMap = typeMap)
  } else if(kind == CXType_Typedef) {
    getName(type)
  } else if(kind == CXType_Double || kind == CXType_Float)
    "numeric"
  else if(kind %in% c(CXType_Int, CXType_Char16, CXType_Char32))
   "integer"
  else if(isPointerType(type)) {
    ty = getPointerInfo(type)
    if(ty$baseType$kind == CXType_Char_S && ty$depth < 3)
      "character"
    else if(ty$baseType$kind == CXType_Void)
      "externalptr"
    else
      getRTypeName(ty$baseType, typeMap = typeMap)
      
  } else
    stop("don't know the R type for this native type!")
}
