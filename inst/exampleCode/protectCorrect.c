#include <Rinternals.h>
SEXP
R_foo_correct(SEXP r_x)
{
  SEXP ans, names;
  int n = Rf_length(r_x);
  double *x = REAL(x);
  PROTECT(ans = NEW_NUMERIC(n));
  PROTECT(names = NEW_CHARACTER(n));
  for(int i = 0; i < n; i++) {
    char *str;
    REAL(ans)[i] = foo(x[i], &str);
    SET_STRING_ELT(names, i, 
                     mkChar(str));
  }
  SET_NAMES(ans, names);
  UNPROTECT(2);
  return(ans);
}

