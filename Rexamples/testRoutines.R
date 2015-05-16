library(RCIndex)
tu = createTU("inst/exampleCode/func.c")
#z = .Call("R_getRoutines", as(tu, "CXCursor"), vector("list", 1000), character(1000))
z = getRoutines(as(tu, "CXCursor"), expectedNum = 2)
z = getRoutines(as(tu, "CXCursor"), expectedNum = 1) # actually there are 2, but we underestimate this.


