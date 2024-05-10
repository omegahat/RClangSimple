\name{getFileName}
\alias{getFileName}
\alias{getFileTime}
\alias{getFileName,CXCursor-method}
\alias{getFileName,CXTranslationUnit-method}
\alias{getFileName,CXFile-method}
\alias{getFileName,CXSourceLocation-method}
\alias{getFileName,CXSourceRange-method}
\alias{getFileName,EnumerationDefinition-method}
\alias{getFileName,StructDescription-method}
\alias{getFileName,FunctionDecl-method}


\alias{cursorKind}

\alias{getName}
\alias{getName,CXCursor-method}
\alias{getName,CXType-method}
\alias{getName,CXFile-method}
\alias{getName,CXSourceLocation-method}
\alias{getName,CXSourceRange-method}
\alias{getName,NativeElement-method}
\alias{getName,StructDefinition-method}


\alias{getResultType}
\alias{getResultType,CXCursor-method}

\alias{coerce,CXCursor,CXType-method}
\alias{coerce,CXTranslationUnit,CXCursor-method}
\alias{getTranslationUnitCursor}

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
  \item{x,SFile}{a \code{CXFile} object or something that can be coerced
  to that class, e.g. a cursor, a translation unit.}
  \item{\dots}{additional arguments for methods}
}
\value{
  A string (character vector of length 1) giving the name of the file.
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
  \code{\link{getLocation}}
}
\examples{
f = system.file("exampleCode", "fib.c", package = "RCIndex")
tu = createTU(f)
getFileName(tu)
getFileName(as(tu, "CXCursor"))
}
\keyword{programming}
\keyword{interface}

