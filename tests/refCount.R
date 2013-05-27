library(RCIndex)
r = getRoutines(system.file("exampleCode", "simple.c", package = 'RCIndex'))
# We will release this TU associated with r because there are no routines.
f = getRoutines(system.file("exampleCode", "fib.c", package = 'RCIndex'))
gc()
gc()


ty = f[[1]]@returnType
rm(f)
gc()
gc()
#gctorture(TRUE)
table(replicate(1000, getName(ty)))

rm(ty)
gc();gc()


getRoutines(system.file("exampleCode", "simple.c", package = 'RCIndex'))
gc()





