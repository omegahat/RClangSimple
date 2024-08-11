# RCIndex


This package is an R interface to libclang's C interface.
This allows us to parse C & C++ code and access its elements directly in R.  

We can use this for various purposes described in the Paper/ directory
which also describes how to use the functions, including 

+ find routines and their signatures,
+ get data structures,
+ get C++ classes and methods,
+ list enum types and values,
+ static code analysis and the many aspects of that,
   + call graphs,
   + use of non-local variables,
   + ...
+ generating interfaces to native code,
+ get precise location of specific code elements,
+ ...


We can also do static code analysis on native code using the [Rllvm](https://github.com/duncantl/Rllvm) package.


# Installation

See INSTALL.md for information about how to install the package.


# Some Functions

While there are many functions (~191 exported) in the package, some of the high-level functions are

+ getRoutines()
+ getEnums()
+ getGlobalVariables()
+ getCppClasses()
+ getDataStructures()
+ getTypedefs()
+ getType()
+ findIncludes()
+ findGlobals()

+ createTU()
+ visitTU(), visitCursor()
+ findCalls()



## URLS
https://clang.llvm.org/docs/IntroductionToTheClangAST.html
