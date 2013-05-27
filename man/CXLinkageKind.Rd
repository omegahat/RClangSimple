\name{CXLinkageKind}
\alias{CXLinkageKind}
\alias{CXLinkage_External}
 \alias{CXLinkage_Internal}
 \alias{CXLinkage_Invalid}
 \alias{CXLinkage_NoLinkage}
 \alias{CXLinkage_UniqueExternal}
 \alias{CXLinkage-class}
  \alias{CXLinkageKind-class}
\docType{data}
\title{Enumerations for different types of native/foreign linkage}
\description{
  These are enumeration values identifying the type of
  linkage of native code/symbols. 

}
\usage{CXLinkageKind}
\format{
  The format is:
 Named int [1:5] 0 1 2 3 4
 - attr(*, "names")= chr [1:5] "CXLinkage_Invalid" "CXLinkage_NoLinkage" "CXLinkage_Internal" "CXLinkage_UniqueExternal" ...
}

\source{
libclang API
}
\references{
   libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\examples{
CXLinkageKind
}
\keyword{datasets}
