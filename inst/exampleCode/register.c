#include <Rdefines.h>

SEXP
foo(SEXP a, SEXP b)
{
    return(R_NilValue);
}

void
bar(int *x, double *y, int *len, void *ptr, char **str)
{
    int i;
    for(i = 0; i < *len; i++) {
	x[i] = x[i] + y[i]; 
    }
}

int
no(int *x, double *y, int *len)
{
    return(1);
}
