\name{clone}
\alias{clone}
\alias{clone,CXCursor-method}
\alias{CXCursor-class}
\alias{length,CXCursor-method}
\alias{$,CXCursor-method}
\alias{[[,CXCursor,numeric,ANY-method}
\alias{[,CXCursor,logical,ANY-method}
\alias{[,CXCursor,numeric,ANY-method}
\alias{[,CXCursor,missing,ANY-method}
\alias{show,CXCursor-method}
\alias{lapply,CXCursor-method}
\alias{names,CXCursor-method}


\title{The \code{CXCursor} class}
\description{
  The \code{CXCursor} is one of the two primary
  data types in \code{RCIndex}.
  A cursor represents semantic information about an element
  of code. It might be a call expression, a binary operator,
  a C++ class definition, a variable declaration, a routine/function
  declaration/definition.
  Each cursor has a kind field that describes its purpose.
  The set of possible cursor kinds is available via the variable
  \code{CXCursorKind}. These are enumeration values with a symbolic name
  and a corresponding integer value used in C code.
}
\usage{
clone(x, ...)
}
\arguments{
  \item{x}{ the object to be cloned}
  \item{\dots}{additional parameters for the methods}
}
\value{
 \code{clone} returns a new object made from copying the input.
}
\references{
     libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
\code{\link{CXCursor-class}}
}
\examples{
f = system.file("exampleCode", "fib.c", package = "RCIndex")
r = getRoutines(f)
r$fib
cur = as(r$fib, "CXCursor")
cur[[1]]  # the ParmDecl
cur[[2]] # the body of the routine
cur[[2]][[2]] # the return
cur[[2]][[2]][[1]][[1]] # the BinaryOperator for fib(n-1) + fib(n-2)
getCursorTokens(cur[[2]][[2]][[1]][[1]]) #

bin = cur[[2]][[2]][[1]][[1]]
# get operator
toks = getCursorTokens(bin[[1]])
toks[length(toks)]

}
\keyword{programming}
\keyword{interface}
