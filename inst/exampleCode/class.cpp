class Foo {

protected:
    int a;
    static long ctr;
    
public:
    static int doit(){
        ctr = ctr + 1;
    };
    virtual double bar(int x);
    virtual double bar(int x, double y);
};
