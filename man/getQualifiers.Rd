\name{getQualifiers}
\alias{getQualifiers}
\title{Get the qualifying annotations for a cursor}
\description{
  This function allows us to query a cursor's annotations
  such as \code{const}.
}
\usage{
getQualifiers(cur)
}
\arguments{
  \item{cur}{the \code{CXCursor} instance}
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
}
\examples{
}
\keyword{programming}
\concept{meta-programming}
\concept{reflection}
