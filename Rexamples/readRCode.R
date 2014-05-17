src = sprintf("%s/src/main/random.c", R.home())
incs = sprintf("%s/src/include", R.home())
tu = createTU(src, includes = incs, args = "-DHAVE_CONFIG_H")
