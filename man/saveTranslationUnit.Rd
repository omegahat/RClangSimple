\name{saveTranslationUnit}
\alias{saveTranslationUnit}
\alias{defaultSaveOptions}

\title{Save a parsed translation unit}
\description{
}
\usage{
saveTranslationUnit(TU, FileName, options = 0)
defaultSaveOptions(TU)
}
\arguments{
  \item{TU}{a translation unit object. This is rarely specified by the
    caller but created implicitly via \code{\link{createTU}}.}
  \item{FileName}{the fully-qualified name of the source code file}
  \item{options}{options for saving the translation unit. This is a
  collection of values fromthe CXSaveTranslationUnit_Flags object, but
  this is should always be 0 at present}  
}

\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\value{
}

\author{Duncan Temple Lang}
\seealso{
 \code{\link{createTU}}
}
\keyword{programming}
\keyword{interface}
