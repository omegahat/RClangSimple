\name{getVariables}
\alias{getVariables}
\alias{findGlobalUse}
\title{Find variables in a translation unit and where global variables
  are referenced}
\description{
  These find variables being used in the translation unit.
}
\usage{
getVariables(file, fileFilter = character(), visitor = genVariablesCollector(), ...)
findGlobalUse(tu, visitor = globalUseVisitor(), ...)
}
\arguments{
   \item{file,tu}{the name of a source file or an already parsed
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
   \item{visitor}{a visitor function or visitor object of class
     \code{\link{S4CursorVisitor-class}} or \code{\link{RefCursorVisitor-class}}.}
   \item{...}{additional arguments that are passed to
     \code{\link{createTU}} to parse a source file}
}
%\value{}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
%\seealso{}
%\examples{}
\keyword{programming}
\keyword{interface} 
