int
fixed(int * const x, int nels)
{
    int i, total = 0;
    for(i = 0; i < nels; i++)
	total += x[i];
    return(total);
}


int
bar(int *x, int nels)
{
    int i;
    for(i = 0; i < nels; i++)
	x[i] = i;
    return(0);
}


int
foo(int *x)
{
    x[0] = 1;
    return(0);
}

int
foo1(int *x)
{
    *x = 1;
    return(0);
}
