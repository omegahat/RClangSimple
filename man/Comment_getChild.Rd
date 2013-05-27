\name{Comment_getChild}
\alias{Comment_getChild}
\alias{Comment_getKind}
\alias{Comment_getNumChildren}
\alias{Comment_isWhitespace}
\alias{getParsedComment}
\title{Functions for querying comments}
\description{
These are functions working with \code{CXComment} objects.
}
\usage{
Comment_getChild(Comment, ChildIdx)
Comment_getKind(Comment)
Comment_getNumChildren(Comment)
Comment_isWhitespace(Comment)
getParsedComment(C)
}
\arguments{
   \item{Comment,C}{a \code{CXComment} object}
   \item{ChildIdx}{the index of the child of interest. This is 0-based
     so the first element is at position 0, not 1.}
}
%\value{}
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
%\examples{}
\keyword{programming}
\keyword{interface} 
