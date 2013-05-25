#include <math.h>

int
square_sin(int *val, int len, double *ans)
{
    int i;
    for(i = 0; i < len ; i++) {
	double tmp = sin(val[i]);
	ans[i] = tmp * tmp;
    }
    return(len);
}


void
string1(char *x)
{

}


void
string2(const char *x)
{

}


typedef long VecSize;

void
typedefn(VecSize s)
{

}

