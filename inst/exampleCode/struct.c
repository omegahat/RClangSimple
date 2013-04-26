struct X {
    int a, b, c;
};

typedef struct {
    int i;
    double d;
    char *str;
    char stringArray[100];
    float f;
    struct X x;
} Foo; 

typedef struct LL {
    char *data;
    struct LL *next, *prev;
} LinkedList;
