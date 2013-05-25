\name{defaultDiagnosticDisplayOptions}
\alias{defaultDiagnosticDisplayOptions}
\alias{formatDiagnostic}
\alias{getDiagnostic}
\alias{getDiagnosticInSet}
\alias{getDiagnosticLocation}
\alias{getDiagnosticSetFromTU}
\alias{getDiagnosticSeverity}
\alias{getDiagnosticSpelling}
\alias{getNumDiagnostics}

\alias{[,CXDiagnosticSet,integer,ANY-method}
\alias{[,CXDiagnosticSet,numeric,ANY-method}

\title{Functions for accessing compiler diagnostic messages}
\description{
}
\usage{
defaultDiagnosticDisplayOptions()
formatDiagnostic(Diagnostic, Options)
getDiagnostic(Unit, Index)
getDiagnosticInSet(diags, Index)
getDiagnosticLocation(arg1)
getDiagnosticSetFromTU(Unit)
getDiagnosticSeverity(arg1)
getDiagnosticSpelling(arg1)
getNumDiagnostics(Unit)
}
\arguments{
   \item{Diagnostic}{}
   \item{Options}{}
   \item{Unit}{}
   \item{Index}{}
   \item{diags}{}
   \item{arg1}{}
}
\value{
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
}
\examples{
}
\keyword{programming}
\keyword{interface} 
