\name{Comment_getChild}
\alias{Comment_getChild}
\alias{Comment_getKind}
\alias{Comment_getNumChildren}
\alias{Comment_isWhitespace}
\alias{getParsedComment}
\title{Functions for querying comments}
\description{
}
\usage{
Comment_getChild(Comment, ChildIdx)
Comment_getKind(Comment)
Comment_getNumChildren(Comment)
Comment_isWhitespace(Comment)
getParsedComment(C)
}
\arguments{
   \item{Comment}{}
   \item{ChildIdx}{}
   \item{C}{}
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
\code{\link{Cursor_getBriefCommentText}},
\code{\link{Cursor_getParsedComment}}, \code{\link{Cursor_getRawCommentText}}
}
\examples{
}
\keyword{programming}
\keyword{interface} 
