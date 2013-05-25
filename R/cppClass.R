
readCppClass = 
function(cursor, visitor = genCppClassInfoCollector(cursor))
{
   visitTU(cursor, visitor$update)
   ans = visitor$info()

   ans
}

genCppClassInfoCollector =
  #
  #  This starts at the class cursor and descends from there (rather than from the root of the TU)
  #
  #
function(cursor, name = getName(cursor), rclassName = NA)
{
   fields = list()
   methods = list()

   superClasses = list() # character() # list()
   accessLevel = ""

   curMethod = NULL
   templateParams = list()
        
   update = function(cur, parent) {
     k = cur$kind
     if(k == CXCursor_CXXAccessSpecifier) {
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
     } else if(k == CXCursor_CXXBaseSpecifier) {
        name = gsub("class ", "", getName(cur))
        superClasses[[name]] <<- cur
     } else if(k == CXCursor_TemplateTypeParameter)
       templateParams[[ getName(cur) ]] <<- templateParams
     
     CXChildVisit_Recurse
   }

   list(update = update,
        info = function() {
                 if(is.na(rclassName))
                   rclassName = if(length(templateParams)) "TemplateC++Class" else "C++Class"
                 
                 ans = new(rclassName, name = name, superClasses = superClasses, fields = fields, methods = methods, def = cursor)
                 
                 if(length(templateParams))
                   ans@templateParams = templateParams
                 ans
               })
}


getCppClasses =
function(tu, nodesOnly = FALSE, visitor = genCppClassCursorCollector(), ...)
{
   if(is.character(tu))
     tu = createTU(tu, ...)

   visitTU(tu, visitor$update)
   ans = visitor$nodes()
   if(nodesOnly)
     ans
   else
     lapply(ans, readCppClass)
}

genCppClassCursorCollector =
function()
{
   nodes = list()
   update = function(cur, parent) {
     k = cur$kind
     if(k == CXCursor_ClassDecl || k == CXCursor_ClassTemplate) {
        n = length(nodes) + 1L
        nodes[[ n ]] <<- clone(cur)
        names(nodes)[n] <<- getName(cur)
     }

     CXChildVisit_Recurse
   }

   list(update = update, nodes = function() nodes)
}
