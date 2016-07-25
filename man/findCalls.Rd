\name{findCalls}
\alias{findCalls}
\title{Get the names of all routines called in any code in a translation
unit}
\description{
  This function finds the names of routines  that are called by other
  code. It traverses the specified code, i.e. a translation unit, a
  source file or a routine and finds the calls.
}
\usage{
findCalls(file, fileFilter = character(), n = 10000, ...)
}
\arguments{
   \item{file}{the name of a source code file, a previously parsed
     translation unit or a \code{CXCursor} object, e.g. representing a
     routine}
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
   \item{n}{a guess as to how many calls we are likely to
     encounter. This is used to preallocate memory to store the
     calls. The only down side to this being too small is extra memory
     allocation steps.}
   \item{...}{additional arguments that are passed to
     \code{\link{createTU}} if \code{file} is the name of a source file.}
}
\value{
  A character vector with the names of the routines called within the
  specified scope.
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
  \code{\link{getRoutines}}
  \code{\link{createTU}}
  \code{\link{visitCursor}}  
}
\examples{
findCalls(system.file("exampleCode", "fib.c", package = "RCIndex"))
}
\keyword{programming}
\keyword{interface} 
