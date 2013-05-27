library(RCIndex)
genVisitor = 
function()
{  
    inBar = FALSE
    
    update =
      function(cur, parent) {
        if(cur$kind == CXCursor_FunctionDecl) {
          if(inBar) {
            cat("quitting having reached the routine", getName(cur), "\n") 
            return(CXChildVisit_Break)
          }
          
          if(getName(cur) == "bar") {
            inBar <<- TRUE
            return(CXChildVisit_Recurse)
          } else
            return(CXChildVisit_Continue)
        } else {
             # processing the cursors within the bar routine.
          print(cur$kind)
          return(CXChildVisit_Recurse)
        }
      }
}
if(FALSE) {
 visitTU("../inst/exampleCode/mutateArg.c",  genVisitor())
}
