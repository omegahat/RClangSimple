#include <math.h>

class B {

protected:
    int x;

public:
    B(int val) { x = val; }
    double func(int z) {
        x += z;
        return(sqrt(sin((double) x)));
    }
    static int F();
};


int B::F()
{
    return(20);
}

namespace Test {

    int foobar() {
        return(100);
    }

}


int 
bar(int z)
{
    B b(0);
    b.func(10);
    B::F();

    Test::foobar();
    return(2);
}

extern "C"
double
zzz(double a)
{
    return sin(sqrt(a));
}
