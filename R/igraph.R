# make a graph from the AST
#
# There are various ways to do this and since I am not yet familiar enough 
# with the igraph package to know which approach is best, we'll just do 
# it quickly and revisit.
#
# We can use and edgelist or adjacency approach
# graph.edgelist or graph.adjlist
# edgelist is a 2 column matrix with rows giving an edge
# adjlist is a list with an element for each vertex and that element being a numeric vector
#  giving the indices  of the vertices to which this vertex has an edge.
#

igraphEdgeCollector =
  #
  # Using the R_getPointerAddress  doesn't work. It clones the cur and parent and so we get a new parent instance each time.
  #
  #
function(labelGen = makeCursorLabel)
{
  edges = character()
  labels = character()

  update = function(cur, parent) {
    
#    a = .Call("R_getPointerAddress", cur)
#    b = .Call("R_getPointerAddress", parent)

    a = makeUniqueID(cur)
    b = makeUniqueID(parent)    

    if(length(labels) == 0)
       labels[b] <<- labelGen(parent)
    
    labels[a] <<- labelGen(cur)    
    edges <<- c(edges, b, a)
    CXChildVisit_Recurse
  }

  getEdges = function() {
#    browser()
               matrix(edges, , 2, byrow = TRUE)
             }
  list(update = update, edges = getEdges)
}

makeEdgeList =
function(cur, col = igraphEdgeCollector())
{
  visitCursor(cur, col$update, clone = TRUE)
  col$edges()
#  graph.edgelist(col$edges())
}
