\name{getFileName}
\alias{getFileName}
\alias{getFileName,CXCursor-method}
\alias{cursorKind}

\alias{getName}
\alias{getName,CXCursor-method}
\alias{getResultType}
\alias{getResultType,CXCursor-method}

\alias{coerce,CXCursor,CXType-method}
\alias{coerce,CXTranslationUnit,CXCursor-method}

\alias{clone}
\alias{clone,CXCursor-method}
\alias{CXCursor-class}
\alias{$,CXCursor-method}


\title{CXCursor class and related methods}
\description{
  These functions operate on CXCursor objects and
  allow us to query the type and content of the generic cursor.

  A CXCursor object is a reference to a C data structure.
  While it is an opaque data type, we can treat it as a list
  to access some of its attributes/elements.
  The \code{$} operator applied to a \code{CXCursor}
  allows us to access the "kind", "type", "language",
  "linkage", and "cxxSpecifier".
}
\usage{
getFileName(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{

}
\references{

}
\author{

}
\note{

}


\seealso{

}
\examples{

}
\keyword{programming}

