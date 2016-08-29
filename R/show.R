makeDecl =
function(param)
{
  paste(getName(getType(param)),  getName(param))
}

getType =
function(x)
  x$type

#setMethod("show", "FunctionDecl",
print.FunctionDecl <- function(x, ...)
{
    print(as(x, "character"), ...)
}


setMethod("show", "FunctionDecl",
          function(object) {
           return(print.FunctionDecl(object))
             show(sprintf("%s %s(%s)", as(object@returnType, "character"),
                                  getName(object@def),
                                  paste(sapply(object@params,
                                                function(x)
                                                    sprintf("%s %s", as(x$type, "character"), getName(x))),
                                           collapse = ", ")))
          })



# See below.
if(FALSE) {
setAs("FunctionDecl", "character",
      function(from) {
          parms = sapply(from@params, makeDecl)
          sprintf("%s %s (%s)",
                  getName(from@returnType),
                  getName(from@def),
                  paste(parms, collapse = ", "))
      })

setAs("FunctionDecl", "character",
      function(from) {
          toks = getCursorTokens(from@def)
          if(toks[[length(toks)]] == ";")
              toks = toks[ - length(toks)]

          paste(toks, collapse = " ")
      })
}

setAs("FunctionDecl", "character",
      function(from) {
          p = sapply(from@params, function(x) paste(getCursorTokens(x), collapse = " "))
          rt = paste(getName(from@returnType), collapse = " ")
          p = paste(p, collapse = " ")
          sprintf("%s %s(%s%s", rt, from@name, p, if(!grepl("\\) *$", p)) ")" else "")   # Note the final ) may come from the last param.
      })
