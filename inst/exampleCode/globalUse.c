
void bar();

int  x = 0;
double d;

static int fileLocal = 1;
static char * const str = 0;
static char *  str1 = 0;
static const char * const str2  = 0;

const static int food;
const int static dog;

void
updateCounter()
{
  static int counter = 0;
  counter++;
}


int
foo(int a)
{
    if(x == 0)
	x++;

    return(a + x + d);
}

void
bar()
{
    x++;
}
