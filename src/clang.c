#include "RClang.h"
#include <stdlib.h>
//#define DEBUG_RCLANG_REF_COUNT 1

typedef struct TUStatus {
    const void *id;
    unsigned int count;
    struct TUStatus *next;
    struct TUStatus *prev;
} TUStatus;

TUStatus *tuTable = NULL;

int Rclang_incrementTURefCount(const void *id, const void *For);
int Rclang_decrementTURefCount(const void *id, const void *For);


R_MAKE(CXSourceLocation)
R_MAKE(CXFile)
R_MAKE(CXSourceRange)

SEXP createRefWithFinalizer(void *val, const char * type, R_CFinalizer_t free);

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

    if(val == R_NilValue)
	return(NULL);

    if(TYPEOF(tmp) != EXTPTRSXP) 
         tmp = GET_SLOT(tmp, Rf_install("ref")); 
    else
       tmp = val;
    return(R_ExternalPtrAddr(tmp));
}





SEXP
R_clang_createIndex(SEXP localPCH, SEXP diagnostics)
{
    CXIndex ans;
    ans = clang_createIndex(INTEGER(localPCH)[0], LOGICAL(diagnostics)[0]);
    return(R_createRef(ans, "CXIndex"));
}

void
R_freeTU(SEXP rtu)
{
    CXTranslationUnit ptr = (CXTranslationUnit) R_ExternalPtrAddr(rtu);
    if(ptr) {
	Rclang_decrementTURefCount(ptr, ptr);
//	clang_disposeTranslationUnit(ptr);
	R_SetExternalPtrAddr(rtu, NULL);
    }
}

SEXP
R_clang_createTUFromSource(SEXP r_idx, SEXP src, SEXP r_args, SEXP r_options) //SEXP r_unsavedFiles
{
    int nargs = Rf_length(r_args);
    CXTranslationUnit ans;
    CXIndex idx = GET_REF(r_idx, CXIndex);

    int i;
// "-Xclang" , "-include-pch=IndexTest.pch"
    const char * *args = (const char * *) malloc(nargs * sizeof(char *));
    for(i = 0; i < nargs; i++) 
	args[i] = CHAR(STRING_ELT(r_args, i));

#if 0
    ans = clang_createTranslationUnitFromSourceFile(idx, CHAR(STRING_ELT(src, 0)), nargs, args, 0, 0);
#else
    unsigned options  = INTEGER(r_options)[0];
    struct CXUnsavedFile *unsaved = NULL;
    int numUnsaved = 0;
/*
    if((numUnsaved = Rf_length(r_unsavedFiles))) {
	unsaved = (CXUnsavedFile *) R_alloc(sizeof(CXUnsavedFile), numUnsaved);
	SEXP r_filenames = GET_NAMES(r_unsagedFiles);
	for(i = 0; i < numUnsaved; i++) {
	    unsaved[i].Filename = CHAR(STRING_ELT(r_filenames, i));
	    unsaved[i].Contents = CHAR(STRING_ELT(r_filenames, i));
	}
    }
*/
    ans = clang_parseTranslationUnit(idx, CHAR(STRING_ELT(src, 0)), args, nargs, unsaved, numUnsaved,  options);
#endif

    if(!ans) {
	PROBLEM "can't create the translation unit for %s", CHAR(STRING_ELT(src, 0))
	    ERROR;
    }

    Rclang_incrementTURefCount(ans, ans);
    return(createRefWithFinalizer(ans, "CXTranslationUnit", R_freeTU));
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
    if(cursor) {
#if 0
#if 0
	fprintf(stderr, "%d\n", (int )cursor->data[0]);
#else
        fprintf(stderr, "%d\n", (int )cursor->kind);
#endif
#endif
    }
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
    CXCursorVisitor fun = R_visitor;
    RVisitorData data;
    data.clone = INTEGER(r_clone)[0];

    if(TYPEOF(r_visitor) == CLOSXP) {
	PROTECT(data.expr = allocVector(LANGSXP, 3));
        SETCAR(data.expr, r_visitor);
    } else 
	fun = (CXCursorVisitor) R_ExternalPtrAddr(r_visitor);

    ans = clang_visitChildren(*cursor, fun, &data);   

    if(TYPEOF(r_visitor) == CLOSXP)
	UNPROTECT(1);

    return(ScalarInteger(ans));
}


void
R_inclusion_visitor(CXFile included_file, CXSourceLocation *stack, unsigned stackLen, CXClientData userData)
{
    SEXP ptr, r_stack;
    RVisitorData *d;
    int i;

    d = (RVisitorData *) userData;
    ptr = CDR(d->expr);

    CXString str = clang_getFileName(included_file);
//    fprintf(stderr, "CFile %s\n", clang_getCString(str));
    clang_disposeString(str);    

    PROTECT(r_stack = NEW_LIST(stackLen));
    for(i = 0; i < stackLen; i++) {
	SET_VECTOR_ELT(r_stack, i, R_createRef(stack + i, "CXSourceLocation"));
    }

    SETCAR(ptr, R_createRef(included_file, "CXFile"));
    ptr = CDR(ptr);
    SETCAR(ptr, r_stack);

    Rf_eval(d->expr, R_GlobalEnv);
    UNPROTECT(1);
}


SEXP
R_clang_getInclusions(SEXP r_tu, SEXP r_visitor)
{
    CXTranslationUnit tu = (CXTranslationUnit) GET_REF(r_tu, CXTranslationUnit);
    CXInclusionVisitor fun = R_inclusion_visitor;
    RVisitorData data;
//    data.clone = LOGICAL(r_clone)[0];

    if(TYPEOF(r_visitor) == CLOSXP) {
	PROTECT(data.expr = allocVector(LANGSXP, 3));
        SETCAR(data.expr, r_visitor);
    } else 
	fun = (CXInclusionVisitor) R_ExternalPtrAddr(r_visitor);

    clang_getInclusions(tu, fun, &data);   

    if(TYPEOF(r_visitor) == CLOSXP)
	UNPROTECT(1);

    return(R_NilValue);
}



SEXP
R_clang_getCXTUResourceUsage(SEXP r_tu)
{

    CXTranslationUnit tu =  (CXTranslationUnit) getRReference(r_tu);

    CXTUResourceUsage usage = clang_getCXTUResourceUsage(tu);
    SEXP r_ans, r_names;
    int i;
    PROTECT(r_ans = NEW_NUMERIC(usage.numEntries));
    PROTECT(r_names = NEW_CHARACTER(usage.numEntries));
    for(i = 0; i < usage.numEntries; i++) {
	REAL(r_ans)[i] = usage.entries[i].amount;
	SET_STRING_ELT(r_names, i, mkChar(clang_getTUResourceUsageName(usage.entries[i].kind)));
    }
    clang_disposeCXTUResourceUsage(usage);
    SET_NAMES(r_ans, r_names);
    UNPROTECT(2);
    return(r_ans);
}







#if 1
/* This returns something on the stack not the heap. So R_makeCXCursor copies it.
   Not recursively hoever.*/
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
#if DEBUG_RCLANG_REF_COUNT
  fprintf(stderr, "free: typeof %d\n", TYPEOF(obj));
#endif
  if(tmp) {
#if DEBUG_RCLANG_REF_COUNT
fprintf(stderr, "free: %p\n", tmp);
#endif
      free(tmp);
      R_SetExternalPtrAddr(obj, NULL);
  }
}

SEXP
createRefWithFinalizer(void *val, const char * type, R_CFinalizer_t free)
{
    SEXP r_ans;
    PROTECT(r_ans = R_createReference(val, type, type));
#if DEBUG_RCLANG_REF_COUNT
fprintf(stderr, " R reference to %s ", type);
Rf_PrintValue(GET_SLOT(r_ans, Rf_install("ref")));
#endif
    R_RegisterCFinalizer(GET_SLOT(r_ans, Rf_install("ref")), free);
    UNPROTECT(1);
    return(r_ans);
}


int
Rclang_incrementTURefCount(const void *id, const void *For)
{
    TUStatus *ptr = tuTable;
    while(ptr) {
	if(ptr->id == id) {
#if DEBUG_RCLANG_REF_COUNT
 fprintf(stderr, "incrementing TU %p (%d) for %p\n", id, ptr->count + 1, For);
#endif
	    return(ptr->count++);
	}
	ptr = ptr->next;
    }
    if(!ptr) {
#if DEBUG_RCLANG_REF_COUNT
fprintf(stderr, "registering TU %p\n", id);
#endif
	ptr = malloc(sizeof(TUStatus));
	ptr->id = id;
	ptr->count = 1;
	ptr->next = tuTable;
	ptr->prev = NULL;
	if(tuTable)
	    tuTable->prev = ptr;
	tuTable = ptr;
    }
    return(1);
}

void
removeTuTable(TUStatus *ptr)
{
    if(!ptr)
	return;

    if(ptr == tuTable) {
	tuTable = ptr->next;
	if(tuTable)
	    tuTable->prev = NULL;
    } else {
	ptr->prev->next = ptr->next;
	if(ptr->next)
	    ptr->next->prev = ptr->prev;
    }
    ptr->next = ptr->prev = NULL;
    free(ptr);
}

int
Rclang_decrementTURefCount(const void *id, const void *For)
{
    TUStatus *ptr = tuTable;
    while(ptr) {
	if(ptr->id == id) {
#if DEBUG_RCLANG_REF_COUNT
fprintf(stderr, "decrementing TU %p (%d) for %p\n", id, (int) ptr->count, For);
#endif
	    ptr->count--;
	    if(ptr->count == 0) {
#if DEBUG_RCLANG_REF_COUNT
		fprintf(stderr, "!!!  releasing the translation unit\n");
#endif
		clang_disposeTranslationUnit(ptr->id);		
		removeTuTable(ptr);
	    }
	    return(1);
	}
	ptr = ptr->next;
    }
    if(!ptr) {
	// !
#if DEBUG_RCLANG_REF_COUNT
fprintf(stderr, "**** couldn't find TU %p  for %p\n", id, For);
#endif
    }
    return(0);
}


void 
R_freeCursor(SEXP r_obj)
{
    CXCursor *cur = (CXCursor *) R_ExternalPtrAddr(r_obj);
    Rclang_decrementTURefCount(clang_Cursor_getTranslationUnit(*cur), cur);
    R_free(r_obj); // (void*) cur);
    R_SetExternalPtrAddr(r_obj, NULL);
}

SEXP
R_makeCXCursor(CXCursor type)
{
    CXCursor *ans = (CXCursor *) malloc(sizeof(CXCursor));
#if DEBUG_RCLANG_REF_COUNT
fprintf(stderr, "malloc cursor: %p\n", ans);
#endif
    *ans = type;
//fprintf(stderr, "cursor -> TU: %p\n", (void*) type.data[2]);
    Rclang_incrementTURefCount(clang_Cursor_getTranslationUnit(*ans), ans);
    return(createRefWithFinalizer(ans, "CXCursor", R_freeCursor));
}


SEXP
R_clang_getCursorDefinition(SEXP r_cursor)
{
    CXCursor *cur =  GET_REF(r_cursor, CXCursor);
    return(R_makeCXCursor(clang_getCursorDefinition(*cur)));
}


/* Redundant now with programattically generated version */
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
   clang_disposeString(str);  // ???? should we do this here.
#endif
   return(ans);
}


void 
R_freeType(SEXP r_obj)
{
    CXType *ty = (CXType *) R_ExternalPtrAddr(r_obj);
    Rclang_decrementTURefCount(ty->data[1], ty);
    R_free(r_obj); 
    R_SetExternalPtrAddr(r_obj, NULL);
}


SEXP
R_makeCXType(CXType type)
{
    CXType *ans = (CXType *) malloc(sizeof(CXType));
    *ans = type;
    Rclang_incrementTURefCount(type.data[1], ans);//XXXX looking at the internal details of libclang.
    return(createRefWithFinalizer(ans, "CXType", R_freeType));
//    return(R_createRef(ans, "CXType"));
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
R_clang_getCursorExtent(SEXP r_cursor)
{
    CXCursor *cur = GET_REF(r_cursor, CXCursor);
    CXSourceRange range = clang_getCursorExtent(*cur);
    return(R_makeCXSourceRange(range));
}
//    CXSourceLocation loc = clang_getRangeStart(range);

SEXP
R_clang_getInstantiationLocation(SEXP r_loc)
{
    CXSourceLocation loc = * GET_REF(r_loc, CXSourceLocation);
    CXFile file;
    unsigned line, col, off;
    CXString ans;

    clang_getInstantiationLocation(loc, &file, &line, &col, &off);
    ans = clang_getFileName(file);
    SEXP r_ans, tmp;
    PROTECT(r_ans = NEW_LIST(2));
    SET_VECTOR_ELT(r_ans, 0, CXStringToSEXP(ans));
    SET_VECTOR_ELT(r_ans, 1,tmp = NEW_REAL(3));
    REAL(tmp)[0] = line;
    REAL(tmp)[1] = col;
    REAL(tmp)[2] = off;
    UNPROTECT(1);
    return(r_ans);
}


SEXP
R_clang_getExpansionLocation(SEXP r_loc)
{
    CXSourceLocation loc = * GET_REF(r_loc, CXSourceLocation);
    CXFile file;
    unsigned line, col, off;
    CXString ans;

    clang_getExpansionLocation(loc, &file, &line, &col, &off);
    ans = clang_getFileName(file);
    SEXP r_ans, tmp;
    PROTECT(r_ans = NEW_LIST(2));
    SET_VECTOR_ELT(r_ans, 0, CXStringToSEXP(ans));
    SET_VECTOR_ELT(r_ans, 1,tmp = NEW_REAL(3));
    REAL(tmp)[0] = line;
    REAL(tmp)[1] = col;
    REAL(tmp)[2] = off;
    UNPROTECT(1);
    return(r_ans);
}



SEXP
R_clang_getPresumedLocation(SEXP r_loc)
{
    CXSourceLocation loc = * GET_REF(r_loc, CXSourceLocation);
    CXString str;
    unsigned line, col;

    clang_getPresumedLocation(loc, &str, &line, &col);
    SEXP r_ans, tmp;
    PROTECT(r_ans = NEW_LIST(2));
    SET_VECTOR_ELT(r_ans, 0, CXStringToSEXP(str));
    SET_VECTOR_ELT(r_ans, 1,tmp = NEW_REAL(2));
    REAL(tmp)[0] = line;
    REAL(tmp)[1] = col;

    UNPROTECT(1);
    return(r_ans);
}



const char *TokenKindNames[] = {"Punctuation", "Keyword", "Identifier", "Literal", "Comment"};
const char * const 
getTokenKindName(CXTokenKind val)
{
    return(TokenKindNames[val]);
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
    SEXP ans, names;
    clang_tokenize(TU, range, &tokens, &nTokens);
    PROTECT(ans = NEW_CHARACTER(nTokens));
    PROTECT(names = NEW_CHARACTER(nTokens));

    for (unsigned int i = 0; i < nTokens; i++)  {
	CXString spelling = clang_getTokenSpelling(TU, tokens[i]);
	SET_STRING_ELT(ans, i, mkChar(clang_getCString(spelling)));
	CXTokenKind kind = clang_getTokenKind(tokens[i]);
	SET_STRING_ELT(names, i, mkChar(getTokenKindName(kind)));
	clang_disposeString(spelling);
    }
    clang_disposeTokens(TU, tokens, nTokens);

    SET_NAMES(ans, names);
    UNPROTECT(2);
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
    
    r_ans = ScalarLogical(ans) ; // manually changed. Do this by changing the return type in the R description of the object.
    
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


SEXP R_clang_getDiagnosticSetFromTU(SEXP r_Unit)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit Unit = (CXTranslationUnit) getRReference(r_Unit);
    
    CXDiagnosticSet ans;
    ans = clang_getDiagnosticSetFromTU(Unit);
    
    r_ans = R_createRef(ans, "CXDiagnosticSet") ;
    
    return(r_ans);
}


SEXP R_clang_getDiagnosticInSet(SEXP r_diags, SEXP r_index)
{
    SEXP r_ans = R_NilValue;
    CXDiagnosticSet diags = (CXDiagnosticSet) getRReference(r_diags);
    CXDiagnostic ans;
    ans = clang_getDiagnosticInSet(diags, INTEGER(r_index)[0]);
    
    r_ans = R_createRef(ans, "CXDiagnostic") ;
    
    return(r_ans);
}

SEXP R_clang_getNumDiagnosticsInSet(SEXP r_Diags)
{
    SEXP r_ans = R_NilValue;
    CXDiagnosticSet Diags = (CXDiagnosticSet) getRReference(r_Diags);
    
    unsigned int ans;
    ans = clang_getNumDiagnosticsInSet(Diags);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
} 


SEXP R_clang_getDiagnostic(SEXP r_Unit, SEXP r_Index)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit Unit = (CXTranslationUnit) getRReference(r_Unit);
    unsigned int Index = REAL(r_Index)[0];
    
    CXDiagnostic ans;
    ans = clang_getDiagnostic(Unit, Index);
    
    r_ans = R_createRef(ans, "CXDiagnostic") ;
    
    return(r_ans);
}


SEXP R_clang_getNumDiagnostics(SEXP r_Unit)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit Unit = (CXTranslationUnit) getRReference(r_Unit);
    
    unsigned int ans;
    ans = clang_getNumDiagnostics(Unit);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_defaultDiagnosticDisplayOptions()
{
    SEXP r_ans = R_NilValue;
    
    unsigned int ans;
    ans = clang_defaultDiagnosticDisplayOptions();
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
}


SEXP R_clang_getDiagnosticSpelling(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXDiagnostic arg1 = (CXDiagnostic) getRReference(r_arg1);
    
    CXString ans;
    ans = clang_getDiagnosticSpelling(arg1);
    
    r_ans = CXStringToSEXP(ans) ;
    
    return(r_ans);
}


SEXP R_clang_getDiagnosticLocation(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXDiagnostic arg1 = (CXDiagnostic) getRReference(r_arg1);
    
    CXSourceLocation ans;
    ans = clang_getDiagnosticLocation(arg1);
    
    r_ans = R_makeCXSourceLocation(ans) ;
    
    return(r_ans);
}


SEXP R_clang_getDiagnosticSeverity(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXDiagnostic arg1 = (CXDiagnostic) getRReference(r_arg1);
    
    enum CXDiagnosticSeverity ans;
    ans = clang_getDiagnosticSeverity(arg1);
    
    r_ans = Renum_convert_CXDiagnosticSeverity(ans) ;
    
    return(r_ans);
}


SEXP R_clang_formatDiagnostic(SEXP r_Diagnostic, SEXP r_Options)
{
    SEXP r_ans = R_NilValue;
    CXDiagnostic Diagnostic = (CXDiagnostic) getRReference(r_Diagnostic);
    unsigned int Options = REAL(r_Options)[0];
    
    CXString ans;
    ans = clang_formatDiagnostic(Diagnostic, Options);
    
    r_ans = CXStringToSEXP(ans) ;
    
    return(r_ans);
}


SEXP R_clang_getDiagnosticNumRanges(SEXP r_arg1)
{
    SEXP r_ans = R_NilValue;
    CXDiagnostic arg1 = (CXDiagnostic) getRReference(r_arg1);
    
    unsigned int ans;
    ans = clang_getDiagnosticNumRanges(arg1);
    
    r_ans = ScalarReal(ans) ;
    
    return(r_ans);
} 

/*  */
SEXP R_clang_disposeIndex(SEXP r_index)
{
    SEXP r_ans = R_NilValue;
    CXIndex index = (CXIndex) getRReference(r_index);
    
    clang_disposeIndex(index);
    
    return(r_ans);
} 


SEXP R_clang_toggleCrashRecovery(SEXP r_isEnabled)
{
    SEXP r_ans = R_NilValue;
    unsigned int isEnabled = REAL(r_isEnabled)[0];
    
    clang_toggleCrashRecovery(isEnabled);
    
    
    return(r_ans);
} 

SEXP R_clang_getFunctionTypeCallingConv(SEXP r_T)
{
    SEXP r_ans = R_NilValue;
    CXType T = * GET_REF(r_T, CXType);
    
    enum CXCallingConv ans;
    ans = clang_getFunctionTypeCallingConv(T);
    
    r_ans = Renum_convert_CXCallingConv(ans) ;
    
    return(r_ans);
} 


SEXP R_clang_getLocation(SEXP r_tu, SEXP r_file, SEXP r_line, SEXP r_column)
{
    SEXP r_ans = R_NilValue;
    CXTranslationUnit tu = (CXTranslationUnit) getRReference(r_tu);
    CXFile file = (CXFile) getRReference(r_file);
    unsigned int line = REAL(r_line)[0];
    unsigned int column = REAL(r_column)[0];
    
    CXSourceLocation ans;
    ans = clang_getLocation(tu, file, line, column);
    
    r_ans = R_makeCXSourceLocation(ans) ;
    
    return(r_ans);
} 


/*-------------------------------*/
/* This is code that I can call from LLVM and use as a test. */

typedef int (*LLVMVisitor)(CXCursor *cur, CXCursor *parent);

int
R_visitor_with_pointers(CXCursor cur, CXCursor parent, LLVMVisitor fun)
{
    return(fun(&cur, &parent));
} 

SEXP
R_clang_visitChildren_LLVM_test(SEXP r_tu, SEXP r_visitor, SEXP r_clone)
{
    unsigned ans;

    CXCursor *cursor = GET_REF(r_tu, CXCursor);
    LLVMVisitor *fun = (LLVMVisitor*) R_ExternalPtrAddr(r_visitor);

    ans = clang_visitChildren(*cursor, R_visitor_with_pointers, fun);   
    return(ScalarInteger(ans));
}



int
clang_CXCursor_kind(CXCursor cur)
{
    return(clang_getCursorKind(cur));
}

const char *
clang_CXCursor_getName(CXCursor cur)
{
    CXString cstr = clang_getCursorSpelling(cur);
    const char *str =  clang_getCString(cstr);
    return(str);
}


/***********************************************/
/* This is for faster, specialized  visitors for specific tasks
   that we don't want to do with R functions, until we can compile them
   with Rllvm to take a cursor as an argument, and not a pointer.
  */
typedef struct {
    SEXP ans;
    SEXP names;
    int counter;
    int protects;
} RCallCounter;

enum CXChildVisitResult 
R_callVisitor(CXCursor cur, CXCursor parent, void *data)
{
    RCallCounter *d = (RCallCounter *) data;
    if(cur.kind == CXCursor_CallExpr) {
	CXString str = clang_getCursorSpelling(cur);
	const char * const tmp = clang_getCString(str);
	SET_STRING_ELT(d->ans, d->counter++, mkChar(tmp));
	clang_disposeString(str);
    }
    return(CXChildVisit_Recurse);
}


SEXP
R_getCalls(SEXP r_tu, SEXP r_ans)
{
    CXCursor tu = * (CXCursor *) getRReference(r_tu);
    RCallCounter data;
    data.counter = 0;
    data.ans = r_ans;

    clang_visitChildren(tu, R_callVisitor, &data);
    SET_LENGTH(r_ans, data.counter);
    return(r_ans);
}


enum CXChildVisitResult 
R_routinesVisitor(CXCursor cur, CXCursor parent, void *data)
{
    RCallCounter *d = (RCallCounter *) data;
    if(cur.kind == CXCursor_FunctionDecl) {
	CXString str = clang_getCursorSpelling(cur);
	const char * const tmp = clang_getCString(str);
	int n = Rf_length(d->ans);
	if(d->counter >= n) {
	    PROTECT(SET_LENGTH(d->ans, 2*n));
	    PROTECT(SET_LENGTH(d->names, 2*n));
	    d->protects += 2;
	}
	SET_VECTOR_ELT(d->ans, d->counter, R_makeCXCursor(cur));
	SET_STRING_ELT(d->names, d->counter, mkChar(tmp));
	d->counter++;
	clang_disposeString(str);
    }
    return(CXChildVisit_Recurse);
}


SEXP
R_getRoutines(SEXP r_tu, SEXP r_ans, SEXP r_names)
{
    CXCursor tu = * (CXCursor *) getRReference(r_tu);
    RCallCounter data;
    data.counter = data.protects = 0;
    data.ans = r_ans;
    data.names = r_names;

    clang_visitChildren(tu, R_routinesVisitor, &data);
    SET_NAMES(data.ans, data.names);
    SET_LENGTH(data.ans, data.counter);
    UNPROTECT(data.protects);
    
    return(data.ans);
}



SEXP
R_getPointerAddress(SEXP r_ref)
{
    void *p = getRReference(r_ref);
    char buf[100];
    sprintf(buf, "%p", p);
    return(mkString(buf));
}
