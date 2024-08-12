findAssignTo =
function(cur, var = character(), collector = genDeclAssignCollector())
{
    visitCursor(cur, collector$update)
    ans = collector$variables()
    if(length(var) > 0)  
        ans = ans[ names(ans) %in% var ]


    ans
}


genDeclAssignCollector =
function(clone = TRUE, recurse = TRUE)
{
    variables = list()
    ret = CXChildVisit_Recurse

    # similar to genVariableCollector() but a) adds the var = value from Binary Operator
    # and b) recursively descends, not continue. (That's changed for genVariableCollector 
    update = function(cur, parent) {
        k = cur$kind
        id = NA
        if(k == CXCursor_VarDecl) {
            id = getName(cur)
        } else if(k == CXCursor_BinaryOperator
                  && length(toks <- getCursorTokens(cur)) > 1 && toks[[2]] == "=") {
            id = getName(cur[[1]])
        }

        if(!is.na(id)) {
          n = length(variables) + 1
          variables[[ n ]] <<- if(clone) clone(cur) else cur
          names(variables)[n] <<- id
        }

        ret
    }

    list(update = update, variables = function() variables)
}
