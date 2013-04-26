library(RCIndex)
g = genVariableCollector()
parseTU("inst/exampleCode/array.c", g$update)
x = g$vars()$x
ty = getType(x)
getTypeKind(ty)
getNumElements(ty)
getArraySize(ty)
elType = getArrayElementType(ty)

getSizeOf(elType)
getSizeOf(ty)
getName(elType)



