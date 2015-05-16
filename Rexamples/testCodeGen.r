library(RCIndex)
invisible(sapply(list.files("inst/generateCode", pattern = "R$", full.names = TRUE), source))
ds = getDataStructures("inst/exampleCode/struct.c")
#z = getStructDef(ds$Foo)
z = ds$Foo

makeRConstructor(z, z$name[1])

