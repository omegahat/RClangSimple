\name{getIncludes}
\alias{getIncludes}
\title{Get the names of files included by the preprocessor}
\description{
This function processes a source code file (C/C++) or
a previously parsed translation unit and finds
the \code{#include} directives.

One must enable the parser to look at the preprocessor
cursors using the
 \code{RCIndex::CXTranslationUnit_DetailedPreprocessingRecord}
option to \code{createTU}/\code{parseTU}.
}
\usage{
getIncludes(src, byFile = FALSE, col = genIncludesCollector(byFile = byFile), options = CXTranslationUnit_DetailedPreprocessingRecord, ...)
}

\arguments{
  \item{src}{the name of the top-level file, or a previously
    parsed translation unit.
    If this is a translation unit, it is essential that it was
    created with the option
     \code{RCIndex::CXTranslationUnit_DetailedPreprocessingRecord}
     so that the preprocessor nodes are active and visible in the tree.
}
  \item{col}{the collector object with an update function and includes
  function to retrieve the results.}
  \item{byFile}{
    a logical value. If \code{FALSE}, we get a flat list of all the
    files that are \code{#include}'d in the entire translation unit,
    regardless of from which file they were included.
    If \code{TRUE}, the files are separated by which parent file
    included them.
}
  \item{options}{
    options for the call to \code{\link{createTU}}/\code{\link{parseTU}}.
}
  \item{\dots}{
    additional arguments passed to \code{parseTU}.
}
}

\value{
  If \code{hierarchy} is \code{FALSE} (the default),
  a character vector of the file names.
  Alternatively, if \code{hierarchy} is \code{TRUE},
  a list with an element for each file processed.
  Each of these elements is a 
}
\references{
libclang API and Index.h
}
\author{
Duncan Temple Lang
}

\seealso{
\code{\link{parseTU}}
}
\examples{
f = system.file("exampleCode", "includes.c", package = "RCIndex")

# Flat vector of file names
getIncludes(f)

getIncludes(f, byFile = TRUE)
}
\keyword{programming}

