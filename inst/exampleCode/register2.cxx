#include <Rinternals.h>

extern "C"
SEXP
cppRoutine(SEXP a)
{
    return(ScalarInteger(Rf_length(a)));
}
