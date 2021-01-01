#include <stddef.h>

enum { A = ~ 0 };
enum { AU = ~ 0U };

enum { Asize_t = ~ ((size_t) 0) }



int x = ~0;
int u = ~0U;
size_t s = ~ ((size_t) 0);


	
