\name{getCursorTokens}
\alias{getCursorTokens}
\title{Get the text tokens corresponding to a CXCursor}
\description{
  This function allows us to obtain the text in the source
  code that corresponds to the \code{CXCursor} object,
   e.g. a routine or variable declaration, a call to a routine, etc.

  This allows us to obtain additional attributes of a routine
  such as __inline___, __host__, __device__, etc.
}
\usage{
getCursorTokens(cur)
}
\arguments{
  \item{cur}{the \code{CXCursor}}
}
\value{
  A character vector containing the tokens. The names
  of the elements are the types of the tokens,
  e.g. Punctuation, Identifier, Keyword, 
}
\author{
  Duncan Temple Lang, with code adapted from Carlos Andrade
  http://lists.cs.uiuc.edu/pipermail/cfe-dev/2012-June/022601.html
}

\seealso{
 \code{\link{visitCursor}},  \code{\link{parseTU}}
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

