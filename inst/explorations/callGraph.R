#
# Determine what routines a routine calls
#
# Just use findCalls on the idividual routines

library(RCIndex)
f = sprintf("%s/../src/main/memory.c", R.home())
#tu = createTU(f, args = "-DHAVE_CONFIG_H", includes = c(sprintf("%s/../src/include", R.home()), sprintf("%s/include", R.home())))
r = getRoutines(f, TRUE, args = "-DHAVE_CONFIG_H", includes = c(sprintf("%s/../src/include", R.home()), sprintf("%s/include", R.home())))

kalls = lapply(r, findCalls)
withinFileCalls = lapply(kalls, intersect, names(r))

m = matrix(0, length(r), length(r), dimnames = list(names(r), names(r)))
invisible(sapply(names(withinFileCalls), 
           function(id) 
              m[id,  withinFileCalls[[id]]] <<- 1))

i = rowSums(m) == 0 & colSums(m) == 0
mm = m[!i, !i]

library(igraph)
g = graph.adjacency(mm, "directed")       
plot(g, vertex.size = 2, vertex.label.cex = .6, edge.arrow.size = .5)


pdf("Paper/callgraph.pdf", 10, 10)
par(oma = c(0,0,0,0))
plot(g, vertex.size = .9, vertex.label.cex = .8, edge.arrow.size = .5, vertex.color = "white")
dev.off()


#################################


tu = createTU("src/clang.c", includes = c("~/llvm-devel/tools/clang/include", sprintf("%s/include", R.home())))
r = getRoutines(tu)
i = sapply(r, function(x) getFileName(x$def)) == "src/clang.c"
rc = r[i]

calls = lapply(rc, function(x) findCalls(x$def))
