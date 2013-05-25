#
# Determine what routines a routine calls
#
# Just use findCalls on the idividual routines

library(RCIndex)
tu = createTU("src/clang.c", includes = c("~/llvm-devel/tools/clang/include", sprintf("%s/include", R.home())))
r = getRoutines(tu)
i = sapply(r, function(x) getFileName(x$def)) == "src/clang.c"
rc = r[i]

calls = lapply(rc, function(x) findCalls(x$def))
