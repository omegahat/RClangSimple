library(RCIndex)

if(FALSE) {
tu = createTU("inst/exampleCode/mutateArg.c")
r = getRoutines(tu, getFileName(tu))

v = genMutatesCollector(names(r$foo@params))
visitCursor(r$foo, v$update)
}
run = function(id) {
  v = genMutatesCollector(names(r[[id]]@params))
  visitCursor(r[[id]], v$update)
  v$vars()
}


genMutatesCollector =
function(paramNames)  
{
    inAssignment = FALSE
    modifiedVars = character()
    
    update =
      function(cur, parent)  {
        k = cur$kind
        if(k == CXCursor_BinaryOperator && "=" %in% (toks <- getCursorTokens(cur)) ) {
          lhs = cur[[1]]
processLHS(lhs)
          # could use the tokens
#          subtoks = toks[seq(1, which(toks == "=")[1])]
#          if("Identifier" %in% names(subtoks) && subtoks["Identifier"] %in% paramNames)
#             modifiedVars <<- c(modifiedVars, subtoks["Identifier"])
        } #else if(inAssignment && k == CXCursor_ArraySubscriptExpr) {
         # toks <- getCursorTokens(cur)
        #}

        CXChildVisit_Recurse
      }

    processLHS = function(cur) {
      k = cur$kind
browser()      
      id = if(k == CXCursor_ArraySubscriptExpr) {
         getName(cur[[1]])
      } else if(k == CXCursor_UnaryOperator){
        if(cur[[1]]$kind == CXCursor_ParenExpr)
          processLHS(cur[[1]][[1]])
        else if(cur[[1]]$kind == CXCursor_DeclRefExpr)
           getName(cur[[1]])
      } else if(k == CXCursor_FirstExpr || k == CXCursor_DeclRefExpr) {
          getName(cur)
      } else if(k == CXCursor_BinaryOperator) {
          return(sapply(children(cur), processLHS))
      }

      if(!is.null(id) && id %in% paramNames)
          modifiedVars <<- c(modifiedVars, id)
    }

    list(update = update, vars = function() unique(unlist(modifiedVars)))
  }






genParamsCollector =
function(namesOnly = FALSE)
{
   params = if(namesOnly) character() else list()
   update = function(cur, kind) {
      k = cur$kind
      if(k == CXCursor_ParmDecl) {
        n = length(params) + 1
        if(namesOnly)
          params <<- c(params, getName(cur))
        else {
          params[[ n ]] <<- cur
          names(params)[n] <<- getName(cur)
        }
      }

      CXChildVisit_Recurse
   }

   list(update = update, params = function() params)
}

getParameters =
function(r, visitor = genParamsCollector(namesOnly), namesOnly = FALSE)
{
   visitTU(r, visitor$update, clone = !namesOnly)
   visitor$params()
}
