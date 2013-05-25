template <class T>
class RVector
{
protected:
    long nels;
    T *data;
//    RVector<char *> names;

public:
    long length() { return(nels); }
    T operator[](long i) { return(data[i]);}
};


RVector<int> i;
RVector<double> d;

