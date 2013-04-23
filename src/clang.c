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
	args[i] = CHAR(STRING_ELT(r_args, 0));
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

    if(TYPEOF(ans) == LGLSXP))
      return(LOGICAL(ans)[0] : CXChildVisit_Recurse: CXChildVisit_Break);

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
R_clang_getCursorSpelling(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    CXString str = clang_getCursorSpelling(*cur);
#if 0
    SEXP ans = ScalarString(mkChar(str.Spelling));
    if(str.MustFreeString)
	clang_disposeString(str);
#else
    SEXP ans = ScalarString(mkChar(clang_getCString(str)));
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
R_clang_getFile(SEXP r_cursor)
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
