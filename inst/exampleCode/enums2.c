enum Color {
    RED,
    GREEN,
    BLUE = 3
};

enum Color getNextColor();

typedef enum Color Color;

Color getColor(int val);

enum Grade {
    A,
    B,
    C,
    D,
    F
};

enum {
    History,
    Physics,
    Mathematics,
    Statistics
};

int
foo()
{
    return(History);
}
