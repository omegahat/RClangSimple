# like igraph.R but generating for latex
# Lots of latex packages to choose from, but we'll use tikz
#
# http://tex.stackexchange.com/questions/35526/tikz-tree-sibling-distance
#
#
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
#
# slr = getRoutines("inst/exampleCode/sinLog.c")
# cat(makeTikzGraph(slr$fun), sep = "\n", file = "mytree.tex")
# cat(makeTikzGraph(slr$fun@def, options = c("font=\\tiny", "level distance=1.25cm"),  siblingDistance = structure(c(6, 7, 7, 4, 3), names = c("", 4:7))), sep = "\n", file = "mytree.tex")

makeTikzGraph =
function(cur, genLabel = makeCursorLabel, options = NULL, siblingDistance = integer(), unit = "cm")
{
  if(length(siblingDistance)) {
     if(length(names(siblingDistance)) == 0)
        names(siblingDistance) = seq(along = siblingDistance) - 1L # subtract 1 or not - root node is level 0

     i = names(siblingDistance) != ""
       # put a space before the numbers. This allows the empty name to be 'level/' not 'level /'
     names(siblingDistance)[i] = sprintf(" %s", names(siblingDistance)[i])
     options = c(options,
                 sprintf(" level%s/.style={sibling distance=%d%s}",
                         names(siblingDistance),
                         as.integer(siblingDistance),
                         unit))

       
       options = paste0(options,  c(rep(",", length(options)-1), ""))
   }

   if(length(options)) {
     options = c("[", options, "]")
   }
  
  c("\\begin{tikzpicture}",
    options,
    makeTikzGraphNodes(as(cur, "CXCursor"), genLabel),
    ";",
    "\\end{tikzpicture}")
}

makeTikzGraphNodes =
function(cur, genLabel = makeCursorLabel, level = 0, indent = paste(rep(" ", level + 1), collapse = ""))
{
  if(level == 0)
     cur = as(cur, "CXCursor")
  
  txt = sprintf("%s%snode {%s}", indent, if(level == 0) "\\" else "", genLabel(cur))

  kids = children(cur)
  for(k in kids) {
     txt = c(txt,
             paste0(indent, "child {"),
             makeTikzGraphNodes(k, genLabel, level + 1),
             paste0(indent, "}"))
  }
  
  txt
}



makeUniqueID =
function(cur)
{
  toks = getCursorTokens(cur)
   #  "\\\\{"
  sprintf("\\Verb!%s!", gsub("\\{", "", paste(toks[-length(toks)], collapse = " ")))
#  sprintf("\\Verb!%s!", paste(toks[-length(toks)], collapse = " ")) 
}

makeCursorLabel =
function(cur)
   gsub("CXCursor_", "", names(cur$kind))

makeCombinedCursorLabel =
function(cur)
{
  sprintf("%s\\\\ %s", makeUniqueID(cur), makeCursorLabel(cur))
}
