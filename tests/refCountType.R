library(RCIndex)
v = getVariables(system.file("exampleCode", "simple.c", package = 'RCIndex'))
ty = getType(v$i)
rm(v)
gc()
table(replicate(1000, getName(ty)))
rm(ty)
gc()

