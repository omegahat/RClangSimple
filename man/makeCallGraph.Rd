\name{makeCallGraph}
\alias{makeCallGraph}
\title{Display which routines call other routines via a graph}
\description{
 This function draws each routine in the specified file or translation
 unit as a node and adds directed edges from one node to another
 if the body of the former node calls the latter routine.
}
\usage{
makeCallGraph(tu, withinFile = TRUE, .plot = TRUE, ...)
}
\arguments{
  \item{tu}{the name of a source file or a previously created
    translation unit object.}
  \item{withinFile}{a logical value that controls whether we only show
    calls to routines that are located in this translation unit 
    or show nodes for routines that are not in this translation unit but
  are invoked in the code of any of the routines.}
  \item{\dots}{additional arguments that are passed to
    \code{\link{createTU}}. These can be include directories and
    pre-processor flags}
   \item{.plot}{a logical value that controls whether we draw the graph
     or just return the adjacency matrix.}
}
\details{
  This uses the \code{igraph} package.
}
\value{
  If \code{.plot} is \code{TRUE} and the \code{igraph} package is available, the graph is displayed.
  In either case, the adjacency matrix is returned.
}
\references{
libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{Duncan Temple Lang}

\seealso{
\code{\link[igraph]{graph.adjacency}} in the \code{igraph} package.
}
\examples{
g = makeCallGraph(system.file("exampleCode", "clangGen.c", package = "RCIndex"))
}
\concept{visualization}
\keyword{hplot}
