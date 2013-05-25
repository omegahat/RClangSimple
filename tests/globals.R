library(RCIndex)
g = genVariableCollector()
parseTU(system.file("exampleCode", "array.c", package = "RCIndex"), g$update)
x = g$vars()$x
ty = getType(x)
getTypeKind(ty)
getNumElements(ty)
getArraySize(ty)
elType = getArrayElementType(ty)

getSizeOf(elType)
getSizeOf(ty)
getName(elType)



