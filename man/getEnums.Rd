\name{getEnums}
\alias{getEnums}
\title{Get the top-level enumeration definitions in a translation unit}
\description{
}
\usage{
getEnums(src, visitor = genEnumCollector(), ...)
}
\arguments{
  \item{src}{either the name of a source file or an already parsed
    translation unit object}
  \item{visitor}{a function or S4/reference class object used as the
    visitor function passed to \code{\link{visitCursor}} to collect the
    enumeration definitions.}
  \item{\dots}{arguments passed \code{\link{createTU}} if \code{src} is
    the name of source file.}
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
