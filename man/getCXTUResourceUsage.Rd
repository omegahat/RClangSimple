\name{getCXTUResourceUsage}
\alias{getCXTUResourceUsage}
\alias{getTUResourceUsage}
\title{Information about the resources a translation unit consumed}
\description{
  This function gets information about the different resources
  and how many of each parsing a translation unit consumed.
  These include items such as different types of memory,
  the number of expressions, etc.
}
\usage{
getCXTUResourceUsage(tu)
}
\arguments{
   \item{tu}{the \code{CXTranslationUnit} object or an object that can
     be coerced to a translation unit.}
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
  \code{\link{getCursorTranslationUnit}}
}
\examples{
f = system.file("exampleCode", "fib.c", package = "RCIndex")
tu = createTU(f)
getCXTUResourceUsage(tu)
}
\keyword{programming}
\keyword{interface} 
