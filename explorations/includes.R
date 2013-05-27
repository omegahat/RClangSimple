library(RCIndex)

inc = getInclusions("inst/exampleCode/file1.c", FALSE)


hinc = getInclusions("src/clang.c", args = "-DHAVE_CONFIG_H",
                     includes = c("~/llvm-devel/tools/clang/include/", sprintf("%s/../src/include", R.home()), sprintf("%s/include", R.home())))


# Flat version
inc = getInclusions("src/clang.c", TRUE, args = "-DHAVE_CONFIG_H",
                     includes = c("~/llvm-devel/tools/clang/include/", sprintf("%s/../src/include", R.home()), sprintf("%s/include", R.home())))

w = names(inc) == ""
names(inc)[w] = inc[w]
edges = cbind(names(inc), inc)
library(igraph)
g = graph.edgelist(edges)
plot(g, vertex.size = .5, vertex.label.cex = .6, edge.arrow.size = .5)

