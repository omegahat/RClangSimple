class Foo {

public:
    static int doit();
    virtual double bar(int x) = 0;
    virtual double bar(int x, double y) const;
};
