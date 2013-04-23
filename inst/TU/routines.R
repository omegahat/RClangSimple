# See enums.R to get tu, etc.

map = list(CXString = list(target = 'CXString', convertValueToR = 'CXStringToSEXP'))

rr = resolveType(getRoutines(tu), tu)
rr = rr[ grepl("^clang_", names(rr)) ]
names(rr)

b = createRoutineBinding(rr[["clang_getTypeSpelling"]], typeMap = map)

out = file("../../src/tmp.c", "w")


