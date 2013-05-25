#define MIN(a, b) (a) < (b) ? (a) : (b)
#define MAX(a, b) (a) > (b) ? (a) : (b)

int
foo(int x, int y)
{
    return(MIN(x, y));
}
