\name{getTypeKind}
\alias{getTypeKind}
\alias{getTypeKind,CXType-method}
\alias{getTypeKind,CXCursor-method}
\alias{getTypeDecl,ANY-method}
\alias{getTypeKind,CXType-method}
\alias{getResultType,CXType-method}
\alias{getCanonicalType,CXCursor-method}
\alias{getCanonicalType,CXType-method}
\alias{CXType-class}
\alias{$,CXType-method}
\alias{clone,CXType-method}
\alias{getTypeDecl,CXType-method}

\alias{getPointeeType}
\alias{getTypeDecl}
\alias{getTypeDeclaration}
\alias{getCanonicalType}
\title{CXType class and methods}
\description{
  These functions operate on CXType objects and allow
  us to query the nature of the CXType instance.
}
\usage{
getTypeKind(type, ...)
}
\arguments{
  \item{type}{a \code{CXType} object}
  \item{\dots}{additional arguments for methods}
}

\value{
  \code{getTypeKind} returns an named integer with the name giving the
  symbolic kind and the value representing the C-level enumeration value
  for the kind.
}
\seealso{
  \code{\link{getType}}
}
%\examples{}
\keyword{programming}
