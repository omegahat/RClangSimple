#include "RClang.h"
R_MAKE(CXComment)

SEXP R_clang_getDiagnosticOption(SEXP r_Diag, SEXP r_Disable)
{
    SEXP r_ans = R_NilValue;
    CXDiagnostic Diag = GET_REF(r_Diag, CXDiagnostic);
    CXString * Disable = GET_REF(r_Disable, CXString);
    
    CXString ans;
    ans = clang_getDiagnosticOption(Diag, Disable);
    
    r_ans = CXStringToSEXP(ans) ;
    
    return(r_ans);
} 


SEXP R_clang_getDiagnosticCategory(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXDiagnostic arg1 = GET_REF(r_arg1, CXDiagnostic);
    
    unsigned int ans;
    ans = clang_getDiagnosticCategory(arg1);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
} 

#if 0  //deprecated
SEXP R_clang_getDiagnosticCategoryName(SEXP r_Category)
{
    SEXP r_ans = R_NilValue;
    unsigned int Category = REAL(r_Category)[0];
    
    CXString ans;
    ans = clang_getDiagnosticCategoryName(Category);
    
    r_ans = CXStringToSEXP(ans) ;
    
    return(r_ans);
} 
#endif

SEXP R_clang_getDiagnosticCategoryText(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXDiagnostic arg1 = GET_REF(r_arg1, CXDiagnostic);
    
    CXString ans;
    ans = clang_getDiagnosticCategoryText(arg1);
    
    r_ans = CXStringToSEXP(ans) ;
    
    return(r_ans);
} 



SEXP R_clang_CXIndex_getGlobalOptions(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXIndex arg1 = GET_REF(r_arg1, CXIndex);
    
    unsigned int ans;
    ans = clang_CXIndex_getGlobalOptions(arg1);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_CXIndex_setGlobalOptions(SEXP r_arg1, SEXP r_options)
{
    SEXP r_ans = R_NilValue;
    CXIndex arg1 = GET_REF(r_arg1, CXIndex);
    unsigned int options = REAL(r_options)[0];
    
    clang_CXIndex_setGlobalOptions(arg1, options);
    
    
    return(r_ans);
} 


SEXP R_clang_getFileName(SEXP r_SFile)
{
    SEXP r_ans = R_NilValue;
    CXFile SFile = GET_REF(r_SFile, CXFile);

    CXString ans;
    ans = clang_getFileName(SFile);
//fprintf(stderr, "CXFile = %p,  %s\n", SFile, clang_getCString(ans));    
    r_ans = CXStringToSEXP(ans) ;
    
    return(r_ans);
} 



SEXP R_clang_getTemplateCursorKind(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    enum CXCursorKind ans;
    ans = clang_getTemplateCursorKind(C);
    
    r_ans = Renum_convert_CXCursorKind(ans) ;
    
    return(r_ans);
} 


SEXP R_clang_enableStackTraces()
{
    SEXP r_ans = R_NilValue;
    
    clang_enableStackTraces();
    
    
    return(r_ans);
} 


SEXP R_clang_Cursor_getNumArguments(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    int ans;
    ans = clang_Cursor_getNumArguments(C);
    
    r_ans = ScalarInteger(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_defaultSaveOptions(SEXP r_TU)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit TU = * GET_REF(r_TU, CXTranslationUnit);
    
    unsigned int ans;
    ans = clang_defaultSaveOptions(TU);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
} 


SEXP R_clang_getEnumConstantDeclValue(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    long long ans;
    ans = clang_getEnumConstantDeclValue(C);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_getFieldDeclBitWidth(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    int ans;
    ans = clang_getFieldDeclBitWidth(C);
    
    r_ans = ScalarInteger(ans) ;
    
    return(r_ans);
} 


SEXP R_clang_getSpecializedCursorTemplate(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    CXCursor ans;
    ans = clang_getSpecializedCursorTemplate(C);
    
    r_ans = R_makeCXCursor(ans) ;
    
    return(r_ans);
} 


SEXP R_clang_getElementType(SEXP r_T)
{
    SEXP r_ans = R_NilValue;
    CXType T = * GET_REF(r_T, CXType);
    
    CXType ans;
    ans = clang_getElementType(T);
    
    r_ans = R_makeCXType(ans) ;
    
    return(r_ans);
} 


SEXP R_clang_getOverloadedDecl(SEXP r_cursor, SEXP r_index)
{
    SEXP r_ans = R_NilValue;
    CXCursor cursor = * GET_REF(r_cursor, CXCursor);
    unsigned int index = REAL(r_index)[0];
    
    CXCursor ans;
    ans = clang_getOverloadedDecl(cursor, index);
    
    r_ans = R_makeCXCursor(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_getNumOverloadedDecls(SEXP r_cursor)
{
    SEXP r_ans = R_NilValue;
    CXCursor cursor = * GET_REF(r_cursor, CXCursor);
    
    unsigned int ans;
    ans = clang_getNumOverloadedDecls(cursor);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_getEnumDeclIntegerType(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    CXType ans;
    ans = clang_getEnumDeclIntegerType(C);
    
    r_ans = R_makeCXType(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_getTypedefDeclUnderlyingType(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    CXType ans;
    ans = clang_getTypedefDeclUnderlyingType(C);
    
    r_ans = R_makeCXType(ans) ;
    
    return(r_ans);
} 



SEXP R_clang_equalRanges(SEXP r_range1, SEXP r_range2)
{
    SEXP r_ans = R_NilValue;
    CXSourceRange range1 = * GET_REF(r_range1, CXSourceRange);
    CXSourceRange range2 = * GET_REF(r_range2, CXSourceRange);
    
    unsigned int ans;
    ans = clang_equalRanges(range1, range2);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_equalLocations(SEXP r_loc1, SEXP r_loc2)
{
    SEXP r_ans = R_NilValue;
    CXSourceLocation loc1 = * GET_REF(r_loc1, CXSourceLocation);
    CXSourceLocation loc2 = * GET_REF(r_loc2, CXSourceLocation);
    
    unsigned int ans;
    ans = clang_equalLocations(loc1, loc2);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_equalCursors(SEXP r_arg1, SEXP r_arg2)
{
    SEXP r_ans = R_NilValue;
    CXCursor arg1 = * GET_REF(r_arg1, CXCursor);
    CXCursor arg2 = * GET_REF(r_arg2, CXCursor);
    
    unsigned int ans;
    ans = clang_equalCursors(arg1, arg2);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_getCursorLocation(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXCursor arg1 = * GET_REF(r_arg1, CXCursor);
    
    CXSourceLocation ans;
    ans = clang_getCursorLocation(arg1);
    
    r_ans = R_makeCXSourceLocation(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_getRange(SEXP r_begin, SEXP r_end)
{
    SEXP r_ans = R_NilValue;
    CXSourceLocation begin = * GET_REF(r_begin, CXSourceLocation);
    CXSourceLocation end = * GET_REF(r_end, CXSourceLocation);
    
    CXSourceRange ans;
    ans = clang_getRange(begin, end);
    
    r_ans = R_makeCXSourceRange(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_Cursor_getParsedComment(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    CXComment ans;
    ans = clang_Cursor_getParsedComment(C);
    
    r_ans = R_makeCXComment(ans) ;
    
    return(r_ans);
} 



SEXP R_clang_Comment_getKind(SEXP r_Comment)
{
    SEXP r_ans = R_NilValue;
    CXComment Comment = * GET_REF(r_Comment, CXComment);
    
    enum CXCommentKind ans;
    ans = clang_Comment_getKind(Comment);
    
    r_ans = Renum_convert_CXCommentKind(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_Comment_getNumChildren(SEXP r_Comment)
{
    SEXP r_ans = R_NilValue;
    CXComment Comment = * GET_REF(r_Comment, CXComment);
    
    unsigned int ans;
    ans = clang_Comment_getNumChildren(Comment);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_Comment_getChild(SEXP r_Comment, SEXP r_ChildIdx)
{
    SEXP r_ans = R_NilValue;
    CXComment Comment = * GET_REF(r_Comment, CXComment);
    unsigned int ChildIdx = REAL(r_ChildIdx)[0];
    
    CXComment ans;
    ans = clang_Comment_getChild(Comment, ChildIdx);
    
    r_ans = R_makeCXComment(ans) ;
    
    return(r_ans);
} 


SEXP R_clang_Comment_isWhitespace(SEXP r_Comment)
{
    SEXP r_ans = R_NilValue;
    CXComment Comment = * GET_REF(r_Comment, CXComment);
    
    unsigned int ans;
    ans = clang_Comment_isWhitespace(Comment);
    
    r_ans = ScalarLogical(ans) ; // changed by hand!
    
    return(r_ans);
} 


SEXP R_clang_getCursorLexicalParent(SEXP r_cursor)
{
    SEXP r_ans = R_NilValue;
    CXCursor cursor = * GET_REF(r_cursor, CXCursor);
    
    CXCursor ans;
    ans = clang_getCursorLexicalParent(cursor);
    
    r_ans = R_makeCXCursor(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_getCursorSemanticParent(SEXP r_cursor)
{
    SEXP r_ans = R_NilValue;
    CXCursor cursor = * GET_REF(r_cursor, CXCursor);
    
    CXCursor ans;
    ans = clang_getCursorSemanticParent(cursor);
    
    r_ans = R_makeCXCursor(ans) ;
    
    return(r_ans);
} 


SEXP R_clang_getIncludedFile(SEXP r_cursor)
{
    SEXP r_ans = R_NilValue;
    CXCursor cursor = * GET_REF(r_cursor, CXCursor);
    
    CXFile ans;
    ans = clang_getIncludedFile(cursor);
    
    r_ans = R_createRef(ans, "CXFile") ;
    
    return(r_ans);
} 

SEXP R_clang_getNullCursor()
{
    SEXP r_ans = R_NilValue;
    
    CXCursor ans;
    ans = clang_getNullCursor();
    
    r_ans = R_makeCXCursor(ans) ;
    
    return(r_ans);
} 

SEXP R_clang_getNullLocation()
{
    SEXP r_ans = R_NilValue;
    
    CXSourceLocation ans;
    ans = clang_getNullLocation();
    
    r_ans = R_makeCXSourceLocation(ans) ;
    
    return(r_ans);
} 

