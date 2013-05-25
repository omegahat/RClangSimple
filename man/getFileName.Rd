\name{getFileName}
\alias{getFileName}
\alias{getFileTime}
\alias{getFileName,CXCursor-method}
\alias{getFileName,CXTranslationUnit-method}
\alias{getFileName,CXFile-method}
\alias{getFileName,CXSourceLocation-method}
\alias{getFileName,CXSourceRange-method}

\alias{cursorKind}

\alias{getName}
\alias{getName,CXCursor-method}
\alias{getName,CXType-method}
\alias{getName,CXFile-method}
\alias{getName,CXSourceLocation-method}
\alias{getName,CXSourceRange-method}
\alias{getName,FunctionDecl-method}

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
getFileTime(SFile) 
}
\arguments{
  \item{x,SFile}{}
  \item{\dots}{}
}
\value{
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
}
\examples{
}
\keyword{programming}
\keyword{interface}

