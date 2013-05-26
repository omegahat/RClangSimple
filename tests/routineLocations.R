library(RCIndex)

genRoutineLocations = 
function() 
{
   locations = integer()

    visitor = function(cur, parent) {
       if(cur$kind == CXCursor_FunctionDecl) 
         locations[[ getName(cur) ]] <<- getLocation(cur)$location["line"]

        CXChildVisit_Continue
    }

    list(visitor = visitor, locations = function() locations)
}

f = system.file("exampleCode", "fib.c", package = "RCIndex")
col = genRoutineLocations()
visitTU(f, col$visitor)
col$locations()


RoutineLocationVisitor =
setRefClass("RoutineLocationVisitor",
            fields = list(locations = "numeric"),
            methods = list(getLocations = function() locations,
                           visitor = function(cur, parent) {
                             if(cur$kind == CXCursor_FunctionDecl) 
                                locations[[ getName(cur) ]] <<- getLocation(cur)$location["line"]
                             
                             CXChildVisit_Continue
                           }))
col = RoutineLocationVisitor()
visitTU(f, col$visitor)
col$getLocations()
