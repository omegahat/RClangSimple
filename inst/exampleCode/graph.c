
void A();
void B();
void C();
void D();

void J();

void x();
void y();
void z();


void A()
{
    B();
    C();
}
void B()
{
    D();
}
void C()
{
    D();
    A();
    C();
}

void D()
{
    A();
}

void bob();
void J() {
    bob();
}

void x()
{
    y();
    z();
}
void y()
{
    z();
}
void z()
{
    y();
    x();
}
