library(RCIndex)
h = genDataStructCollector()

# Specify the directory that contains the clang-llvm installation, i.e. the bin/, lib/ directories containing
# libclang, include/clang-c
clangInstalledDir = path.expand("~/LLVM3.5/clang+llvm-3.5.0-macosx-apple-darwin")

parseTU(sprintf("%s/include/clang-c/Index.h", clangInstalledDir), h@update,
          args = sprintf("-I%s/include", clangInstalledDir))
ds = h@results()
cx = ds[ grep("^CX", names(ds), value = TRUE) ]


#d = getStructDef(ds[["CXSourceRange"]])
d = ds[["CXSourceRange"]]
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
