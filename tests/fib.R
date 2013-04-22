library(RCIndex)
f = "inst/exampleCode/fib.c"
funs = getFunctions(f)
fib = funs$fib
as(fib$returnType, "character")


fib$params$n$language
fib$params$n$kind

