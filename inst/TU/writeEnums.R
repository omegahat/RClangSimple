source("clang.R")


library(RCodeGen)

version = c(3, 7)
enums = e
ids = grep("(^__|::)", names(enums), invert = TRUE, value = TRUE) # remove llvm:: , std::, __lx
code = lapply(enums[ids], function(x) c(makeEnumClass(x), "", "", "#####################################"))

Rfilename = sprintf("../../R/a_enumDefs_%d.%d.R", version[1], version[2])
#con = file(Rfilename, "w")
cat("if(all(clangVersion(libclangVersion_Install) == c(", version[1], ", ", version[2], "))) {\n\n",
    unlist(code),
    "\n\n\n}\n\n",
    file = Rfilename, sep = "\n")

#sink(con)
#invisible(lapply(enums[ids], outputEnum))
#sink()

