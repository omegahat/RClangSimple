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
   \item{leaveAsCursor}{}
   \item{names}{}
   \item{filenames}{the names of files in which the routines of interest
     are located. If this is empty, we accept routines from all files.}
   \item{\dots}{}
   \item{.funs}{}
}
\value{

}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
}
\examples{
}
\keyword{programming}
\keyword{interface} 

