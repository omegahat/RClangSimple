
makeCallGraph =
  #
  # g = makeCallGraph("inst/exampleCode/fib.c")w
  # f = sprintf("%s/src/main/memory.c", R.home())
  # g = makeCallGraph(f, args = "-DHAVE_CONFIG_H", includes = c(sprintf("%s/src/include", R.home()), sprintf("%s/include", R.home())))
  #
  # g = makeCallGraph("src/clang.c", includes = c("~/llvm-devel/tools/clang/include", c(sprintf("%s/../src/include", R.home()), sprintf("%s/include", R.home()))))
  #
function(tu, withinFile = TRUE, .plot = TRUE, ...)
{
  if(is.character(tu))
   tu = createTU(tu, ...)

  r = getRoutines(tu)

  kalls = lapply(r, findCalls)
  withinFileCalls = if(withinFile)
                      lapply(kalls, intersect, names(r))
                    else
                      kalls
  
  m = matrix(0, length(r), length(r), dimnames = list(names(r), names(r)))  
  sapply(names(withinFileCalls), 
                   function(id) 
                    m[id,  withinFileCalls[[id]]] <<- 1)
  
  i = rowSums(m) == 0 & colSums(m) == 0
  mm = m[!i, !i]
  if(.plot && requireNamespace("igraph", quietly = TRUE))
     igraph::graph.adjacency(mm, "directed")
  else
     mm
}
