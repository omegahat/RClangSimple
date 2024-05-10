#
# Two C files treated as two translation units, but within the same clang Index.
# bob.c contains a call to bar() which is defined in bar.c.
# We get the cursor for that call to bar within bob.c and then
# get the declaration of bar in bar.c via getCursorReferenced().
#

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



