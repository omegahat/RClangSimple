# This illustrates and tests visitTU() with an S4 and a Ref visitor class.

library(RCIndex)
f = system.file("exampleCode", "enums.c", package = "RCIndex")
e = getEnums(f)

col = genEnumCollector()
v = new("S4Visitor", update = col$update, result = col$enums)

e1 = visitTU(f, v)

stopifnot(names(e) == names(e1))

# The following 
enumClassVisitor =
  setRefClass("EnumCollectorVisitor", contains = "RefCursorVisitor",
              fields = list(enums = "list"),
              methods = list(
                  update = function(cur, parent) {
                     k = cur$kind
                     if(k == CXCursor_EnumDecl) {
                          # This is not the correct way to gather the information. It is just a simple example.
                          # See genEnumCollector() in the package.
                       id = getName(cur)
                       enums[[id]] <<- sapply(children(cur), getName)
                     }

                     CXChildVisit_Continue  # not Recurse
                  },
                  result = function() enums
                ))
v2 = enumClassVisitor$new()
e2 = visitTU(f, v2)
stopifnot(names(e) == names(e2))
