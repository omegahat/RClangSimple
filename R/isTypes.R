isVoidType =
function(type)
  getTypeKind(type) == CXType_Void


isPointerType = # isPointerType or isPointer?
function(type)
  getTypeKind(type) == CXType_Pointer


isStringType =
function(type)   # do we want to insist it is mutable
{
   # This should check the type of the element rather than using the name.
   isPointerType(type) && grepl("char \\*$", getName(type) )
}

isIntType = isIntegerType =
function(type)   # do we want to insist it is mutable
{
  getTypeKind(type)  == CXType_Int
}


isStructType =
function(type, canonical = TRUE)
{
  if(canonical)
    type = getCanonicalType(type)

  getTypeKind(type) == CXType_Record
}
