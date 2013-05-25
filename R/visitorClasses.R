CursorVisitor =
  setRefClass("CursorVisitor",
              fields = list(clone = "logical"),
               methods = list(
                  update = function(cur, parent) CXChildVisit_Recurse,
                  result = function() NULL
            ))


CallCollectorVisitor =
  setRefClass("CallCollectorVisitor",
              contains = "CursorVisitor",
              fields = list(calls = "character"),
               methods = list(
                  update = function(cur, parent) {
                    if(cur$kind == CXCursor_CallExpr)
                      calls <<- c(calls, getName(cur))
                  } ,
                  result = function() calls
            ))

