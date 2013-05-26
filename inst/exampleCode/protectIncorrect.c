#include <Rinternals.h>
SEXP
R_foo_incorrect(SEXP r_x)
{
  SEXP ans, names;
  int n = Rf_length(r_x);
  double *x = REAL(x);
  ans = NEW_NUMERIC(n);
  names = NEW_CHARACTER(n);
  for(int i = 0; i < n; i++) {
    char *str;
    REAL(ans)[i] = foo(x[i], &str);
    SET_STRING_ELT(names, i, 
                       mkChar(str));
  }
  SET_NAMES(ans, names);
  return(ans);
}

