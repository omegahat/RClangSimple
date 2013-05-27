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
  These are functions for working with the diagnostic messages
  the libclang parser provides for errors, warnings, etc.
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
   \item{Diagnostic,arg1}{a \code{CXDiagnostic} object}
   \item{Options}{options controlling how the diagnostic is
     formatted. This is obtained by coming values from the
     CXDiagnosticDisplayOptions enumeration type. See \code{CXDiagnostic}.}
   \item{Unit}{a translation unit object or an object that can be
     coerced to a \code{CXTranslationUnit}}
   \item{Index}{an integer or numeric value identifying the element of
     interest. This is 0-based, not 1-based.}
   \item{diags}{a \code{CXDiagnosticSet} object}
}
%\value{}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
%\seealso{}
%\examples{}
\keyword{programming}
\keyword{interface} 
