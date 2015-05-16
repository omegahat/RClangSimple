library(RCIndex)

# Specify the directory that contains the clang-llvm installation, i.e. the bin/, lib/ directories containing
# libclang, include/clang-c
clangInstalledDir = path.expand("~/LLVM3.5/clang+llvm-3.5.0-macosx-apple-darwin")

h = genCallCollector()
parseTU("src/clang.c", h$update,
          args = c("-I/Users/duncan/Projects/R-3.0-dev/build/include",
                   sprintf("-I%s/include", clangInstalledDir)))


k = h$calls()

load("clangFuncNames.rda") # all of the values
df = setdiff(clangFuncNames, grep("^clang_", k, value = TRUE))

length(df)

length(df)/length(clangFuncNames)

# Group these by name.
rgrp = split(df, gsub("(.*)_.*", "\\1", df))
gg = rgrp[ !grepl("Comment", names(rgrp))]
names(gg)
sapply(gg, length)

woComments = grep("Comment", df, invert = TRUE, value = TRUE)

