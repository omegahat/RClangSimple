\name{CXIndex_getGlobalOptions}
\alias{CXIndex_getGlobalOptions}
\alias{CXIndex_setGlobalOptions}
\title{Get/Set options in a CXIndex object managing one or more
  translation units}
\description{
}
\usage{
CXIndex_getGlobalOptions(arg1)
CXIndex_setGlobalOptions(arg1, options)
}
\arguments{
   \item{arg1}{the CXIndex object whose options are being queried or set}
   \item{options}{the value for the options. This is a combination of
     CXGlobalOptFlags enum values. One can specify them as a vector or
     explicitly \code{|}'ing the values together.}
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
