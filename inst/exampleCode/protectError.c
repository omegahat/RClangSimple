#include <Rdefines.h>

SEXP
R_foo(SEXP r_int)
{
    SEXP r_ans, r_names;
    int n = INTEGER(r_int)[0];

    r_ans = NEW_LIST(n);
    r_names =  NEW_CHARACTER(n);
    SET_NAMES(r_ans, r_names);
    return(r_ans);
}

SEXP
R_bar(SEXP r_int)
{
    SEXP r_ans, r_names;
    int n = INTEGER(r_int)[0];

    PROTECT(r_ans = NEW_LIST(n));
    PROTECT(r_names =  NEW_CHARACTER(n));
    SET_NAMES(r_ans, r_names);
    UNPROTECT(1);
    return(r_ans);
}

/* Two calls to UNPROTECT() */
SEXP
R_foobar(SEXP r_int)
{
    SEXP r_ans, r_names;
    int n = INTEGER(r_int)[0];

    PROTECT(r_ans = NEW_LIST(n));
    PROTECT(r_names =  NEW_CHARACTER(n));
    SET_NAMES(r_ans, r_names);
    UNPROTECT(1);
    UNPROTECT(1);
    return(r_ans);
}


/* Use a counter */
SEXP
R_foobar_ctr(SEXP r_int)
{
    SEXP r_ans, r_names;
    int n = INTEGER(r_int)[0];
    int allocCount = 0;

    PROTECT(r_ans = NEW_LIST(n)); allocCount++;
    PROTECT(r_names =  NEW_CHARACTER(n)); allocCount++;
    SET_NAMES(r_ans, r_names);
    UNPROTECT(allocCount);
    return(r_ans);
}
