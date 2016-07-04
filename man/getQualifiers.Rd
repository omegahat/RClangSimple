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
A named logical vector, currently with elements nameds \code{static} and \code{const}.
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
 f = system.file("exampleCode", "const.c", package = "RCIndex")
 tu = createTU(f)
 top = as(tu, "CXCursor")
 getQualifiers(top[[1]][[1]]) # const char * x
 getQualifiers(top[[1]][[1]]) # const char * x
 getQualifiers(top[[2]][[1]]) # const char * const x
}
\keyword{programming}
\concept{meta-programming}
\concept{reflection}
