# source("clang.R")

library(RCodeGen)

version = c(3, 7)
enums = e
ids = grep("(^__|::)", names(enums), invert = TRUE, value = TRUE) # remove llvm:: , std::, __lx
Rfilename = sprintf("../../R/z_enumDefs_%d.%d.R", version[1], version[2])
con = file(Rfilename, "w")
sink(con)
cat("if(all(clangVersion() == c(", version[1], ", ", version[2], "))) {\n\n")
invisible(lapply(enums[ids], outputEnum))
cat("\n\n\n}\n\n")
sink()

