# Reference classes.

# Think of better names to differentiate S4 and reference classes.
setClass("S4Visitor", representation(update = "function", result = "function"))


CursorVisitor =
  setRefClass("RefVisitor",
              fields = list(clone = "logical"),
               methods = list(
                  update = function(cur, parent) CXChildVisit_Recurse,
                  result = function() NULL
            ))


CallCollectorVisitor =
  setRefClass("CallCollectorVisitor",
              contains = "RefVisitor",
              fields = list(calls = "character"),
               methods = list(
                  update = function(cur, parent) {
                    if(cur$kind == CXCursor_CallExpr)
                      calls <<- c(calls, getName(cur))
                  } ,
                  result = function() calls
            ))

