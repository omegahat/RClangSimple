\name{genFunctionCollector}
\alias{genFunctionCollector}
\alias{genVariableCollector}
\alias{genCallCollector}
\alias{genDataStructCollector}
\alias{genDefinesCollector}
\alias{genEnumCollector}
\alias{genTypeCollector}
\alias{genVariablesCollector}
\alias{combineCollectors}

\title{Constructor functions for collectors of information within
  translation unit}
\description{
  These functions are used to create closure functions
  that collect information across calls.
  The update function returned can be used as the visitor
  function in calls to \code{\link{parseTU}}
  and \code{\link{visitChildren}}.
}
\usage{
genFunctionCollector(filenames = character())
genCallCollector()
genDataStructCollector(leaveAsCursor = FALSE)
genDefinesCollector(names = character())
genEnumCollector()
genTypeCollector()
genVariablesCollector()
combineCollectors(..., .funs = list()) 
}
\arguments{
  \item{leaveAsCursor}{a logical value that controls whether we return
  the cursors representing the data types or convert them to R objects.}
     \item{names}{ignored for now}
   \item{filenames}{the names of files in which the routines of interest
     are located. If this is empty, we accept routines from all
  files. This can be \code{TRUE} to indicate only routines in the source
  file being processed should be returned.}
   \item{\dots}{the individual collectors that are to be combined.}
   \item{.funs}{a list of the collectors to be combined.}
}
\value{
The collectors typically return an \code{\link{S4Visitor-class}} object.
}
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

