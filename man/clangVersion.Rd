\name{clangVersion}
\alias{clangVersion}
\title{String identifying the version of the clang library}
\description{
  This function returns a string that identifies the version
  of libclang that is being used.
}
\usage{
clangVersion(asNums = FALSE)
}
\arguments{
  \item{asNums}{a logical value. If \code{TRUE}, the version is returned as an integer
    vector with major and minor version numbers as the elements. Otherwise,
  the version is returned as a character string.}
}

\value{
  A character string, typically something like
  \code{"clang version 2.8 (trunk 113069)"}.
}
\references{
libclang API and Index.h
}
\author{
Duncan Temple Lang
}

%\seealso{}
%\examples{}
\keyword{programming}
