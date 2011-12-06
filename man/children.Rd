\name{children}
\alias{children}

\title{Get the CXCursor children of a CXCursor object}
\description{
  A \code{CXCursor} object in the C parser is an object that
  can represent different types of elements in the parse
  tree such as statements, expressions, variables, function calls, etc.
  A cursor can have sub-children which provide the information about
  their parent. For example, a function call cursor would
  have the name of the function being called and the arguments in the call.
}
\usage{
children(top)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{top}{
%%     ~~Describe \code{top} here~~
}
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
function (top) 
{
    kids = list()
    f = function(cur, parent) {
        if (cur$kind == CXCursor_ParmDecl) 
            kids[[length(kids) + 1]] <<- cur
        1L
    }
    visitChildren(top, f, clone = TRUE)
    kids
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
