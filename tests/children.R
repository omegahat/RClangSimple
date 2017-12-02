library(RCIndex)
tu = createTU(system.file("exampleCode", "bob.c", package = "RCIndex"))
r = getRoutines(tu)
children(r$foo)
