\name{CXLanguageKind}
\alias{CXLanguageKind}
\alias{CXLanguage_C}
 \alias{CXLanguage_CPlusPlus}
 \alias{CXLanguage_Invalid}
 \alias{CXLanguage_ObjC}
 \alias{CXLanguage-class}
 \alias{CXLanguageKind-class}
\docType{data}
\title{Enumerations for different programming languages in C parser}
\description{
  These are enumeration values that identify the language associated
  with a particular parse element in the native code.
}
\usage{CXLanguageKind}
\format{
  The format is:
 Named int [1:4] 0 1 2 3
 - attr(*, "names")= chr [1:4] "CXLanguage_Invalid" "CXLanguage_C" "CXLanguage_ObjC" "CXLanguage_CPlusPlus"
}
\source{
clang API
}
\references{
  libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\examples{
CXLanguageKind
}
\keyword{datasets}
