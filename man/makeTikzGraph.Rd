\name{makeTikzGraph}
\alias{makeTikzGraph}
\title{Create a tree representing a CXCursor and its descendants}
\description{
  This creates TeX code that can be used to dipslay the hierarchical
  structure of \code{CXCursor} and its children and their children.
  This can be embedded into a TeX document.
  One can customize the appearance of the nodes and edges via Tikz
  settings in the TeX document.
}
\usage{
makeTikzGraph(cur, genLabel = makeCursorLabel, options = NULL,
              siblingDistance = integer(), unit = "cm")
}
\arguments{
  \item{cur}{the CXCursor whose hierarchy we are to display}
  \item{genLabel}{a function that creates the text for each node in the
    tree. That text is displayed for the corresponding node. This is
    called separately for each node.}
  \item{options}{Tikz options in the form of a character vector. These
    are inserted into the \verb{\\begin\{tikzpicture\}}  TeX code .}
  \item{siblingDistance}{an integer value that specifies the distance
    between nodes at the same level in the hierarchy under the same
    parent node, i.e. siblings.
   }
  \item{unit}{a character vector giving the unit of measurement for \code{siblingDistance},
              e.g. \code{"cm"}, \code{"em"}, \code{"pt"}, \code{"in"}.}
}
\details{
  This generates text containing the Tikz TeX code.
}
\value{
  A character vector containing the Tikz TeX code.
  This has multiple elements rather than a single element.
}
\references{
  Tikz \code{http://www.texample.net/tikz/}, \code{http://sourceforge.net/projects/pgf/}
  
   libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}

%\seealso{}
\examples{
slr = getRoutines(system.file("exampleCode", "sinLog.c", package = "RCIndex"))
cat(makeTikzGraph(slr$fun), sep = "\n")

cat(makeTikzGraph(slr$fun@def, options = c("font=\\tiny", "level distance=1.25cm"), 
                  siblingDistance = structure(c(6, 7, 7, 4, 3), names = c("", 4:7))),
     sep = "\n")
}

\concept{visualization}
\keyword{hplot}
\keyword{programming}
