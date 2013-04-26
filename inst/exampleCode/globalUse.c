
void bar();

int  x = 0;
double d;

int
foo(int a)
{
    if(x == 0)
	x++;

    return(a + x + d);
}

void
bar()
{
    x++;
}
