# Reference classes.

# Think of better names to differentiate S4 and reference classes.
setClass("S4CursorVisitor", representation(update = "function", result = "function"))


CursorVisitor =
  setRefClass("RefCursorVisitor",
              fields = list(clone = "logical"),
               methods = list(
                  update = function(cur, parent) CXChildVisit_Recurse,
                  result = function() NULL
            ))


CallCollectorVisitor =
  setRefClass("CallCollectorVisitor",
              contains = "RefCursorVisitor",
              fields = list(calls = "character"),
               methods = list(
                  update = function(cur, parent) {
                    if(cur$kind == CXCursor_CallExpr)
                      calls <<- c(calls, getName(cur))
                  } ,
                  result = function() calls
            ))

