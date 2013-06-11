\name{getGlobalVariables}
\alias{getGlobalVariables}
\alias{findGlobals}
\title{Get global variables in a source file}
\description{
  \code{getGlobalVariables} finds the global variables in a source file
  or translation unit.

  \code{findGlobals} finds the use of non-local variables in a
  translation unit, routine  or expression.
}
\usage{
getGlobalVariables(tu, visitor = genGlobalVariablesCollector(), ...)
}
\arguments{
  \item{tu}{either the name of a source file or an already parsed
    translation unit object}
  \item{visitor}{a function or S4/reference class object used as the
    visitor function passed to \code{\link{visitCursor}} to collect the
    enumeration definitions.}  
  \item{\dots}{arguments passed \code{\link{createTU}} if \code{src} is
    the name of source file.}
}
\value{
  A list of the global variables.
}
\seealso{
  \code{\link{getRoutines}},
  \code{\link{getCppClasses}},
  \code{\link{getDataStructures}},  
  \code{\link{getEnums}},
  \code{\link{getInclusions}}    
}
\examples{
f = system.file("exampleCode", "globalUse.c",  package = "RCIndex")
getGlobalVariables(f)
}
\keyword{programming}
\keyword{interface}
