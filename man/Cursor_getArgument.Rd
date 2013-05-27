\name{Cursor_getArgument}
\alias{Cursor_getArgument}
\alias{Cursor_getNumArguments}
\alias{Cursor_getParsedComment}
\alias{Cursor_getBriefCommentText}
\alias{Cursor_getRawCommentText}
\alias{getBriefCommentText}
\alias{getRawCommentText}
\alias{Cursor_getReceiverType}
\alias{Cursor_isBitField}
\alias{Cursor_isDynamicCall}
\alias{Cursor_isNull}
\alias{CXCursorSet_contains}
\alias{CXCursorSet_insert}
\alias{getCanonicalCursor}
\alias{getCursorAvailability}
\alias{getCursorExtent}
\alias{getCursorKind}
\alias{getCursorLanguage}
\alias{getCursorLexicalParent}
\alias{getCursorLinkage}
\alias{getCursorLocation}
\alias{getCursorReferenced}
\alias{getCursorSemanticParent}
\alias{getCursorUSR}
\alias{getNullCursor}
\alias{getSpecializedCursorTemplate}
\alias{getTemplateCursorKind}
\alias{hashCursor}
\alias{isCursorDefinition}
\alias{getNumArguments}
\alias{getNumOverloadedDecls}
\alias{getOverloadedDecl}
\alias{getEnumConstantDeclValue}
\alias{getEnumDeclIntegerType}
\alias{getTypedefDeclUnderlyingType}
\alias{isDynamicCall}
\alias{getFieldDeclBitWidth}
\alias{getIncludedFile}
\alias{CXXMethod_isStatic}
\alias{CXXMethod_isVirtual}
\alias{getReceiverType}
\alias{getCursorDefinition}
\alias{getCursorTranslationUnit}
\title{Functions for operating on CXCursor objects}
\description{
}
\usage{
Cursor_getArgument(C, i)
Cursor_getBriefCommentText(C)
Cursor_getNumArguments(C)
Cursor_getParsedComment(C)
Cursor_getRawCommentText(C)
Cursor_getReceiverType(C)
Cursor_isBitField(C)
Cursor_isDynamicCall(C)
Cursor_isNull(cursor)
CXCursorSet_contains(cset, cursor)
CXCursorSet_insert(cset, cursor)
getCanonicalCursor(arg1)
getCursorAvailability(cursor)
getCursorExtent(x)
getCursorKind(cur)
getCursorLanguage(cur)
getCursorLexicalParent(cursor)
getCursorLinkage(cur)
getCursorLocation(arg1)
getCursorReferenced(arg1)
getCursorSemanticParent(cursor)
getCursorUSR(arg1)
getNullCursor()
getSpecializedCursorTemplate(C)
getTemplateCursorKind(C)
hashCursor(arg1)
isCursorDefinition(arg1)
getNumArguments(C)
getNumOverloadedDecls(cursor)
getOverloadedDecl(cursor, index)
getEnumConstantDeclValue(C)
getEnumDeclIntegerType(C)
getTypedefDeclUnderlyingType(C)
isDynamicCall(C)
getFieldDeclBitWidth(C)
getIncludedFile(cursor)
CXXMethod_isStatic(C)
CXXMethod_isVirtual(C)
getCursorTranslationUnit(cursor)
}
\arguments{
   \item{C,cursor,cur,arg1,x}{the \code{CXCursor} object on which to operate and query}
   \item{i,index}{an integer specifying which element to retrieve. This
     (probably) uses 0-based counting, i.e. the first argument is
     numbered 0.}
   \item{cset}{the cursor set object}
}
%\value{}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{
Duncan Temple Lang
}
\seealso{
  \code{\link{clone}}
}
%\examples{}
\keyword{programming}
\keyword{interface} 
