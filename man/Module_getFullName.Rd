\name{Module_getFullName}
\alias{Module_getFullName}
\alias{Module_getName}
\alias{Module_getNumTopLevelHeaders}
\alias{Module_getParent}
\alias{Module_getTopLevelHeader}
\alias{getModule}
\title{Functions for querying a libclang Module}
\description{
  These functions work with libclang Module objects.
}
\usage{
getModule(C)
Module_getFullName(Module)
Module_getName(Module)
Module_getNumTopLevelHeaders(arg1, Module)
Module_getParent(Module)
Module_getTopLevelHeader(arg1, Module, Index)
}
\arguments{
  \item{C}{a \code{CXCursor} object.}
   \item{Module}{a \code{CXModule} object}
   \item{arg1}{a translation unit}
   \item{Index}{an integer or numeric value}
}
%\value{}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
%\seealso{}
%\examples{}
\keyword{programming}
\keyword{interface} 
