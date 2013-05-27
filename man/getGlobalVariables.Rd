\name{getGlobalVariables}
\alias{getGlobalVariables}
\title{Get global variables in a source file}
\description{
  This function finds the global variables in a source file
  or translation unit.
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
