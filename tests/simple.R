library(RCIndex)
tu = createTU(system.file("exampleCode", "fib.c", package = "RCIndex"))

f = function(cur, parent) {
  cat(names(cur$kind), getName(cur), "\n")
  CXChildVisit_Recurse
}
  

visitTU(tu, f)

# C++ code
tu = parseTU(system.file("exampleCode", "simpleClass.cpp", package = "RCIndex"), f)


src = system.file("exampleCode", "enums.c", package = "RCIndex")
col = genVariableCollector()
parseTU(src, col$update)
names(col$vars())







