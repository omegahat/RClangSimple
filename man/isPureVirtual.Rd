\name{isPureVirtual}
\alias{isPureVirtual}
\alias{isConst}
\title{
Test if C++ method is constant or pure virtual.
}
\description{
  These functions test whether a given C++ method is either
  constant, i.e., doesn't modify the object's state,
  or if it is a pure virtual method that must be overriden
  by one or more subclasses.
}
\usage{
isPureVirtual(C)
isConst(C)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{C}{a CXCursor representing a C++ method}
}
\value{
 A scalar integer value.
}
\author{
Duncan Temple Lang
}

\seealso{
  \code{\link{createTU}}
}

\examples{
f = system.file("exampleCode", "classPure.cc", package = "RCIndex")
tu = createTU(f)
k = getCppClasses(tu)

bar1 = k$Foo@methods[[2]]

isPureVirtual(bar1)
isConst(bar1)

sapply(k$Foo@methods, isConst)
sapply(k$Foo@methods, isPureVirtual)

}

\keyword{programming}
\concept{metaprogramming}

