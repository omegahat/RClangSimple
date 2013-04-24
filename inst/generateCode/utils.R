getPointerDepth =
function(type, kind = getTypeKind(type))
{
  ctr = 0
  while(kind == CXType_Pointer) {
    kind = getTypeKind(getPointeeType(type))
    ctr = ctr + 1L
  }
  ctr
}


getPointerInfo =
function(type)
{
  ty = type
  ctr = 0
  while( (kind <- getTypeKind(ty)) == CXType_Pointer) {
    ty = getPointeeType(ty)
    ctr = ctr + 1L
  }

  list(depth = ctr, baseType = ty)
}
