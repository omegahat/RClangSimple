int
foo(int x)
{
    int a = 1;
    int b = 2;
    const double c = 3;

    a = a + 1;

    if(x < 0)
	a = 3;

    b = 5;

    return(a + b);
}
