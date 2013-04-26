typedef int (*Handler)(int x, double y);

int
foo( Handler f, int *x, int len)
{
    int i, ans = 0;
    for(i = 0; i < len; i++) {
	ans += f(i, x[i]);
    }
    return(ans);
}
