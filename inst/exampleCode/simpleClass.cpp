class Sprite {

protected:
	int layer;
};

class  Shape {

private:
 int _hash;

 static int count;

protected: 
    double x, y;

public:
    virtual void draw();
    virtual double area();
    void move(double X, double Y) {
        x = X;
        y = Y;
    }


    Shape(double X = 0, double Y = 0) : x(X), y(Y) {}
//        x = X; y = Y;

};

class Circle : Shape, Sprite {

protected:
    double r;

public:
    Circle(double R, double X = 0, double Y = 0) : Shape(X, Y) {
        r = R;
    }

    
};
