globalUseVisitor =
  #'@examples
  #  o = findGlobalUse("inst/exampleCode/globalUse.c")
  #
  #
  #
  #  tu = createTU("/Users/duncan/Projects/R-3.0-dev/src/main/envir.c",
  #                  includes = c("/Users/duncan/Projects/R-3.0-dev/build/include", "/Users/duncan/Projects/R-3.0-dev/src/include"))
  #  g = findGlobalUse(tu)
  #
  # returns an element for each function with any global variables
  #  with a count for the number of references to each global variable
  #  referenced in that function.
  #
function(varNames = character())
{
  ans = list()
  curFun = NULL
  curFunName = character()
  
  u = function(cur, parent) {
          if(cur$kind == CXCursor_FunctionDecl)  {
            curFun <<- cur
            curFunName <<- getName(cur)
          }
          
          if(cur$kind == CXCursor_DeclRefExpr) {
            r  = getCursorReferenced(cur)
            if(r$linkage == CXLinkage_External)  {
              if(length(curFunName)) {
                   # put the USR on the variable name too.
                 ans[[curFunName]] <<- c(ans[[curFunName]], getName(cur))
              }
            }
          }
          CXChildVisit_Recurse
        }
  
  list(update = u, usage = function() lapply(ans, table))
}


findGlobalUse =
function(tu, visitor = globalUseVisitor(), ...)
{
  if(is.character(tu))
     tu =  createTU(tu, ...)
  else
    tu = as(tu, "CXTranslationUnit")
  
  if(visitTU(tu, visitor$update) == 0)
      visitor$usage()
  else
    stop("problem with TU")
}

