\name{getArraySize}
\alias{getArraySize}
\alias{getArrayElementType}
\alias{getNumElements}
\alias{getElementType}
\title{Get information about container types}
\description{
  These functions allow us to query information about
  a container type, i.e. an array.
}
\usage{
getArraySize(T)
getArrayElementType(T)
getNumElements(T)
getElementType(T)
}
\arguments{
   \item{T}{the \code{CXType} object being queried}
}
\value{
  an number or a \code{CXType}
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
  \code{\link{getType}}
 \code{\link{getPointeeType}}  
}
%\examples{}
\keyword{programming}
\keyword{interface} 
