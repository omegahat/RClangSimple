\name{genFunctionCollector}
\alias{genFunctionCollector}
\alias{genVariableCollector}
\alias{genCallCollector}
\alias{genDataStructCollector}
\alias{genDefinesCollector}
\alias{genEnumCollector}
%\alias{genTypeCollector}
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
genFunctionCollector(makeRoutine = FALSE, clone = TRUE)
genCallCollector()
genDataStructCollector(leaveAsCursor = FALSE)
genDefinesCollector(names = character())
genEnumCollector()
genVariablesCollector(clone = TRUE, recurse = FALSE)
combineCollectors(..., .funs = list()) 
}
%genTypeCollector()
\arguments{
  \item{makeRoutine}{logical scalar value. If \code{FALSE}, the cursor
  is stored; If \code{TRUE}, we store the result of \code{makeRoutineObject}.}
  \item{leaveAsCursor}{a logical value that controls whether we return
    the cursors representing the data types or convert them to R objects.}
  \item{clone}{a logical value. If \code{TRUE} and we are collecting the \code{CXCursor}
    objects, we clone the cursor objects to avoid them being garbage collected
    when the TU disappears.
  }
  \item{names}{ignored for now}
%   \item{filenames}{the names of files in which the routines of interest
%     are located. If this is empty, we accept routines from all
%  files. This can be \code{TRUE} to indicate only routines in the source
%  file being processed should be returned.}
\item{\dots}{the individual collectors that are to be combined.}
\item{recurse}{logical value that indicates whether to recursively descend down the cursor tree or
  to process only the top-level objects, e.g., the top-level declarations.}
   \item{.funs}{a list of the collectors to be combined.}
}
\value{
The collectors typically return an \code{\link{S4CursorVisitor-class}} object.
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

