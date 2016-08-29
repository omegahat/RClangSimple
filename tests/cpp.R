library(RCIndex)
tu = createTU(system.file("exampleCode", "simpleClass.cpp", package = "RCIndex"))

top = as(tu, 'CXCursor')

sh = top[[2]] # Shape
dr = sh[[8]]

