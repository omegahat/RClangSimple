library(RCIndex)

# enums
# typedefs
# structs
# routines
# defines


llvmInc = path.expand("~/llvm-devel/tools/clang/include")
h = sprintf("%s/clang-c/Index.h", llvmInc)
tu = createTU(h, args = sprintf("-I%s", llvmInc))

if(FALSE) {
ec = genEnumCollector()
z = visitTU(tu, ec$update)
e = ec$enums()
}

rc = genFunctionCollector()
z = visitTU(tu, rc$update)
r = rc$funcs()
r = r[grepl("^clang_", names(r))]

ga = r[["clang_Cursor_getArgument"]]

tp = getType(r[["clang_equalTypes"]]$params[[1]])



tyFuns = sapply(r, function(x) length(x$params) && getName(getType(x$params[[1]]))== "CXType")

tyTypes = list(ins = unlist(lapply(r[tyFuns], function(x) sapply(x$params[-1], function(x) getName(getType(x))))),
                outs = unlist(lapply(r[tyFuns], function(x) getName(x$returnType))))

