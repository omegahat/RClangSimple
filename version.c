#include <clang-c/Index.h>
#include <stdio.h>

int
main(int argc, char *argv[])
{
    CXString str;
    str = clang_getClangVersion();
    const char * const tmp = clang_getCString(str);
    printf("%s\n", tmp);
    clang_disposeString(str);  // ???? should we do this here.
    return(1);
}
