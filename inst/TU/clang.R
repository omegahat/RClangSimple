library(RCIndex)

incs = "~/llvm-devel/tools/clang/include"
incs = path.expand("~/local/include")
tu = createTU(sprintf("%s/clang-c/Index.h", incs), includes = incs)


#invisible(sapply(list.files("~/GitWorkingArea/RCodeGen/R", pattern = "[RS]$", full.names = TRUE), source))
library(RCodeGen)

e = getEnums(tu)





