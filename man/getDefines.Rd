\name{getDefines}
\alias{getDefines}
\title{Get preprocessor defines in a translation unit}
\description{
 This function collects pre-processor definitions in a source file or
 translation unit.
}
\usage{
getDefines(tu, fileFilter = character(), col = genDefinesCollector(),
           options = CXTranslationUnit_DetailedPreprocessingRecord, ...)
}
\arguments{
   \item{tu}{the name of a source file or an already parsed
     translation unit}
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
   \item{col}{the collector/visitor  function or object of class
     \code{\link{S4CursorVisitor-class}} or \code{\link{RefCursorVisitor-class}}.}
   \item{options}{a value or vector of values passed to \code{\link{createTU}}
     via its \code{options} parameter.}
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
