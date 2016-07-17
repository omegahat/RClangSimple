\name{getDefines}
\alias{getDefines}
\title{Get preprocessor defines in a translation unit}
\description{
 This function collects pre-processor definitions in a source file or
 translation unit.
}
\usage{
getDefines(tu, col = genDefinesCollector(), ...)
}
\arguments{
   \item{tu}{the name of a source file or an already parsed
     translation unit}
   \item{col}{the collector/visitor  function or object of class
     \code{\link{S4CursorVisitor-class}} or \code{\link{RefCursorVisitor-class}}.}
   \item{...}{additional arguments that are passed to
     \code{\link{createTU}} to parse a source file}   
}
\value{
  A collection of cursors representing pre-processor definitions.
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
  \code{\link{getRoutines}},
  \code{\link{getGlobalVariables}},
  \code{\link{getDataStructures}},    
  \code{\link{getEnums}},
  \code{\link{getTypedefs}},
  \code{\link{getInclusions}}
}
%\examples{}
\keyword{programming}
\keyword{interface} 
