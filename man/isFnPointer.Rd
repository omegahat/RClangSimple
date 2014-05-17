\name{isFnPointer}
\alias{isFnPointer}
\alias{getFnPointerInfo}
\title{Queries function/routine pointer object}
\description{
  These functions allow us to determine if a \code{CXType}
  is a function pointer, and to get the information about the
  function pointer type.
}
\usage{
isFnPointer(x)
getFnPointerInfo(field, cur = NULL,
                 toks = if(!is.null(cur))
                           sapply(children(cur), getCursorTokens),
                 useCanonical = FALSE) 
}
\arguments{
  \item{x}{the \code{CXType} being queried to determine if it is a function pointer type.}
  \item{field}{a \code{CXType} which is a C-level function pointer}
  \item{cur}{the \code{CXCursor} associated with the \code{field} \code{CXType}}
  \item{toks}{a list of the \code{CXCursor} objects within the \code{cur} cursor.}
  \item{useCanonical}{a logical value controlling whether we use the
    canonical type or high-level type.
     If this is \code{TRUE}, when we get the type for the pointer, we
     get the canonical version of this, i.e. ignore typedefs/aliases.
  }  
}
\value{
  An instance of an \code{S3} class named \code{FunctionPointerInfo}
  which is a list with two elements:
  \item{returnType}{the return type of the function type}
  \item{params}{the list of the parameter types of the function type}
}
\references{
libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}  
}
\author{Duncan Temple Lang}

\seealso{
  \code{\link{getType}}
}
\examples{
v = getVariables(system.file("exampleCode", "funPointer.c", package = "RCIndex"))
isFnPointer(getType(v$fun))
}
\keyword{programming}
\keyword{interface}
