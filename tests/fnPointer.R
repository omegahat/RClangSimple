library(RCIndex)

f = getFunctions("inst/exampleCode/funPointer.c")$foo

h = f$params[[1]]

getTypeKind(h) # Typedef
ty = getCanonicalType(h)
getTypeKind(ty) # Pointer

pty = getPointeeType(ty)
getTypeKind(pty) # FunctionProto

# This is a type. We need the cursor.

cur = getTypeDeclaration(pty) # invalid type



