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
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
CXTokenKind
## maybe str(CXTokenKind) ; plot(CXTokenKind) ...
}
\keyword{datasets}
