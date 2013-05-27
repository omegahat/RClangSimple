\name{getInclusions}
\alias{getInclusions}
\title{Collect all of the include files for a source file}
\description{
}
\usage{
getInclusions(file, fun = genInclusionCollector(), ...)
}
\arguments{
   \item{file}{the name of a source file or a previously parsed translation unit}
   \item{fun}{a visitory function or object used to process the
     callbacks by libclang.}
   \item{...}{additional arguments that are passed to
     \code{\link{createTU}} if \code{file} is a file name and not a
     translation unit.}
}
\value{
  a collection of the included files.
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
