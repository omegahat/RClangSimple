\name{getInclusions}
\alias{getInclusions}
\title{Collect all of the include files for a source file}
\description{
}
\usage{
getInclusions(file, flat = FALSE,
              fun = if(flat)
                   genInclusionCollector()
                 else
                   genHierarchicalInclusionCollector(),
               ...)  
}
\arguments{
   \item{file}{the name of a source file or a previously parsed translation unit}
   \item{flat}{a logical value indicating whether we want the inclusion
     information organized as a flat character vector or with the files
     grouped by their "includer".
    }
   \item{fun}{a visitory function or object used to process the
     callbacks by libclang.}
   \item{...}{additional arguments that are passed to
     \code{\link{createTU}} if \code{file} is a file name and not a
     translation unit.}
}
\value{
  a collection of the included files.
  If \code{flat} is \code{TRUE}, this is
  a character vector with an element for each file included.
  The corresponding element name is the file that included it.

  If \code{flat} is \code{FALSE}, this returns a list with
  a character vector for each element. The names of the list
  are the names of the files that include others.
  The corresponding character vector contains the names of the files
  that that file includes.

  One can get transform the flat version to the non-flat version with
  a simple call  \code{split(inc, names(inc))}.
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
\code{\link{createTU}}
}
\examples{
inc = getInclusions("inst/exampleCode/file1.c", FALSE)
}
\keyword{programming}
\keyword{interface} 
