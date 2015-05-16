library(RCIndex)

# Specify the directory that contains the clang-llvm installation, i.e. the bin/, lib/ directories containing
# libclang, include/clang-c
clangInstalledDir = path.expand("~/LLVM3.5/clang+llvm-3.5.0-macosx-apple-darwin")

parseTU("inst/exampleCode/fib.c", function(cur, parent)  if( cur$kind == CXCursor_CallExpr) print(getName(cur)))


parseTU("inst/exampleCode/fib.c", function(cur, parent)  if( cur$kind == CXCursor_CallExpr || cur$kind == CXCursor_BinaryOperator) print(getName(cur)))


# find what clang_ routines we have bindings for in clang.c

callCollector =
  function() {
    calls = character()
      function(cur, parent) {
      if(cur$kind == CXCursor_CallExpr)
         calls <<- c(calls, getName(cur))
     }
    }

h = callCollector()
parseTU("src/clang.c", h, args = c("-I/Users/duncan/Projects/R-3.0-dev/build/include", sprintf("-I%s/include", clangInstalledDir)))
k = environment(h)$calls
grep("^clang_", k, value = TRUE)




col = genEnumCollector()
parseTU(sprintf("%s/include/clang-c/Index.h", clangInstalledDir), col$update,
          args = sprintf("-I%s/include", clangInstalledDir))
enums = col$enums()

enums = enums[ names(enums) != "" ]
names(enums)
