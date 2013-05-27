\name{children}
\alias{children}
\alias{getChildren}

\title{Get the CXCursor children of a CXCursor object}
\description{
  A \code{CXCursor} object in the C parser is an object that
  can represent different types of elements in the parse
  tree such as statements, expressions, variables, function calls, etc.
  A cursor can have sub-children which provide the information about
  their parent. For example, a function call cursor would
  have the name of the function being called and the arguments in the call.
}
\usage{ 
children(top, types = integer())
getChildren(x)
}
\arguments{
  \item{top,x}{the cursor or an object that can be coerced to a cursor,
      e.g. translation unit }
  \item{types}{the set of CXCursorKind values of the type of cursors we
    want.}
}
%\value{}

\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}

\seealso{
  \code{\link{CXCursor-class}}
}
%\examples{}
\keyword{programming}
\keyword{interface}
