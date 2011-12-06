\name{getCallableRoutines}
\alias{getCallableRoutines}
\title{Find routines that are callable from within R via the .C or .Call interfaces}
\description{
  This function processes C and C++ source code files
  and determines which of the routines in these can be called
  via R's \code{.Call} or \code{.C} interfaces.
  
}
\usage{
getCallableRoutines(dir, src = list.files(dir, pattern = "\\\\.(c|cpp|cxx|C)$", full.names = TRUE),
                     args = sprintf("-I\%s/include", R.home()), ..., verbose = TRUE)
}
\arguments{
  \item{dir}{the directory in which to find C and C++ source files.
   This is ignored if \code{src} is specified.}
  \item{src}{a character vector giving the fully qualified names of the
    source files to process. }
  \item{args}{a character vector of command line arguments passed to the
  clang parser. This can specify include directories, precompiled
  headers, and many flags.}
  \item{\dots}{additional parameters passed on to \code{\link{createTU}}}
  \item{verbose}{a logical value which controls whether we print the
    name of each file as we process it.}
}
\value{
  A list possibly containing elements "C" and "Call".
  Each such element is a list of functions objects
  containing the return type, parameter types and the function
  definition cursor.
  Only routines that are declared or defined within the source file
  are included in the output. In other words, we ignore files from the
  included files.
}
\references{
 Routine Registration in Writing R Extensions Manual.
}
\author{Duncan Temple Lang}


\seealso{

}
\examples{
  a = getCallableRoutines(system.file("exampleCode", package = "RCIndex"))
  as(a, "RegistrationTable")
}
\keyword{programming}

