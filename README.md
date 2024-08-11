# RCIndex


This package is an R interface to libclang's C interface.
This allows us to parse C & C++ code and access its elements directly in R.  

We can use this for various purposes described in the Paper/ directory
which also describes how to use the functions, including 

+ static code analysis and the many aspects of that
+ generating interfaces to native code
+ ...


We can also do static code analysis on native code using the [Rllvm](https://github.com/duncantl/Rllvm) package.


# Installation

See INSTALL.md for information about how to install the package.


# Some Functions

+ getRoutines()
+ getEnums()
+ getGlobalVariables()
+ findGlobals()
+ findIncludes()

+ createTU()



## URLS
https://clang.llvm.org/docs/IntroductionToTheClangAST.html
