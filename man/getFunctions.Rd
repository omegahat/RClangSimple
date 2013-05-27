\name{getFunctions}
\alias{getFunctions}
\alias{getRoutines}
\alias{show,FunctionDecl-method}

\title{Get descriptions of the routines in a translation unit}
\description{
  These synonomous functions retrieve a description of each
  top-level native routine in the target source code, i.e. the
  translation unit.
}
\usage{
getFunctions(src, filenames = TRUE, col = genFunctionCollector(filenames), expectedNum = 500, ...)
}
\arguments{
  \item{src}{the already created CXTranslationUnit object, or the name
    of the source file}
  \item{filenames}{a logical value or a a character vector giving file names from which you
    want the routines. If this is specified, routines defined in other
    files are not returned. So this is a way to filter the results.
    \code{FALSE} means include all routines.  \code{TRUE} means only
    routines in the source file identified by \code{src}.
  }
  \item{col}{the collector function. This is only used if
    \code{filenames} is specified}
  \item{expectedNum}{the expected number of routines. This should be
    at least as larger than the }
  \item{\dots}{any additional arguments passed to \code{\link{createTU}}
  if \code{src} is not already a \code{CXTranslationUnit}.}
}
\value{
  A named list of  objects describing a native routine.
  Each element is currently of class \code{FunctionDecl}.
}
\references{
  libclang
}
\author{
Duncan Temple Lang
}

\seealso{
  \code{\link{createTU}}, \code{\link{parseTU}},
  \code{\link{getEnums}},   \code{\link{getDataStructures}},
  \code{\link{visitCursor}}
}
\examples{
src = system.file("exampleCode", "func.c", package = "RCIndex")
r = getRoutines(src)
r
names(r)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{interface}
\keyword{programming} 
