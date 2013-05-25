int
foo(int *x, int len)
{
    for(int i = 0; i < len; i++)
	x[i] = 2*x[i];
    return(len);
}

int
bar(int *x, int len)
{
    int total = 0;
    for(int i = 0; i < len; i++)
	total = 2*x[i];
    return(total);
}



int
foo1(int *x, int len)
{
    for(int i = 0; i < len; i++)
	*(x + i) = 2*x[i];
    return(len);
}


void
simple(int *x)
{
    x[0] = 1;
    *x = 2;
}

void
indirect(int *x)
{
    int *y = x;
    y[0] = 1;
    *y = 2;
}

void
indirect2(int **x)
{
    int *y = x[0];
    y[0] = 1;
    *y = 2;
}

/* recursive where we pass a pointer which is then passed to another routine. Need to analyze that routine. */

struct Foo {
    int i;
    double d;
};

void
simpleStruct(struct Foo *x)
{
    int y[3];
    x->i = 1;
    y[2] = x->i;
}
