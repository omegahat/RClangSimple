enum Color {
    RED,
    GREEN,
    BLUE = 3
};

enum Color getNextColor();

typedef enum Color Color;

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

struct ABC abc = {
    -1, 2.5, &pi, 1, -10, -10000, 100000, "a string"
  };

struct ABC *abc_p = &abc;


