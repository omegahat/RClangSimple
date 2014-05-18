#ifndef RCLANG_H
#define RCLANG_H

#if 0
#include <Index.h>
#else
#include <clang-c/Index.h>
#endif


#include <Rdefines.h>

#include "RConverters.h"

SEXP CXStringToSEXP(CXString str);

#include "enumDecls.h"
#include "structDecls.h"

void * getRReference(SEXP val);
SEXP R_createReference(void *ptr, const char * const className, const char * tag);

#ifdef GET_REF
#undef GET_REF
#endif

#define GET_REF(val, type) \
    (type *) getRReference(val)

#define R_createRef(val, type) R_createReference(val, type, type)

SEXP R_makeCXType(CXType);
SEXP R_makeCXCursor(CXCursor);
SEXP R_makeCXSourceLocation(CXSourceLocation type);
SEXP R_makeCXFile(CXFile type);
SEXP R_makeCXSourceRange(CXSourceRange type);
SEXP R_makeCXComment(CXComment type);
#endif
