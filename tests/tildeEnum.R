library(RCIndex)

tu = createTU("enum.c")
a = getEnums(tu)

names(a)

sapply(a, slot, "values")

