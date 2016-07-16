#define FOO(n, id)  id = n

enum Defs {
    FOO(3, ABC),
    FOO(7, XYZ)
};

enum Color {
    RED,
    GREEN,
    BLUE = 3,
    ORANGE = 8,
    YELLOW
};

enum Foo {
    abc = 1 << 2,
    xyz = 1 << 3
};

enum Self {
    A = 2,
    B,
    C = A,
    D = A + B    
};

enum Plus {
    P = +2,
    M = -1,
    PM = -P
} ;

enum Color getNextColor();

typedef enum Color Color;
typedef enum Color eColor;

Color getColor(int val);


#define PI 3.1415


struct ABC {

    int i;
    double d;
    double *p_d;
    unsigned short us;
    short s;
    long l;
    unsigned long ul;
    char *str;
};


extern double sin(double); // #include <math.h>
double foobar(int x, double y, struct ABC *abc)
{
    return( x + y - sin(abc->d));
}


int MyInt = 3;
const int MyOtherInt = 3;

double pi = 3.1415;

struct ABC abc_ = {
    -1, 2.5, &pi, 1, -10, -10000, 100000, "a string"
  };

struct ABC *abc_p = &abc_;


