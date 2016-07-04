library(RCIndex)
#library(XML)
#xmlSourceFunctions("inst/doc/RClangSimple.Rdb")

# Need more flexible way of finding the R include directory, but this works
# for a local installation I use for developing R.
#inc = sprintf("%s%sinclude", R.home(), .Platform$file.sep)

inc = sprintf("-I%s%sinclude", R.home(), .Platform$file.sep)
if(file.exists(inc)) {
#inc = system("R CMD config --cppflags", intern = TRUE)
f = genFunctionCollector()
parseTU(system.file("exampleCode", "register.c", package = "RCIndex"),
          args = inc, f$update)
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

}

