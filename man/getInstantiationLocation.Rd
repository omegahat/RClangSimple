\name{getInstantiationLocation}
\alias{getInstantiationLocation}
\alias{getExpansionLocation}
\alias{getPresumedLocation}
\alias{getLocation}
\alias{getRange}
\alias{getNullLocation}
\alias{isInSystemHeader}
\alias{Location_isInSystemHeader}
\title{Functions involving Location information}
\description{
}
\usage{
getLocation(x, type = "Expansion")
getRange(begin, end)
getNullLocation()
isInSystemHeader(location)
}
\arguments{
   \item{x}{ a \code{CXSourceLocation} object or an object that can be
     coerced to this class, e.g. a \code{CXCursor}}
   \item{type}{a string, one of \code{Expansion}, \code{Instantiation}
     or \code{Presumed}}
   \item{begin,end,location}{a \code{CXSourceLocation} object}
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
  \code{\link{parseTU}}
  \code{\link{getRoutines}}  
}
\examples{
 f = system.file("exampleCode", "fib.c", package = "RCIndex")
 r = getRoutines(f)
 r$fib
 getLocation(r$fib)
}
\keyword{programming}
\keyword{interface} 
