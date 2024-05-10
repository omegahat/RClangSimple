library(RCIndex)
idx = createIndex()
bob = createTU(system.file("exampleCode", "bob.c", package = "RCIndex"), idx = idx)
bar = createTU(system.file("exampleCode", "bar.c", package = "RCIndex"), idx = idx)
r = getRoutines(bob)

barCall = getChildren(r$foo)[[2]][[4]][[1]][[1]]
barCall$kind

cur = getCursorReferenced(barCall)
cur
cur$kind



