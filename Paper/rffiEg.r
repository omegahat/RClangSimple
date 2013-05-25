# shell cmd: R CMD SHLIB rffi.c

library(rfficall)


x = 1:10
ans = numeric(length(x))
v = .dyncall(sym, "*ii*d)i", x, length(x), ans)


r = getRoutines("Paper/rffi.c")
r$square_sin
