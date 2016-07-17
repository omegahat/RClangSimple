\name{getDataStructures}
\alias{getDataStructures}
\alias{getStructDef}
\alias{getTypedefs}
\alias{genTypedefCollector}
\title{Get the top-level data types in a translation unit}
\description{
  This function retrieves descriptions of the data
  structures defined in a source file or translation unit.
  This includes unions, structs and typedefs.
}
\usage{
getDataStructures(src, collector = genDataStructCollector(), ...)
getStructDef(type, kids = children(tp), class = "StructDefinition")
getTypedefs(src, filenames = TRUE, col = genTypedefCollector(),  ...)
}
\arguments{
  \item{src}{the already created CXTranslationUnit object, or the name
    of the source file}
   \item{collector,col}{a visitor function or visitor object of class
     \code{\link{S4CursorVisitor-class}} or \code{\link{RefCursorVisitor-class}}.}
  \item{\dots}{any additional arguments passed to \code{\link{createTU}}
  if \code{src} is not already a \code{CXTranslationUnit}.}
   \item{type}{the \code{CXCursor}  defining a data type}
   \item{kids}{the collection of cursors defining the elements of the
     data type}
   \item{class}{the name of the class for the object we are
     creating. Either \code{"StructDefinition"} or \code{"UnionDefinition"} or a the name
     of a subclass.}
   \item{filenames}{not implemented yet!}
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
%\examples{}
\keyword{programming}
\keyword{interface} 
