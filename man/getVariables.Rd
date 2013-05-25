\name{getVariables}
\alias{getVariables}
\alias{findGlobalUse}
\title{Find variables in a translation unit and where global variables
  are referenced}
\description{
}
\usage{
getVariables(file, visitor = genVariablesCollector(), ...)
findGlobalUse(tu, visitor = globalUseVisitor(), ...)
}
\arguments{
   \item{file}{}
   \item{visitor}{}
   \item{...}{}
   \item{tu}{}
}
\value{
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
}
\examples{
}
\keyword{programming}
\keyword{interface} 
