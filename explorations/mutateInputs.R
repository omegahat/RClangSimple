library(RCIndex)

tu = createTU("inst/exampleCode/mutateArg.c")
r = getRoutines(tu)

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


genMutatesCollector =
function(paramNames)  
{
    inAssignment = FALSE
    modifiedVars = character()
    update =
      function(cur, parent)  {
        k = cur$kind
        if(k == CXCursor_BinaryOperator && "=" %in% (toks <- getCursorTokens(cur)) ) {
          lhs = getChildren(cur)[[1]]
          # could use the tokens
          subtoks = toks[seq(1, which(toks == "=")[1])]
          if("Identifier" %in% names(subtoks) && subtoks["Identifier"] %in% paramNames)
             modifiedVars <<- c(modifiedVars, subtoks["Identifier"])
        } #else if(inAssignment && k == CXCursor_ArraySubscriptExpr) {
         # toks <- getCursorTokens(cur)
        #}

        CXChildVisit_Recurse
      }

    list(update = update, vars = function() modifiedVars)
}
