\name{genFunctionCollector}
\alias{genFunctionCollector}
\alias{genVariableCollector}

\title{Constructor functions for collectors of information within
  translation unit}
\description{
  These functions are used to create closure functions
  that collect information across calls.
  The update function returned can be used as the visitor
  function in calls to \code{\link{parseTU}}
  and \code{\link{visitChildren}}.
}
\usage{
genFunctionCollector()
}

\details{

}
\value{

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
function () 
{
    funcs = list()
    update = function(cur, parent) {
        if (cur$kind != CXCursor_FunctionDecl) 
            return(1L)
        id = getName(cur)
        ret = getResultType(cur$type)
        params = children(cur)
        names(params) = sapply(params, getName)
        funcs[[id]] <<- list(returnType = ret, params = params, 
            def = cur)
        1L
    }
    list(update = update, funcs = function() funcs)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
