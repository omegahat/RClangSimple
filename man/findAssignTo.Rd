\name{findAssignTo}
\alias{findAssignTo}
\title{
Find variable declarations and assignments.
}
\description{
  This finds the variable declarations and assignments to variables in
  an abstract syntax tree.
}
\usage{
findAssignTo(cur, var = character(), collector = genDeclAssignCollector())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cur}{the starting \code{CXCursor}}
  \item{var}{a character vector of zero or more variable names. If this is non-empty, only
    declarations and assignments to variables in this vector are included in the result.}
  \item{collector}{the closures that collect the assignments/declarations as we iterate over the
    abstract syntax tree.}
}

\value{
A list of zero or more \code{CXCursor} objects.
}

\author{
Duncan Temple Lang
}


\seealso{
  \code{\link{createTU}}
  \code{\link{getVariables}}
}
\examples{
}


\keyword{programming}
\concept{metaprogramming}

