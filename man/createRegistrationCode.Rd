\name{createRegistrationCode}
\alias{createRegistrationCode}
\title{Generate code to register narive routines callable from R}
\description{
  This function is a high-level function to find
  the routines in C/C++ code that can be invoked
  via R's .C or .Call interface
  and then to generate the C code to register
  these routines along with the number of parameters
  and their type information.
}
\usage{
createRegistrationCode(dir, pkg = dirname(dir), routines = getCallableRoutines(dir))
}
\arguments{
  \item{dir}{the directory containing the source code.}
  \item{pkg}{the name of the package or DLL containing the native code.
    This is used when creating the name of the initialization routine
    that R will look for and invoke. This defaults to the name of
    the parent directory which corresponds to the case where the code is
    in the src/ directory of a package and the parent directory is the
    root of the package structure.}
  \item{routines}{the collection of .C and .Call invocable routines}
}
\value{

}
\references{

}
\author{
Duncan Temple Lang
}

\seealso{
  \code{\link{getCallableRoutines}}
}
\examples{
  code = createRegistrationCode(system.file("exampleCode", package = "RCIndex"), "MyPkg")
  cat(code, sep = "\n")
}
\keyword{programming}


