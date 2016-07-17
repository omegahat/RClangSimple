#define FOO(x)   ((x) + 1)

int
bar()
{
    int i = 0;
    return(FOO(i));
}
