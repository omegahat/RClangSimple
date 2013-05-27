library(RCIndex)
#library(XML)
#xmlSourceFunctions("inst/doc/RClangSimple.Rdb")
f = genFunctionCollector()
parseTU(system.file("exampleCode", "register.c", package = "RCIndex"),
          args = sprintf("-I%s%sinclude", R.home(), .Platform$file.sep), f$update)
fns = f$funcs()

names(fns)

p = fns$foo@params

ty = getCanonicalType(p[[1]])
getTypeKind(ty)
tt = getPointeeType(ty)

d = getTypeDecl(tt)
getName(d)
d$type

sapply(p, isSEXP)

isDotCall(fns$foo)

