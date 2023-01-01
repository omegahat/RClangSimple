#ifndef RCLANG_H
#define RCLANG_H

#if 0
#include <Index.h>
#else
#include <clang-c/Index.h>
#if HAVE_DOCUMENTATION_H
#include <clang-c/Documentation.h>
#endif
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


#ifndef PROBLEM
#define R_PROBLEM_BUFSIZE	4096
#define PROBLEM			{char R_problem_buf[R_PROBLEM_BUFSIZE];(snprintf)(R_problem_buf, R_PROBLEM_BUFSIZE,
#define ERROR			),Rf_error(R_problem_buf);}
#define WARNING(x)		),Rf_warning(R_problem_buf);}
#define WARN			WARNING(NULL)
#endif

#endif
