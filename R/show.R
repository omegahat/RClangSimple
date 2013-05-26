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
               #
             object = x
             parms = sapply(object@params, makeDecl)
             print(sprintf("%s %s (%s)",
                       getName(object@returnType),
                       getName(object@def),
                       paste(parms, collapse = ", ")), ...)
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



