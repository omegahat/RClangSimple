\name{getCppClasses}
\alias{getCppClasses}
\alias{readCppClass}
\title{Retrieve information about C++ classes}
\description{
  These functions obtain information about C++ classes in a source
  file or translation unit.
}
\usage{
getCppClasses(tu, fileFilter = character(), nodesOnly = FALSE, numClasses = 100,
                 ...)
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
  \item{nodesOnly}{a logical value that controls whether we just want
    the cursors for the C++  class definitions or whether we want full
    descriptions of the classes.}
% \item{visitor}{a function or S4/reference class object used as the
%   visitor function passed to \code{\link{visitCursor}} to collect the
%   enumeration definitions.}
  \item{numClasses}{a guess as to the number of classes that are in the
    translation unit. This is only used to pre-allocate space to store
    them and is available only for efficiency. }
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
