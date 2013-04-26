library(RCIndex)

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
parseTU("src/clang.c", h, args = c("-I/Users/duncan/Projects/R-3.0-dev/build/include", "-I/Users/duncan/llvm-devel/tools/clang/include"))
k = environment(h)$calls
grep("^clang_", k, value = TRUE)




col = genEnumCollector()
parseTU("~/llvm-devel/tools/clang/include/clang-c/Index.h", col$update,
          args = '-I/Users/duncan/llvm-devel/tools/clang/include/')
enums = col$enums()

enums = enums[ names(enums) != "" ]
