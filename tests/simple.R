library(RCIndex)
idx = createIndex()
tu = createTU("../src/clang.c", idx)

f = function(cur, parent) {
  cat(names(cur$kind), getName(cur), "\n")
  2L
}
  

visitTU(tu, f)


src = system.file("exampleCode", "enums.c", package = "RCIndex")
col = genVariableCollector()
parseTU(src, col$update)
names(col$vars())







