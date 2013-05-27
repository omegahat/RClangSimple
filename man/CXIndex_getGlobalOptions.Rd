\name{CXIndex_getGlobalOptions}
\alias{CXIndex_getGlobalOptions}
\alias{CXIndex_setGlobalOptions}
\title{Get/Set options in a CXIndex object managing one or more
  translation units}
\description{
  Functions for querying and setting options for libclang's CXIndex
  objects.  Thes are not typically of interest to us in R. 
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
  The get method returns an numeric value.
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
