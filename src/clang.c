#include "RClang.h"
#include <stdlib.h>


SEXP R_makeCXCursor(CXCursor type);
SEXP R_makeCXType(CXType type);

SEXP
R_createReference(void *ptr, const char * const className, const char * tag)
{
    SEXP ans, klass;
    PROTECT(klass = MAKE_CLASS(className));
    PROTECT(ans = NEW_OBJECT(klass));
    if(!tag)
        tag = className;
    SET_SLOT(ans, Rf_install("ref"), R_MakeExternalPtr(ptr, Rf_install(tag), R_NilValue));
    UNPROTECT(2);
    return(ans);
}

void *
getRReference(SEXP val)
{
    SEXP tmp = val; 
    if(TYPEOF(tmp) != EXTPTRSXP) 
         tmp = GET_SLOT(tmp, Rf_install("ref")); 
    else
       tmp = val;
    return(R_ExternalPtrAddr(tmp));
}

#define GET_REF(val, type) \
    (type *) getRReference(val)

#define R_createRef(val, type) R_createReference(val, type, type)



SEXP
R_clang_createIndex(SEXP localPCH, SEXP diagnostics)
{
    CXIndex ans;
    ans = clang_createIndex(1, 1);
    return(R_createRef(ans, "CXIndex"));
}


SEXP
R_clang_createTUFromSource(SEXP r_idx, SEXP src, SEXP r_args)
{
    int nargs = Rf_length(r_args);
    CXTranslationUnit ans;
    CXIndex idx = GET_REF(r_idx, CXIndex);
#if 1
    int i;
    const char * *args = (const char * *) malloc(nargs * sizeof(char *));
    for(i = 0; i < nargs; i++) 
	args[i] = CHAR(STRING_ELT(r_args, i));
#else
    const char * const args[] = { "-Xclang" };  // , "-include-pch=IndexTest.pch"
    nargs = 1;
#endif

    ans = clang_createTranslationUnitFromSourceFile(idx, CHAR(STRING_ELT(src, 0)), nargs, args, 0, 0);
    if(!ans) {
	PROBLEM "can't create the translation unit for %s", CHAR(STRING_ELT(src, 0))
	    ERROR;
    }

    return(R_createRef(ans, "CXTranslationUnit"));
}

SEXP
R_CXCursor_clone(SEXP r_cur)
{
    CXCursor *cursor = GET_REF(r_cur, CXCursor);
    return(R_makeCXCursor(*cursor));
}


SEXP
R_CXCursor_explore(SEXP r_cur)
{
    CXCursor *cursor = GET_REF(r_cur, CXCursor);
    if(cursor)
#if 0
	fprintf(stderr, "%d\n", (int )cursor->data[0]);
#else
        fprintf(stderr, "%d\n", (int )cursor->kind);
#endif
    return(R_makeCXCursor(*cursor));    
}


SEXP
R_CXType_clone(SEXP r_cur)
{
    CXType *ty = GET_REF(r_cur, CXType);
    return(R_makeCXType(*ty));
}


typedef struct {
    SEXP expr;
    int clone;
} RVisitorData;

enum CXChildVisitResult 
R_visitor(CXCursor cursor, CXCursor parent, CXClientData userData)
{
    SEXP ans, ptr;
    RVisitorData *d;

    d = (RVisitorData *) userData;
    ptr = CDR(d->expr);

    if(d->clone) {
	SETCAR(ptr, R_makeCXCursor(cursor));
	ptr = CDR(ptr);
        SETCAR(ptr, R_makeCXCursor(parent));	
    } else {
	SETCAR(ptr, R_createRef(&cursor, "CXCursor"));
	ptr = CDR(ptr);
        SETCAR(ptr, R_createRef(&parent, "CXCursor"));
    } 

    ans = Rf_eval(d->expr, R_GlobalEnv);

    if(TYPEOF(ans) == LGLSXP)
      return(LOGICAL(ans)[0] ? CXChildVisit_Recurse: CXChildVisit_Break);

    if(TYPEOF(ans) == REALSXP || TYPEOF(ans) == INTSXP) 
	return(asInteger(ans));

    return(CXChildVisit_Recurse);
}


SEXP
R_clang_visitChildren(SEXP r_tu, SEXP r_visitor, SEXP r_clone)
{
    unsigned ans;

    CXCursor *cursor = GET_REF(r_tu, CXCursor);
    RVisitorData data;
    data.clone = INTEGER(r_clone)[0];

    PROTECT(data.expr = allocVector(LANGSXP, 3));
    SETCAR(data.expr, r_visitor);

    ans = clang_visitChildren(*cursor, R_visitor, &data);   

    UNPROTECT(1);
    return(ScalarInteger(ans));
}

#if 1
/* This returns something on the stack not the heap. */
SEXP
R_clang_getTranslationUnitCursor(SEXP r_tu)
{
#if 0
    CXTranslationUnit *tu = GET_REF(r_tu, CXTranslationUnit);
#else
    CXTranslationUnit tu = (CXTranslationUnit) getRReference(r_tu);
#endif

    CXCursor cursor = clang_getTranslationUnitCursor(tu);
    return(R_makeCXCursor(cursor));
}
#endif


SEXP
R_clang_CXCursor_getKind(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    return(ScalarInteger(cur->kind));
}

SEXP
R_clang_CXCursor_getCursorLinkage(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    return(ScalarInteger(clang_getCursorLinkage(*cur)));
}

SEXP
R_clang_CXCursor_getCursorLanguage(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    return(ScalarInteger(clang_getCursorLanguage(*cur)));
}

SEXP
R_clang_CXCursor_getCursorType(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    return(ScalarInteger(clang_getCursorType(*cur).kind));  // Note not returning the CXType, just its kind.
}



void
R_free(SEXP obj)
{
  void *tmp = R_ExternalPtrAddr(obj);
  if(tmp)
      free(tmp);
}

SEXP
createRefWithFinalizer(void *val, const char * type, R_CFinalizer_t free)
{
    SEXP r_ans;
    PROTECT(r_ans = R_createReference(val, type, type));
    R_RegisterCFinalizer(GET_SLOT(r_ans, Rf_install("ref")), free);
    UNPROTECT(1);
    return(r_ans);
}

SEXP
R_makeCXCursor(CXCursor type)
{
    CXCursor *ans = (CXCursor *) malloc(sizeof(CXCursor));
    *ans = type;
    return(createRefWithFinalizer(ans, "CXCursor", R_free));
}


SEXP
R_clang_CXCursor_getCursorDefinition(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    return(R_makeCXCursor(clang_getCursorDefinition(*cur)));
}


SEXP
R_clang_CXCursor_getCursorReferenced(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    CXCursor *ans;
    ans = malloc(sizeof(CXCursor));
    *ans = clang_getCursorReferenced(*cur);
    return(createRefWithFinalizer(ans, "CXCursor", R_free));
}



SEXP
R_clang_CXCursor_getCursorCXXAccessSpecifier(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    return(ScalarInteger(clang_getCXXAccessSpecifier(*cur)));
}

SEXP
R_clang_getCursorDisplayName(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    CXString str = clang_getCursorDisplayName(*cur);
    return(CXStringToSEXP(str));
}

SEXP
R_clang_getCursorSpelling(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    CXString str = clang_getCursorSpelling(*cur);
#if 0
    SEXP ans = ScalarString(mkChar(str.Spelling));
    if(str.MustFreeString)
	clang_disposeString(str);
#else
    SEXP ans = CXStringToSEXP(str);
#endif
    return(ans);
}

SEXP 
CXStringToSEXP(CXString str)
{
#if 0
   SEXP ans = ScalarString(mkChar(str.Spelling));
   if(str.MustFreeString)
	clang_disposeString(str);
#else
   const char * const tmp = clang_getCString(str);
   SEXP ans = ScalarString(mkChar(tmp ? tmp : ""));
   clang_disposeString(str);
#endif
   return(ans);
}



SEXP
R_makeCXType(CXType type)
{
    CXType *ans = (CXType *) malloc(sizeof(CXType));
    *ans = type;
    return(R_createRef(ans, "CXType"));
}

SEXP
R_clang_getCursorType(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    CXType type = clang_getCursorType(*cur);
    return(R_makeCXType(type));
}


SEXP
R_clang_getTypeKind(SEXP r_type)
{
    CXType *type = GET_REF(r_type, CXType);
    SEXP ans;
//    CXString str;
    PROTECT(ans = ScalarInteger(type->kind));
    SET_NAMES(ans, CXStringToSEXP(clang_getTypeKindSpelling(type->kind)));
    UNPROTECT(1);
    return(ans);
}

SEXP
R_clang_getTypeSpelling(SEXP r_type)
{
    CXType *type = GET_REF(r_type, CXType);
    CXString str;
    str = clang_getTypeSpelling(*type);
    return(CXStringToSEXP(str));
}



SEXP
R_clang_getCanonicalType(SEXP r_type)
{
    CXType *type = GET_REF(r_type, CXType);
    return(R_makeCXType(clang_getCanonicalType(*type)));
}

SEXP
R_clang_getPointeeType(SEXP r_type)
{
    CXType *type = GET_REF(r_type, CXType);
    return(R_makeCXType(clang_getPointeeType(*type)));
}



SEXP
R_clang_getTypeDeclaration(SEXP r_type)
{
    CXType *type = GET_REF(r_type, CXType);
    return(R_makeCXCursor(clang_getTypeDeclaration(*type)));
}

SEXP
R_clang_getResultType(SEXP r_type)
{
    CXType *type = GET_REF(r_type, CXType);
    return(R_makeCXType(clang_getResultType(*type)));
}


SEXP
R_clang_getCursorResultType(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    CXType type = clang_getCursorResultType(*cur);
    return(R_makeCXType(type));
}


SEXP
R_clang_getClangVersion()
{
    CXString str;
    str = clang_getClangVersion();
    return(CXStringToSEXP(str));
}


/*
i = ls('package:RCIndex', pattern = "^is")
 But not isPOD and isVirtualBase.
cat(sprintf('SEXP\nR_clang_%s(SEXP r_obj)\n{\n\treturn(ScalarLogical(clang_%s(INTEGER(r_obj)[0])));\n}\n', i, i), sep = "\n")
 */

SEXP
R_clang_isDeclaration(SEXP r_obj)
{
	return(ScalarLogical(clang_isDeclaration(INTEGER(r_obj)[0])));
}

SEXP
R_clang_isExpression(SEXP r_obj)
{
	return(ScalarLogical(clang_isExpression(INTEGER(r_obj)[0])));
}

SEXP
R_clang_isPOD(SEXP r_obj)
{
    CXType *type = GET_REF(r_obj, CXType);
    return(ScalarLogical(clang_isPODType(*type)));
}

SEXP
R_clang_isStatement(SEXP r_obj)
{
	return(ScalarLogical(clang_isStatement(INTEGER(r_obj)[0])));
}

SEXP
R_clang_isTranslationUnit(SEXP r_obj)
{
	return(ScalarLogical(clang_isTranslationUnit(INTEGER(r_obj)[0])));
}

SEXP
R_clang_isUnexposed(SEXP r_obj)
{
	return(ScalarLogical(clang_isUnexposed(INTEGER(r_obj)[0])));
}

SEXP
R_clang_isVirtualBase(SEXP r_obj)
{
    CXCursor *cur = GET_REF(r_obj, CXCursor);
    return(ScalarLogical(clang_isVirtualBase(*cur)));
}


SEXP
R_clang_getInstantionLocation(SEXP r_cursor)
{
    CXCursor *cur = GET_REF(r_cursor, CXCursor);
    CXSourceRange range = clang_getCursorExtent(*cur);
    CXSourceLocation loc = clang_getRangeStart(range);
    CXFile file;
    unsigned line, col, off;
    CXString ans;

    clang_getInstantiationLocation(loc, &file, &line, &col, &off);
    ans = clang_getFileName(file);
    return(CXStringToSEXP(ans));
}

SEXP
R_getCursorTokens(SEXP r_cursor)
{
    CXCursor *cursor = GET_REF(r_cursor, CXCursor);
    /* borrowed from http://lists.cs.uiuc.edu/pipermail/cfe-dev/2012-June/022601.html */
    CXSourceRange range = clang_getCursorExtent(*cursor);

    CXTranslationUnit TU = clang_Cursor_getTranslationUnit(*cursor);

    CXToken *tokens = 0;
    unsigned int nTokens = 0;
    SEXP ans;
    clang_tokenize(TU, range, &tokens, &nTokens);
    PROTECT(ans = NEW_CHARACTER(nTokens));
    for (unsigned int i = 0; i < nTokens; i++)  {
	CXString spelling = clang_getTokenSpelling(TU, tokens[i]);
	SET_STRING_ELT(ans, i, mkChar(clang_getCString(spelling)));
	clang_disposeString(spelling);
    }
    clang_disposeTokens(TU, tokens, nTokens);
    UNPROTECT(1);
    return(ans);
}



/** Programmatically generated via basics.R **************/
SEXP R_clang_Type_getSizeOf(SEXP r_T)
{
    SEXP r_ans = R_NilValue;
    CXType T = * GET_REF(r_T, CXType);

    long long ans;
    ans = clang_Type_getSizeOf(T);

    r_ans = ScalarReal(ans) ;

    return(r_ans);
}


SEXP R_clang_getArraySize(SEXP r_T)
{
    SEXP r_ans = R_NilValue;
    CXType T = * GET_REF(r_T, CXType);

    long long ans;
    ans = clang_getArraySize(T);

    r_ans = ScalarReal(ans) ;

    return(r_ans);
}

SEXP R_clang_getNumElements(SEXP r_T)
{
SEXP r_ans = R_NilValue;
CXType T = * GET_REF(r_T, CXType);

long long ans;
ans = clang_getNumElements(T);

r_ans = ScalarReal(ans) ;

return(r_ans);
}


SEXP R_clang_getArrayElementType(SEXP r_T)
{
SEXP r_ans = R_NilValue;
CXType T = * GET_REF(r_T, CXType);

CXType ans;
ans = clang_getArrayElementType(T);

r_ans = R_makeCXType(ans) ;

return(r_ans);
}

SEXP R_clang_hashCursor(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXCursor arg1 = * GET_REF(r_arg1, CXCursor);

    unsigned int ans;
    ans = clang_hashCursor(arg1);

    r_ans = ScalarReal(ans) ;

    return(r_ans);
}





SEXP R_clang_getTokenKind(SEXP r_arg1)
{
SEXP r_ans = R_NilValue;
CXToken arg1 = * GET_REF(r_arg1, CXToken);

CXTokenKind ans;
ans = clang_getTokenKind(arg1);

r_ans = Renum_convert_CXTokenKind(ans) ;

return(r_ans);
}


SEXP R_clang_Cursor_getModule(SEXP r_C)
{
SEXP r_ans = R_NilValue;
CXCursor C = * GET_REF(r_C, CXCursor);

CXModule ans;
ans = clang_Cursor_getModule(C);

r_ans = R_createRef(ans, "CXModule") ;

return(r_ans);
}



SEXP R_clang_getCanonicalCursor(SEXP r_arg1)
{
SEXP r_ans = R_NilValue;
CXCursor arg1 = * GET_REF(r_arg1, CXCursor);

CXCursor ans;
ans = clang_getCanonicalCursor(arg1);

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




SEXP R_clang_Type_getAlignOf(SEXP r_T)
{
SEXP r_ans = R_NilValue;
CXType T = * GET_REF(r_T, CXType);

long long ans;
ans = clang_Type_getAlignOf(T);

r_ans = ScalarReal(ans) ;

return(r_ans);
}




SEXP R_clang_Type_getOffsetOf(SEXP r_T, SEXP r_S)
{
SEXP r_ans = R_NilValue;
CXType T = * GET_REF(r_T, CXType);
const char * S = CHAR(STRING_ELT(r_S, 0));

long long ans;
ans = clang_Type_getOffsetOf(T, S);

r_ans = ScalarReal(ans) ;

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

SEXP R_clang_Cursor_getArgument(SEXP r_C, SEXP r_i)
{
SEXP r_ans = R_NilValue;
CXCursor C = * GET_REF(r_C, CXCursor);
unsigned int i = REAL(r_i)[0];

CXCursor ans;
ans = clang_Cursor_getArgument(C, i);

r_ans = R_makeCXCursor(ans) ;

return(r_ans);
}





SEXP R_clang_Cursor_getReceiverType(SEXP r_C)
{
SEXP r_ans = R_NilValue;
CXCursor C = * GET_REF(r_C, CXCursor);

CXType ans;
ans = clang_Cursor_getReceiverType(C);

r_ans = R_makeCXType(ans) ;

return(r_ans);
}

SEXP R_clang_Cursor_getRawCommentText(SEXP r_C)
{
SEXP r_ans = R_NilValue;
CXCursor C = * GET_REF(r_C, CXCursor);

CXString ans;
ans = clang_Cursor_getRawCommentText(C);

r_ans = CXStringToSEXP(ans);

return(r_ans);
}




SEXP R_clang_Cursor_getBriefCommentText(SEXP r_C)
{
SEXP r_ans = R_NilValue;
CXCursor C = * GET_REF(r_C, CXCursor);

CXString ans;
ans = clang_Cursor_getBriefCommentText(C);

r_ans = CXStringToSEXP(ans) ;

return(r_ans);
}





SEXP R_clang_Module_getParent(SEXP r_Module)
{
    SEXP r_ans = R_NilValue;
    CXModule Module = (CXModule) getRReference(r_Module);
    
    CXModule ans;
    ans = clang_Module_getParent(Module);
    
    r_ans = R_createRef(ans, "CXModule") ;
    
    return(r_ans);
}


SEXP R_clang_Module_getName(SEXP r_Module)
{
    SEXP r_ans = R_NilValue;
    CXModule Module = (CXModule) getRReference(r_Module);
    
    CXString ans;
    ans = clang_Module_getName(Module);
    
    r_ans = CXStringToSEXP(ans) ;
    
    return(r_ans);
}


SEXP R_clang_Module_getFullName(SEXP r_Module)
{
    SEXP r_ans = R_NilValue;
    CXModule Module = (CXModule) getRReference(r_Module);
    
    CXString ans;
    ans = clang_Module_getFullName(Module);
    
    r_ans = CXStringToSEXP(ans) ;
    
    return(r_ans);
}


SEXP R_clang_Module_getNumTopLevelHeaders(SEXP r_arg1, SEXP r_Module)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit arg1 = (CXTranslationUnit) getRReference(r_arg1);
    CXModule Module = (CXModule) getRReference(r_Module);
    
    unsigned int ans;
    ans = clang_Module_getNumTopLevelHeaders(arg1, Module);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_Module_getTopLevelHeader(SEXP r_arg1, SEXP r_Module, SEXP r_Index)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit arg1 = (CXTranslationUnit) getRReference(r_arg1);
    CXModule Module = (CXModule) getRReference(r_Module);
    unsigned int Index = REAL(r_Index)[0];
    
    CXFile ans;
    ans = clang_Module_getTopLevelHeader(arg1, Module, Index);
    
    r_ans = R_createRef(ans, "CXFile") ;
    
    return(r_ans);
}


SEXP R_clang_equalTypes(SEXP r_A, SEXP r_B)
{
    SEXP r_ans = R_NilValue;
    CXType A = * GET_REF(r_A, CXType);
    CXType B = * GET_REF(r_B, CXType);
    
    unsigned int ans;
    ans = clang_equalTypes(A, B);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}




SEXP R_clang_CXXMethod_isStatic(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    unsigned int ans;
    ans = clang_CXXMethod_isStatic(C);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_CXXMethod_isVirtual(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    unsigned int ans;
    ans = clang_CXXMethod_isVirtual(C);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_Cursor_isDynamicCall(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    int ans;
    ans = clang_Cursor_isDynamicCall(C);
    
    r_ans = ScalarInteger(ans) ;
    
    return(r_ans);
}


SEXP R_clang_isCursorDefinition(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXCursor arg1 = * GET_REF(r_arg1, CXCursor);
    
    unsigned int ans;
    ans = clang_isCursorDefinition(arg1);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}




SEXP R_clang_isVolatileQualifiedType(SEXP r_T)
{
    SEXP r_ans = R_NilValue;
    CXType T = * GET_REF(r_T, CXType);
    
    unsigned int ans;
    ans = clang_isVolatileQualifiedType(T);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_isRestrictQualifiedType(SEXP r_T)
{
    SEXP r_ans = R_NilValue;
    CXType T = * GET_REF(r_T, CXType);
    
    unsigned int ans;
    ans = clang_isRestrictQualifiedType(T);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_isInvalid(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    enum CXCursorKind arg1 = (enum CXCursorKind) INTEGER(r_arg1)[0];
    
    unsigned int ans;
    ans = clang_isInvalid(arg1);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_Cursor_isNull(SEXP r_cursor)
{
    SEXP r_ans = R_NilValue;
    CXCursor cursor = * GET_REF(r_cursor, CXCursor);
    
    int ans;
    ans = clang_Cursor_isNull(cursor);
    
    r_ans = ScalarInteger(ans) ;
    
    return(r_ans);
}





SEXP R_clang_isReference(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    enum CXCursorKind arg1 = (enum CXCursorKind) INTEGER(r_arg1)[0];
    
    unsigned int ans;
    ans = clang_isReference(arg1);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}






SEXP R_clang_isAttribute(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    enum CXCursorKind arg1 = (enum CXCursorKind) INTEGER(r_arg1)[0];
    
    unsigned int ans;
    ans = clang_isAttribute(arg1);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}




SEXP R_clang_isPreprocessing(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    enum CXCursorKind arg1 = (enum CXCursorKind) INTEGER(r_arg1)[0];
    
    unsigned int ans;
    ans = clang_isPreprocessing(arg1);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}




SEXP R_clang_isConstQualifiedType(SEXP r_T)
{
    SEXP r_ans = R_NilValue;
    CXType T = * GET_REF(r_T, CXType);
    
    unsigned int ans;
    ans = clang_isConstQualifiedType(T);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_isFunctionTypeVariadic(SEXP r_T)
{
    SEXP r_ans = R_NilValue;
    CXType T = * GET_REF(r_T, CXType);
    
    unsigned int ans;
    ans = clang_isFunctionTypeVariadic(T);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_isPODType(SEXP r_T)
{
    SEXP r_ans = R_NilValue;
    CXType T = * GET_REF(r_T, CXType);
    
    unsigned int ans;
    ans = clang_isPODType(T);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_Cursor_isBitField(SEXP r_C)
{
    SEXP r_ans = R_NilValue;
    CXCursor C = * GET_REF(r_C, CXCursor);
    
    unsigned int ans;
    ans = clang_Cursor_isBitField(C);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_getFileTime(SEXP r_SFile)
{
    SEXP r_ans = R_NilValue;
    CXFile SFile = (CXFile) getRReference(r_SFile);
    
    time_t ans;
    ans = clang_getFileTime(SFile);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_getFile(SEXP r_tu, SEXP r_file_name)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit tu = (CXTranslationUnit) getRReference(r_tu);
    const char * file_name = CHAR(STRING_ELT(r_file_name, 0));
    
    CXFile ans;
    ans = clang_getFile(tu, file_name);
    
    r_ans = R_createRef(ans, "CXFile") ;
    
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


SEXP R_clang_getCursorLexicalParent(SEXP r_cursor)
{
    SEXP r_ans = R_NilValue;
    CXCursor cursor = * GET_REF(r_cursor, CXCursor);
    
    CXCursor ans;
    ans = clang_getCursorLexicalParent(cursor);
    
    r_ans = R_makeCXCursor(ans) ;
    
    return(r_ans);
}


SEXP R_clang_CXCursorSet_insert(SEXP r_cset, SEXP r_cursor)
{
    SEXP r_ans = R_NilValue;
    CXCursorSet cset = (CXCursorSet) getRReference(r_cset);
    CXCursor cursor = * GET_REF(r_cursor, CXCursor);
    
    unsigned int ans;
    ans = clang_CXCursorSet_insert(cset, cursor);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_CXCursorSet_contains(SEXP r_cset, SEXP r_cursor)
{
    SEXP r_ans = R_NilValue;
    CXCursorSet cset = (CXCursorSet) getRReference(r_cset);
    CXCursor cursor = * GET_REF(r_cursor, CXCursor);
    
    unsigned int ans;
    ans = clang_CXCursorSet_contains(cset, cursor);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_Location_isInSystemHeader(SEXP r_location)
{
    SEXP r_ans = R_NilValue;
    CXSourceLocation location = * GET_REF(r_location, CXSourceLocation);
    
    int ans;
    ans = clang_Location_isInSystemHeader(location);
    
    r_ans = ScalarInteger(ans) ;
    
    return(r_ans);
}


SEXP R_clang_getTranslationUnitSpelling(SEXP r_CTUnit)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit CTUnit = (CXTranslationUnit) getRReference(r_CTUnit);
    
    CXString ans;
    ans = clang_getTranslationUnitSpelling(CTUnit);
    
    r_ans = CXStringToSEXP(ans) ;
    
    return(r_ans);
}


SEXP R_clang_saveTranslationUnit(SEXP r_TU, SEXP r_FileName, SEXP r_options)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit TU = (CXTranslationUnit) getRReference(r_TU);
    const char * FileName = CHAR(STRING_ELT(r_FileName, 0));
    unsigned int options = REAL(r_options)[0];
    
    int ans;
    ans = clang_saveTranslationUnit(TU, FileName, options);
    
    r_ans = ScalarInteger(ans) ;
    
    return(r_ans);
}


SEXP R_clang_defaultReparseOptions(SEXP r_TU)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit TU = (CXTranslationUnit) getRReference(r_TU);
    
    unsigned int ans;
    ans = clang_defaultReparseOptions(TU);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_getCursorAvailability(SEXP r_cursor)
{
    SEXP r_ans = R_NilValue;
    CXCursor cursor = * GET_REF(r_cursor, CXCursor);
    
    enum CXAvailabilityKind ans;
    ans = clang_getCursorAvailability(cursor);
    
    r_ans = Renum_convert_CXAvailabilityKind(ans) ;
    
    return(r_ans);
}


SEXP R_clang_getCursorUSR(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXCursor arg1 = * GET_REF(r_arg1, CXCursor);
    
    CXString ans;
    ans = clang_getCursorUSR(arg1);
    
    r_ans = CXStringToSEXP(ans) ;
    
    return(r_ans);
}


SEXP R_clang_isFileMultipleIncludeGuarded(SEXP r_tu, SEXP r_file)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit tu = (CXTranslationUnit) getRReference(r_tu);
    CXFile file = (CXFile) getRReference(r_file);
    
    unsigned int ans;
    ans = clang_isFileMultipleIncludeGuarded(tu, file);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_getCursorReferenced(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXCursor arg1 = * GET_REF(r_arg1, CXCursor);
    
    CXCursor ans;
    ans = clang_getCursorReferenced(arg1);
    
    r_ans = R_makeCXCursor(ans) ;
    
    return(r_ans);
}
