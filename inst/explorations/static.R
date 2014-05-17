library(RCIndex)

f = system.file("exampleCode", "static.c", package = "RCIndex")
if(!file.exists(f))
  f = "../exampleCode/static.c"

tu = createTU(f)
r = getRoutines(tu)

cur = as(tu, 'CXCursor')
final = cur[[length(cur)]]
getCursorLinkage(final)

# What about the static variable ctr in the routine foo.

var = r$foo@def[[1]][[1]][[1]]
getCursorLinkage(var)  # NoLinkage.  This seems odd.

getCursorTokens(var)[1] == "static"


#############

# Visit all the  cursors.

visitTU(r$foo,
        function(cur, parent) {
          print(names(getCursorLinkage(cur)))
           if(cur$kind == CXCursor_VarDecl) {
#browser()             
             link = getCursorLinkage(cur)
             if(link == CXLinkage_Internal)
               cat("static variable", getName(cur), "\n")
             else
               print(getName(cur))
           }
           CXChildVisit_Recurse
        })
