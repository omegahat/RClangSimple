\name{isExpression}
\alias{isExpression}
\alias{isTranslationUnit}
\alias{isUnexposed}
\alias{isVirtualBase}
\alias{isPOD}
\alias{isStatement}
\alias{isDeclaration}

\alias{isDeclaration,CXCursor-method}
\alias{isDeclaration,CXCursorKind-method}

\alias{isExpression,CXCursor-method}
\alias{isExpression,CXCursorKind-method}

\alias{isPOD,CXCursor-method}
\alias{isPOD,CXType-method}

\alias{isStatement,CXCursor-method}
\alias{isStatement,CXCursorKind-method}
\alias{isTranslationUnit,CXCursor-method}
\alias{isTranslationUnit,CXCursorKind-method}

\alias{isUnexposed,CXCursor-method}
\alias{isUnexposed,CXCursorKind-method}

\alias{isVirtualBase,CXCursor-method}

\title{Tests for type of CXCursor}
\description{
  These functions allow us to test the type of a  CXCursor instance.
  Rather than looking at the individual kind, these functions
  are more high-level queries about collections of different
  kinds.
}
\usage{
isExpression(x, ...)
}

\arguments{
  \item{x}{a cursor}
  \item{\dots}{additional arguments for any methods}
}
\value{
A logical value (or numeric representing TRUE or FALSE).
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{Duncan Temple Lang}

%\seealso{}
%\examples{}
\keyword{programming}

