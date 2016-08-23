
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
function(cursor, className = getName(cursor), rclassName = NA, conversionFunctions = TRUE)
{
   fields = list()
   methods = list()

   superClasses = list() # character() # list()
   accessLevel = ""

   curMethod = NULL
   templateParams = list()

   topCursor = cursor  # in case we need it, e.g., to get the namespace.
        
   update = function(cur, parent) {
     k = cur$kind
     if(k == CXCursor_CXXAccessSpecifier) {
           # private, protected, public
       accessLevel <<- getCursorTokens(cur)[1]
     } else if(k == CXCursor_FieldDecl) {
           # a field for the class
        id = getName(cur)
        fields[[id]] <<-  list(name = id, def = cur, type = getType(cur), access = accessLevel)

     } else if(k == CXCursor_CXXMethod || k == CXCursor_Constructor || k == CXCursor_FunctionTemplate || (k == CXCursor_ConversionFunction && conversionFunctions)) {
           # method or constructor in the class definition.
        id = getName(cur)
        if(!is.null(curMethod))
          methods[[curMethod@name]] <<- curMethod
        
#        curMethod <<- list(def = cur, access = accessLevel, name = id, params = list())
         classMap = c("C++ClassMethod" = CXCursor_CXXMethod, "C++ClassConstructor" = CXCursor_Constructor, "C++ClassTemplateMethod" = CXCursor_FunctionTemplate,
                     "C++ConversionFunction" = CXCursor_ConversionFunction)
         i = match(k, classMap)
         if(is.na(i))
            stop("Problem here")
         RclassName = names(classMap)[i]
         curMethod <<- new(RclassName, def = cur, name = id, params = list(), returnType = getType(cur), className = className)   #XXX add this back access = accessLevel
         curMethod@classType <<- getType(topCursor)
         curMethod@classDef <<- topCursor
     } else if(k == CXCursor_ParmDecl) {

         id = getName(cur)
         if(length(curMethod)) {
         #         curMethod$params[[ id ]] <<- cur
             n = length(curMethod@params) + 1
             curMethod@params[[ n ]] <<- cur
             names(curMethod@params)[n] <<- id
             methods[[curMethod@name]] <<- curMethod
         } else {
             warning("ParmDecl without a current method. Part of a typedef for a function pointer type? " , names(parent$kind))
         }
     } else if(k == CXCursor_CXXBaseSpecifier) {
        name = gsub("class ", "", getName(cur))
        superClasses[[name]] <<- cur
     } else if(k == CXCursor_TemplateTypeParameter)
       templateParams[[ getName(cur) ]] <<- templateParams
     else if(k == CXCursor_TypedefDecl) {
      #XXX implement this.
     } else if(k == CXCursor_ClassDecl) {
          warning("Skipping (nested) ClassDecl for ", getName(cur), " in ", getName(parent))
     } else if(k == CXCursor_DeclStmt) {
          #cat("DeclStmt", names(k), names(parent$kind), "\n")
     } else if(k %in% c(CXCursor_MemberRef, CXCursor_VarDecl)) {
       #  browser()
     } else {
      # pos = getLocation(parent)         
      # cat("unhandled cursor kind", names(k), " @ ", pos$file, pos$location["line"], "\n")
     }
     
     CXChildVisit_Recurse
   }

   list(update = update,
        info = function() {
                 if(is.na(rclassName))
                    rclassName = if(length(templateParams)) "TemplateC++Class" else "C++Class"
                 
                 ans = new(rclassName, name = className, superClasses = superClasses, fields = fields, methods = methods, def = cursor)
                 
                 if(length(templateParams))
                   ans@templateParams = templateParams
                 ans
               })
}


# Old. This is the R version.
getCppClasses =
function(tu, nodesOnly = FALSE, visitor = genCppClassCursorCollector(), ...)
{
   if(is.character(tu))
     tu = createTU(tu, ...)

   visitTU(tu, visitor$update, clone = !missing(visitor))
   ans = visitor$nodes()
   if(nodesOnly)
     ans
   else
     lapply(ans, readCppClass)
}

getCppClasses =
function(tu, fileFilter = character(), nodesOnly = FALSE, numClasses = 100, visitor = genCppClassCursorCollector(), ...)  # 
{
   if(is.character(tu))
      tu = createTU(tu, ...)
  
  ans = .Call("R_getCppClasses", as(tu, "CXCursor"), vector("list", numClasses), character(numClasses))
   
  if(length(fileFilter))
     ans = ans[ filterByFilenames(ans, fileFilter) ]

  ans = ans[ sapply(ans, function(x) length(children(x))) > 0 ]
   
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
     } else if(k == CXCursor_Namespace)
        return(CXChildVisit_Recurse)

     CXChildVisit_Recurse       
     
   }

   list(update = update, nodes = function() nodes)
}
