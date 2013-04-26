library(RCIndex)
h = genCallCollector()
parseTU("src/clang.c", h$update,
          args = c("-I/Users/duncan/Projects/R-3.0-dev/build/include",
                   "-I/Users/duncan/llvm-devel/tools/clang/include"))

k = h$calls()

load("clangFuncNames.rda") # all of the values
df = setdiff(clangFuncNames, grep("^clang_", k, value = TRUE))

length(df)

length(df)/length(clangFuncNames)

rgrp = split(df, gsub("(.*)_.*", "\\1", df))
gg = rgrp[ !grepl("Comment", names(rgrp))]
names(gg)
sapply(gg, length)

woComments = grep("Comment", df, invert = TRUE, value = TRUE)

