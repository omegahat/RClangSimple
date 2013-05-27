\name{getDataStructures}
\alias{getDataStructures}
\alias{getStructDef}
\title{Get the top-level data types in a translation unit}
\description{
  This function retrieves descriptions of the data
  structures defined in a source file or translation unit.
}
\usage{
getDataStructures(src, collector = genDataStructCollector(), ...)
getStructDef(type, kids = children(tp))
}
\arguments{
  \item{src}{the already created CXTranslationUnit object, or the name
    of the source file}
   \item{collector}{a visitor function or visitor object of class
     \code{\link{S4Visitor-class}} or \code{\link{RefVisitor-class}}.}
  \item{\dots}{any additional arguments passed to \code{\link{createTU}}
  if \code{src} is not already a \code{CXTranslationUnit}.}
   \item{type}{the \code{CXCursor}  defining a data type}
   \item{kids}{the collection of cursors defining the elements of the
     data type}
}
%\value{}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
  \code{\link{getRoutines}},
  \code{\link{getGlobalVariables}},
  \code{\link{getCppClasses}},    
  \code{\link{getEnums}},
  \code{\link{getInclusions}}        
}
\examples{
}
\keyword{programming}
\keyword{interface} 
