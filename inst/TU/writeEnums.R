source("clang.R")


library(RCodeGen)

if(!exists("version", globalenv()))
  version = c(3, 5)
enums = e
ids = grep("(^__|::)", names(enums), invert = TRUE, value = TRUE) # remove llvm:: , std::, __lx
code = lapply(enums[ids], function(x) c(makeEnumClass(x), "", "", "#####################################"))

Rfilename = sprintf("../../R/a_enumDefs_%d.%d.R", version[1], version[2])
#con = file(Rfilename, "w")
cat(paste("if(all(clangVersionNum(libclangVersion_Install) == c(", version[1], ", ", version[2], "))) {\n\n", collapse = " "),
    unlist(code),
    "\n\n\n}\n\n",
    file = Rfilename, sep = "\n")

#sink(con)
#invisible(lapply(enums[ids], outputEnum))
#sink()

