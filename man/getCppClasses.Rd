\name{getCppClasses}
\alias{getCppClasses}
\alias{readCppClass}
\title{Retrieve information about C++ classes}
\description{
  These functions obtain information about C++ classes in a source
  file or translation unit.
}
\usage{
getCppClasses(tu, nodesOnly = FALSE, visitor = genCppClassCursorCollector(), ...)
}
\arguments{
  \item{tu}{either the name of a source file or an already parsed
    translation unit object}
  \item{nodesOnly}{a logical value that controls whether we just want
    the cursors for the C++  class definitions or whether we want full
    descriptions of the classes.}
  \item{visitor}{a function or S4/reference class object used as the
    visitor function passed to \code{\link{visitCursor}} to collect the
    enumeration definitions.}  
  \item{\dots}{arguments passed \code{\link{createTU}} if \code{src} is
    the name of source file.}
}
\value{
  A named list of \code{C++Class} objects.
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
  \code{\link{getInclusions}}        
}
\examples{
f = system.file("exampleCode", "simpleClass.cpp", package = "RCIndex")
kl = getCppClasses(f)
names(kl)
}
\keyword{programming}
\keyword{interface}