library(RCIndex)
tu = createTU("inst/exampleCode/func.c")
z = .Call("R_getRoutines", as(tu, "CXCursor"), vector("list", 1000), character(1000))

