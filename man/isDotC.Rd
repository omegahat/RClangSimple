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
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (fun) 
{
    getTypeKind(fun$returnType) == CXType_Void && all(sapply(fun$params, 
        isDotCParamType))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
