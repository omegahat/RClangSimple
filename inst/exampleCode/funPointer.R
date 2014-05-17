library(RCIndex)
tu = createTU(system.file("exampleCode", "funPointer.c", package = "RCIndex"))

rr = getRoutines(tu)
f = rr$foo@params[[1]]
pfun = getCanonicalType(getType(f))
fun = getPointeeType(pfun)

# fun is now a FunctionProto

o = getTypeDeclaration(getType(f))
getName(o)

sapply(children(o), getName)
sapply(children(o), getType)
visitTU(o, simpleVisitor)

getResultType(o) # not valid type, e.g, $kind => Invalid
getResultType(fun) # works.

# getCursorDisplayName


# Function pointer in the structure

dd = getDataStructures(tu)
foo = dd$Foo
fun = getPointeeType(foo$fields$f)
ty = getCanonicalType(fun)
ty$kind  # FunctionProto

getResultType(ty)$kind

# But how do we get to the parameters
getNumArgTypes(ty)
getArgsType(ty)

# We don't have the names of the parameters
# Pretend we don't know the index
i = which(names(foo$fields) == "f")
toks = getCursorTokens(foo$def[[i]])



# getTypeDeclaration(ty) doesn't work here.

