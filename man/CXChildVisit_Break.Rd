\name{CXChildVisit_Break}
\alias{CXChildVisit_Break}
\alias{CXChildVisit_Continue}
\alias{CXChildVisit_Recurse}
\title{Enumerations for controlling how traversing a parse tree is done}
\description{
  These are enumeration values that are used when returning a value from
  a visitor function used to iterate over CXCursor elements within
  a parse tree. One returns \code{CXChildVisit_Break} to terminate
  the processing of the tree.
  Alternatively, one returns \code{CXChildVisit_Continue} to
  process only the sibling nodes of the current one.
  And to recursively process all the sub-cursors and
  the sibling cursors we return
  \code{CXChildVisit_Recurse}.
}
\usage{CXChildVisit_Break}
\format{
  The format is:
 num 0
}
\references{
  libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\examples{
CXChildVisit_Break
}
\keyword{datasets}
