# like igraph.R but generating for latex
# Lots of latex packages to choose from, but we'll use tikz
#
#\begin{tikzpicture}
#    \tikzstyle{every node}=[circle,draw]
#    \node {1}
#       child { node {2} }
#       child {
#              node {3}
#              child { node {4} }
#              child { node {5} }
#             }
#       child { node {6} }
#    ;
#\end{tikzpicture}
#
#
# We'll do this directly in R via children rather than vistiTU

makeTikzGraph =
function(cur, genLabel = makeCursorLabel, level = 0, indent = paste(rep(" ", level + 1), collapse = ""))
{
  cur = as(cur, "CXCursor")
  txt = sprintf("%s%snode {%s}", indent, if(level == 0) "\\" else "", genLabel(cur))

  kids = children(cur)
#  if(length(kids))
#    txt = c(txt, paste0(indent, "child {"))
  for(k in kids) {
     txt = c(txt, paste0(indent, "child {"))
     txt = c(txt, makeTikzGraph(k, genLabel, level + 1, paste(rep(indent, 2), collapse = "")))
     txt = c(txt, paste0(indent, "}"))     
  }
#  if(length(kids))
#    txt = c(txt, paste0(indent, "}"))
  
  txt
}
