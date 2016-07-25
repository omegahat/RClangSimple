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
getDataStructures(src, fileFilter = character(), collector = genDataStructCollector(), ...)
getStructDef(type, kids = children(tp), class = "StructDefinition")
getTypedefs(src, fileFilter = character(), col = genTypedefCollector(),  ...)
}
\arguments{
  \item{src}{the already created CXTranslationUnit object, or the name
    of the source file}
   \item{collector,col}{a visitor function or visitor object of class
     \code{\link{S4CursorVisitor-class}} or
     \code{\link{RefCursorVisitor-class}}.}
  \item{fileFilter}{
    a character vector. This is used to identify the files/directories
    of interest and to identify the cursors we want in the results.
    This can be a single string that is a regular expression.
    Alternatively, it can be a vector of directory or file names.
    For a vector of values, we check which correspond to actual file or
    directory names.
    For these, we filter the cursors based on whether they are in the
    specified file names, within files in the specified directories.
    For elements that are not files or directories, we use these as
    regular expressions.
    This mechanism allows us to include cursors by explicit file name,
    explicit directory, or by regular expression.
  } 
  \item{\dots}{any additional arguments passed to \code{\link{createTU}}
  if \code{src} is not already a \code{CXTranslationUnit}.}
   \item{type}{the \code{CXCursor}  defining a data type}
   \item{kids}{the collection of cursors defining the elements of the
     data type}
   \item{class}{the name of the class for the object we are
     creating. Either \code{"StructDefinition"} or \code{"UnionDefinition"} or a the name
     of a subclass.}
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
f = system.file("exampleCode", "funPointer.c", package = "RCIndex")
ds = getDataStructures(f)
names(ds)
sapply(ds, class)
ds$Bob

ff = ds$`_Foo`@fields
names(ff)
sapply(ff, getName)
}
\keyword{programming}
\keyword{interface} 
