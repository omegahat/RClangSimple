library(RCIndex)

# This reads R's random.c file. It assumes it is in a R.home()/src/main/random.c

src = sprintf("%s/src/main/random.c", R.home())
incs = sprintf("%s/src/include", R.home())
tu = createTU(src, includes = incs, args = "-DHAVE_CONFIG_H")
