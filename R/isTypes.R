isVoidType =
function(type)
  getTypeKind(type) == CXType_Void


isPointerType = # isPointerType or isPointer?
function(type)
  getTypeKind(type) == CXType_Pointer
