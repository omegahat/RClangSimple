typedef int (*Handler)(int x, double y);
typedef int Bob;

Bob (*fun)(int, int);

typedef struct _Bar {int i; double d;} Bar;

typedef struct _Foo {
    Bob (*f)(int x, double y, Handler h, void (*p)(int, double));
    int i;
    Bob (*g)(Bar, int);
    Bob (*h)(Bar x, int i);
    Bob (*z)(Bar, int i);
} Foo;



int
foo( Handler f, int *x, int len)
{
    int i, ans = 0;
    for(i = 0; i < len; i++) {
	ans += f(i, x[i]);
    }
    return(ans);
}
