\name{saveTranslationUnit}
\alias{saveTranslationUnit}
\alias{defaultSaveOptions}

\title{Save a parsed translation unit}
\description{
\code{saveTranslationUnit} writes a parsed translation unit into a serialized representation of
that translation unit to a file that can then be reread back into
memory.
In many cases, we can just recreat the translation unit from the source
code. However, this provides a way to work without the source code,
parser options and command line arguments.

The translation unit needs to have been created without any errors.

We query the set of flags for saving a  translation unit via
\code{defaultSaveOptions}.
This is a value we can pass via the \code{options} parameter of \code{saveTranslationUnit}.
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
  \code{saveTranslationUnit}  returns a \code{CXSaveError} error
  indicating success or the nature of the error.

  \code{defaultSaveOptions} returns an integer value.
}

\author{Duncan Temple Lang}
\seealso{
 \code{\link{createTU}}
}
\keyword{programming}
\keyword{interface}
