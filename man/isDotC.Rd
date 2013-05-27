\name{isDotC}
\alias{isDotC}
\alias{isDotCall}
\alias{isDotCParamType}
\alias{isSEXP}

\title{Determine if a parameter or routine is callable from R}
\description{
  These functions are high-level functions that examine
  the type of a parameter or all the parameters of a function
  definition/declaration
  and determines if they are consistent with R's \code{.Call} or
  \code{.C} interfaces.
}
\usage{
isDotC(fun)
isDotCall(fun)
isSEXP(param, quick = TRUE)
}
\arguments{
  \item{fun}{the function object which is a list
    of a return type, parameters and a definition cursor.}
  \item{param}{the parameter or type.}
  \item{quick}{a logical value indicating whether to check the name of
    the type as being equal to "SEXP"}
}
\value{
 A logical value
}
\references{
  libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
  Writing R Extensions manual
}
\author{
Duncan Temple Lang
}

\seealso{
  \code{\link{createRegistrationCode}}
}
\examples{
f = system.file("exampleCode", "register.c", package = "RCIndex")
args = "-DHAVE_CONFIG_H"
includes = c(sprintf("\%s/../src/include", R.home()), sprintf("\%s/include", R.home()))
r = getRoutines(f, includes = includes, args = args)
sapply(r, isDotCall)
sapply(r, isDotC)
}

\keyword{programming}
\keyword{interface}
