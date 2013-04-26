library(RCIndex)
h = genDataStructCollector()

parseTU("/Users/duncan/llvm-devel/tools/clang/include/clang-c/Index.h", h@update,
          args = c("-I/Users/duncan/llvm-devel/tools/clang/include"))
ds = h@results()
cx = ds[ grep("^CX", names(ds), value = TRUE) ]


d = getStructDef(ds[["CXSourceRange"]])
d$name
names(d$fields)
sapply(d$fields, getName)
sapply(d$fields, getTypeKind)

sapply(d$fields, getSizeOf)

et = getArrayElementType(d$fields$ptr_data)
getTypeKind(et)
getName(getPointeeType(et))


#  Segfaults
#getName(cx[["CXCursor"]])
# getType(cx[["CXCursor"]])
#
# or 
# table(sapply(ds, function(x) getName(getType(x))))
