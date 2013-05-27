\name{isPreprocessing}
\alias{isPreprocessing}
\alias{isAttribute}
\alias{isInvalid}
\alias{isReference}
\title{Predicates for CXCursorKind objects}
\description{
These are functions that allow us query if a given cursor kind
represents a particular characteristic. This is short hand for
checking the kind against a particular set.
}
\usage{
isPreprocessing(arg1)
isAttribute(arg1)
isInvalid(arg1)
isReference(arg1)
}
\arguments{
   \item{arg1}{the CXCursorKind value (integer)}
}
\value{
   a logical value
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
