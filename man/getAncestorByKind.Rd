\name{findAncestorByKind}
\alias{findAncestorByKind}
\alias{findEnclosingFunction}
\alias{findCursorNamespace}
\alias{findEnclosingNamespace}
\alias{findEnclosingClass}
\title{
Find the enclosing routine, C++ namespace, or cursor of a given kind
}
\description{
  These functions traverse up the AST to find the nearest ancestor
  cursor with a given cursor kind.
  This allows us to find the enclosing routine/function, C++ namespace,
  C++ class, if statement, etc.
}
\usage{
findAncestorByKind(cur, kind)
}

\arguments{
  \item{cur}{the \code{CXCursor} from which to start the search}
  \item{kind}{the cursor kind identifying which type of cursor for which we are looking.}
}
\value{
  The first matching ancestor \code{CXCursor}.
  
  \code{NULL} if no ancestor cursor corresponds to the target kind.
}
\author{
Duncan Temple Lang
}

\seealso{
\code{\link{createTU}}
}
\examples{
f = system.file("exampleCode/namespace.cpp", package = "RCIndex")
tu = createTU(f)

k = getCppClasses(tu)

m = k$Foo@methods$doit

ns = findEnclosingNamespace(m)

findEnclosingClass(m)
findAncestorByKind(m, CXCursor_ClassDecl)


c = findAssignTo(tu, "ctr")[[2]]
findEnclosingClass(c)

findEnclosingFunction(c)
}
\keyword{programming}
\concept{metaprogramming}
