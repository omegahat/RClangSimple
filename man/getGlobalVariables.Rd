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
getGlobalVariables(tu, fileFilter = character(), visitor = genGlobalVariablesCollector(), ...)
findGlobals(tu, fileFilter = character(), merge = TRUE, ignoreConst = TRUE, 
             visitor = genRoutineVariableRefsCollector(merge, ignoreConst), ...)
}
\arguments{
  \item{tu}{either the name of a source file or an already parsed
    translation unit object}
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
  \item{visitor}{a function or S4/reference class object used as the
    visitor function passed to \code{\link{visitCursor}} to collect the
    enumeration definitions.}  
  \item{\dots}{arguments passed \code{\link{createTU}} if \code{src} is
    the name of source file.}
  \item{merge}{a logical value. If \code{TRUE}, separate the global
  variables from the local variables/routines.  ??Does this make sense??}
  \item{ignoreConst}{a logical value.  If \code{TRUE}, we ignore
  variables that have a \code{const} qualifier that indicates they
  cannot be modified, i.e., they are constants.}
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
