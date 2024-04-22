template <typename A, typename B> class Bar {

    A a;
    B b;
    void show();
};

class Foo : public Bar<int, double> {

    void show();
};
    
