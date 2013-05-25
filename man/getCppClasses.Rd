\name{getCppClasses}
\alias{getCppClasses}
\alias{readCppClass}

\title{Get class descriptions from a C++ source file}
\description{
  These functions traverse a translation unit and extract
  descriptions of C++ classes and their fields and methods.
}
\usage{
getCppClasses(tu, nodesOnly = FALSE, visitor = genCppClassCursorCollector(), ...)
readCppClass(cursor, visitor = genCppClassInfoCollector(cursor))
}

\arguments{
  \item{tu}{}
  \item{nodesOnly}{}
  \item{visitor}{}
  \item{\dots}{}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{

}
\references{
}
\author{
DTL
}
\seealso{

}
\examples{
kl = getCppClasses(system.file("exampleCode", "simpleClass.cpp", package = "RCIndex"))


tkl = getCppClasses(system.file("exampleCode", "templateClass.cpp", package = "RCIndex"))
}
\keyword{programming}
\keyword{interface}