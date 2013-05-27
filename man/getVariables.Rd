\name{getVariables}
\alias{getVariables}
\alias{findGlobalUse}
\title{Find variables in a translation unit and where global variables
  are referenced}
\description{
  These find variables being used in the translation unit.
}
\usage{
getVariables(file, visitor = genVariablesCollector(), ...)
findGlobalUse(tu, visitor = globalUseVisitor(), ...)
}
\arguments{
   \item{file,tu}{the name of a source file or an already parsed
     translation unit}
   \item{visitor}{a visitor function or visitor object of class
     \code{\link{S4Visitor-class}} or \code{\link{RefVisitor-class}}.}
   \item{...}{additional arguments that are passed to
     \code{\link{createTU}} to parse a source file}
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
