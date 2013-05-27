library(RCIndex)

tu = createTU(system.file("exampleCode", "comments.c", package = 'RCIndex'),
              args = "-fparse-all-comments",
              options = c("SkipFunctionBodies", "DetailedPreprocessingRecord"))

# Won't see the comments in the cursors.
#visitTU(tu, simpleVisitor)


#visitTU(tu, function(cur, ...) {txt = getRawCommentText(cur); if(txt != "") print(txt); CXChildVisit_Recurse})
genCommentCollector =
function()
{
  comments = character()
  cursors  = list()
  update = function(cur, parent) {
     txt = getRawCommentText(cur)
     if(txt != "") {
       comments <<- c(comments, txt)
       cursors <<- c(cursors, cur)
     }
     CXChildVisit_Recurse
  }
  list(update = update, result = function() list(comments = comments, cursors = cursors))
}
col = genCommentCollector()
visitTU(tu, col$update, clone = TRUE)

r = getRoutines(tu)
sapply(r, function(x) getRawCommentText(x@def))

vars = getVariables(tu)
sapply(vars, getRawCommentText)
