#ifdef A 
#define FOO  "foo"
#else
#define FOO  "bar"
#endif

#if 1
typedef int integer;
#endif


#define MIN(a, b) (a) < (b) ? (a) : (b)
#define MAX(a, b) (a) > (b) ? (a) : (b)

int
foo(int x, int y)
{
    return(MIN(x, y));
}
