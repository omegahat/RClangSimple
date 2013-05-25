

readCppClass = 
function(cursor, visitor = genCppClassInfoCollector(cursor))
{
   visitTU(cursor, visitor$update)
   visitor$info()
}

genCppClassInfoCollector =
function(cursor, name = getName(cursor))
{
   fields = list()
   methods = list()

   superClasses = character() # list()
   accessLevel = ""

   curMethod = NULL
   
   update = function(cur, parent) {
     k = cur$kind
     if(k == CXCursor_CXXAccessSpecifier) {
#       accessLevel <<- getName(cur)
       accessLevel <<- getCursorTokens(cur)[1]
     } else if(k == CXCursor_FieldDecl) {
        id = getName(cur)
        fields[[id]] <<-  list(name = id, def = clone(cur), type = getType(cur), access = accessLevel)

     } else if(k == CXCursor_CXXMethod || k == CXCursor_Constructor) {
        id = getName(cur)
        if(!is.null(curMethod))
          methods[[curMethod$name]] <<- curMethod
        
        curMethod <<- list(def = clone(cur), access = accessLevel, name = id, params = list())       
     } else if(k == CXCursor_ParmDecl) {
         id = getName(cur)
         curMethod$params[[id ]] <<- clone(cur)
         methods[[curMethod$name]] <<- curMethod
     } else if(k == CXCursor_CXXBaseSpecifier)
        superClasses <<- c(superClasses, gsub("class ", "", getName(cur)))
     
     CXChildVisit_Recurse
   }

   list(update = update, info = function() list(name = name, superClasses = superClasses, fields = fields, methods = methods))
}


getCppClasses =
function(tu, visitor = genCppClassCursorCollector(), ...)
{
   if(is.character(tu))
     tu = createTU(tu, ...)

   visitTU(tu, visitor$update)
   visitor$nodes()
}

genCppClassCursorCollector =
function()
{
   nodes = list()
   update = function(cur, parent) {
     k = cur$kind
     if(k == CXCursor_ClassDecl) {
        n = length(nodes) + 1L
        nodes[[ n ]] <<- clone(cur)
        names(nodes)[n] <<- getName(cur)
     }

     CXChildVisit_Recurse
   }

   list(update = update, nodes = function() nodes)
}
