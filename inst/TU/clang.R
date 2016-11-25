library(RCIndex)



incs = "~/llvm-devel/tools/clang/include"
incs = path.expand("~/local/include")
incs = "~/LLVM3.8/clang+llvm-3.8.0-x86_64-apple-darwin/include"
incs = "/Users/duncan/LLVM3.9/clang+llvm-3.9.0-x86_64-apple-darwin/include"

#incs = path.expand("~/LLVM3.7/clang+llvm-3.7.0-x86_64-apple-darwin/include")

tu = createTU(sprintf("%s/clang-c/Index.h", incs), includes = path.expand(incs))

e = getEnums(tu)





