\name{getArgType}
\alias{getArgType}
\alias{getArgsType}
\alias{getNumArgTypes}
\title{Types of function parameter/arguments}
\description{
  These functions allow us to get the types associated
  with parameters/arguments of routine/function types in C/C++ code.
  These are typically used when we have a function/routine pointer type
  and so have an explicit type. This is different from when we have a
  routine and we can access the parameters differently.
}
\usage{
getArgType(ty, i)
getNumArgTypes(ty)
getArgsType(ty)
}
\arguments{
  \item{ty}{the \code{CXType} corresponding to the routine for
    \code{getArgsType} and \code{getNumArgTypes} and to the parameter
    itself in \code{getArgType}}
  \item{i}{the index of the argument, 1-based}
}
\value{
 An object of class \code{CXType} or an invalid type.
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{Duncan Temple Lang}

\seealso{
  \code{\link{getRoutines}}
}
\examples{
ds = getDataStructures(system.file("exampleCode", "funPointer.c",  package = "RCIndex"))
    # _Foo is a struct with a collection of fields. f is one of the names
    # and this is a function pointer.
    # Bob (*f)(int x, double y, Handler h, void (*p)(int, double));
    # _Foo and Foo are different - the latter is the typedef
foo = ds$`_Foo`  
    # So we get the CXType for the function type.
fun = getPointeeType(foo@fields$f)

    # get rid of any aliases.
ty = getCanonicalType(fun)

    # how many parameters are there in the function type
getNumArgTypes(ty)
    # get the types for each parameter
getArgsType(ty)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{programming}
\keyword{interface} 