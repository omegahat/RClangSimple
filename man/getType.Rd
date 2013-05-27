\name{getType}
\alias{getType}
\alias{getSizeOf}
\alias{Type_getAlignOf}
\alias{Type_getOffsetOf}
\alias{getAlignOf}
\alias{getOffsetOf}
\alias{getFunctionTypeCallingConv}
\title{Get the type of a CXCursor object}
\description{
  Functions dealing with \code{CXType} objects.
}
\usage{
getType(x)
getSizeOf(T)
getFunctionTypeCallingConv(T)
}
\arguments{
  \item{x}{the CXCursor object}
  \item{T}{the CXType object}
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
