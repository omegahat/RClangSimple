\name{equalCursors}
\alias{equalCursors}
\alias{equalLocations}
\alias{equalRanges}
\alias{equalTypes}
\title{Functions to determine if two instances of a data type are the same}
\description{
  These functions test if two libclang objects are the same.
}
\usage{
equalCursors(arg1, arg2)
equalLocations(loc1, loc2)
equalRanges(range1, range2)
equalTypes(A, B)
}
\arguments{
   \item{arg1,arg2}{object of class \code{CXCursor}}
   \item{loc1,loc2}{object of class \code{CXSourceLocation}}
   \item{range1,range2}{object of class \code{CXRange}}
   \item{A,B}{object of class \code{CXType}}
}
\value{
  A logical value.
}
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
