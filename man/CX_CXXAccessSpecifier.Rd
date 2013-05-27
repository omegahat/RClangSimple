\name{CX_CXXAccessSpecifier}
\alias{CX_CXXAccessSpecifier}
\alias{CX_CXXAccessSpecifier-class}
 \alias{CX_CXXInvalidAccessSpecifier}
 \alias{CX_CXXPrivate}
 \alias{CX_CXXProtected}
 \alias{CX_CXXPublic}
\docType{data}
\title{Enumerations for C++ accessors}
\description{
  Enumeration values that identify whether a C++ field or method
  is private, protected or public.
}
\usage{CX_CXXAccessSpecifier}
\format{
  The format is:
 Named int [1:4] 0 1 2 3
 - attr(*, "names")= chr [1:4] "CX_CXXInvalidAccessSpecifier" "CX_CXXPublic" "CX_CXXProtected" "CX_CXXPrivate"
}
\source{
libclang API
}
\references{
   libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\examples{
CX_CXXAccessSpecifier
}
\keyword{datasets}
