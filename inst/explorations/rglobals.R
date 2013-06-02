library(RCIndex)

f = sprintf("%s/../src/main/eval.c", R.home())
tu = createTU(f, args = "-DHAVE_CONFIG_H", includes = c(sprintf("%s/../src/include", R.home()), sprintf("%s/include", R.home()), sprintf("%s/src/include", R.home())))

r = getRoutines(tu)

g = findGlobals(r$applydefine)


g = findGlobals(r$tryDispatch)


allGlobals = lapply(r, findGlobals)
sum(sapply(allGlobals, length))
counts = table(unlist(allGlobals))

counts[!grepl("Sym$", names(counts))]



