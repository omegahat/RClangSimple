makeDecl =
function(param)
{
  paste(getName(getType(param)),  getName(param))
}

getType =
function(x)
  x$type

#setMethod("show", "FunctionDecl",
print.FunctionDecl <- function(x, ...) {
               #
             object = x
             parms = sapply(object@params, makeDecl)
             print(sprintf("%s %s (%s)",
                       getName(object@returnType),
                       getName(object@def),
                       paste(parms, collapse = ", ")), ...)
           }
