library(RCIndex)

incs = "~/llvm-devel/tools/clang/include"
incs = path.expand("~/local/include")

incs = path.expand("~/LLVM3.7/clang+llvm-3.7.0-x86_64-apple-darwin/include")

tu = createTU(sprintf("%s/clang-c/Index.h", incs), includes = incs)

e = getEnums(tu)





