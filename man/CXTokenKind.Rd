\name{CXTokenKind}
\alias{CXTokenKind}
\alias{CXToken_Comment}
 \alias{CXToken_Identifier}
 \alias{CXToken_Keyword}
 \alias{CXToken_Literal}
 \alias{CXToken_Punctuation}
 \alias{CXToken-class}
\docType{data}
\title{Enumerations for different types of C parser tokens}
\description{
  These are enumeration values for the different types of tokens in the
  clang C/C++ parser.
}
\usage{CXTokenKind}
\format{
  The format is:
 Named int [1:5] 0 1 2 3 4
 - attr(*, "names")= chr [1:5] "CXToken_Punctuation" "CXToken_Keyword" "CXToken_Identifier" "CXToken_Literal" ...
}
\source{
libclang API
}
\references{
   libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\examples{
CXTokenKind
}
\keyword{datasets}
