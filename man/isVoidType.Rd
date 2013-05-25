\name{isVoidType}
\alias{isVoidType}
\alias{isConstQualifiedType}
\alias{isFunctionTypeVariadic}
\alias{isIntegerType}
\alias{isPODType}
\alias{isPointerType}
\alias{isRestrictQualifiedType}
\alias{isStringType}
\alias{isVolatileQualifiedType}

\title{Predicate functions for libclang Types}
\description{
  These functions are simple helpers for quering if a libclang
  type is a particular type or has a particular characteristic.
  Some of these are direct interfaces to native routines in libclang
  while others are functions whose logic is implemented in R.
}
\usage{
isVoidType(type)
isConstQualifiedType(T)
isFunctionTypeVariadic(T)
isIntegerType(type)
isPODType(T)
isPointerType(type)
isRestrictQualifiedType(T)
isStringType(type)
isVolatileQualifiedType(T)
}
\arguments{
  \item{type,T}{the libclang type}
}
\value{
 A logical value
}
\references{
 libclang
}
\author{
Duncan Temple Lang
}
\seealso{
  \code{\link{isSEXP}}
  \code{\link{getDataStructures}}
  \code{\link{getRoutines}}  
}
\examples{}
\keyword{programming}
\keyword{interface}
