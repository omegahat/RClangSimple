
int
foo()
{
    static int ctr = 0;
    ctr++;
    return(ctr);
}
