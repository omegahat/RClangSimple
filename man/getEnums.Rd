\name{getEnums}
\alias{getEnums}
\title{Get the top-level enumeration definitions in a translation unit}
\description{
  This function processes a source file or translation unit
  and returns the enumerated constant definitions it contains.
}
\usage{
getEnums(src, fileFilter = character(), visitor = genEnumCollector(), ...)
}
\arguments{
  \item{src}{either the name of a source file or an already parsed
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
}
\value{
  A list of enumeration definition objects.
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
  \code{\link{getRoutines}},   \code{\link{getDataStructures}},
    \code{\link{getCppClasses}}
}
\examples{
f = system.file("exampleCode", "enums.c",  package = "RCIndex")
getEnums(f)
}
\keyword{programming}
\keyword{interface} 
