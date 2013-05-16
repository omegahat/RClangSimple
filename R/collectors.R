genVariableCollector =
function()
{
  vars = list()

  update = function(cur, parent) {
     if(cur$kind != CXCursor_VarDecl)
        return(CXChildVisit_Continue)

     id = getName(cur)
     vars[[id]] <<- clone(cur)
     CXChildVisit_Continue
   }

  list(update = update, vars = function() vars)
}

checkFiles =
function(cur, files)
{
  fn = getFileName(cur)
  length(files) == 0 || fn %in% files ||
        grepl(sprintf("(%s)", paste(files[1], collapse = "|")), fn)
}

genFunctionCollector =
function(filenames = character())
{
  funcs = list()

  update = function(cur, parent) {
     if(cur$kind != CXCursor_FunctionDecl
          || !checkFiles(cur, filenames))
        return(CXChildVisit_Continue)


     id = getName(cur)
     ret = getResultType(cur$type)

     params = children(cur, CXCursor_ParmDecl)
     names(params) = sapply(params, getName)
     funcs[[id]] <<- structure(list(returnType = ret, params = params, def = clone(cur)), class = "FunctionDecl")

     CXChildVisit_Continue
  }

  list(update = update, funcs = function() funcs)
}

setAs("CXType", "character",
       function(from) {
          ty = getCanonicalType(from)
          if(getTypeKind(ty) == CXType_Pointer)
              return(sprintf("%s *", as(getPointeeType(ty), "character")))

          decl = getTypeDecl(ty)
          if(decl$kind == CXCursor_NoDeclFound || getTypeKind(decl) == CXType_Invalid)
            names(getTypeKind(ty))
          else
            getName(decl)
       })

setMethod("show", "FunctionDecl",
          function(object) {
             show(sprintf("%s %s(%s)", as(object$returnType, "character"),
                                  getName(object$def),
                                  paste(sapply(object$params,
                                                function(x)
                                                    sprintf("%s %s", as(x$type, "character"), getName(x))),
                                           collapse = ", ")))
          })


print.FunctionDecl =
function(x, ...)
    show(x)

genEnumCollector =
function()
{
  vars = list()

  update = function(cur, parent) {
     if(cur$kind != CXCursor_EnumDecl)
        return(1L)

     id = getName(cur)

     vars[[id]] <<- sapply(children(cur), getName)
     1L
  }

  list(update = update, enums = function() vars)
}


getEnums =
function(src)
{
  e = genEnumCollector()
  visitTU(as(src, "CXTranslationUnit"), e$update)
  e$enums()
}


genEnumCollector =
function() {
  enums = list()
  curDef = integer()
  type = NULL
  curName = NA

  flush = 
    function() {
       if(length(curDef)) {
          if(is.na(curName) || curName == "")
            curName = length(enums) + 1
          enums[[curName]] <<- new("EnumerationDefinition", values = curDef, type = type, name = curName)
       }
       curDef <<- integer()
       curName <<- NA
       type <<- NULL
    }

  doStop = FALSE
  
  update = 
   function(cur, parent)  {
     kind = getCursorKind(cur)

     if(kind == CXCursor_EnumDecl) {
        flush()
        curName <<- getName(cur) # get the name for the enum.
        type <<- getType(cur)
        if(is.na(curName) || curName == "")
            curName <<- getName(type)
     } else if(kind == CXCursor_EnumConstantDecl) {
       curDef[getName( cur ) ] <<- length(curDef) #XX
     } else if(doStop) {

#cat(names(cur$kind), getName(cur), "\n")
#if(cur$kind == CXCursor_FirstExpr) print(getTypeKind(cur$type))
#  doStop <<- FALSE
#            browser()
     }

     2L
  }
  
  list(update = update, enums = function() { flush(); enums})
}



genTypeCollector =
  # reconcile with data structure collector
  # the recursive approach
function(targetFile = character())
{
   defs = list()
   curDef = list()
   curName = NA
   inDef = FALSE

   addField = function(cur) {
      if(inDef) {
         id = getName(cur)
         curDef[[id]] <<- clone(cur$type)
      }
   }
   end <- function() {
      defs[[curName]] <<- curDef
       curName <<- NA
       curDef <<- list()
   }
     
   
   update = function(cur, parent) {
      r = 1L
      k = getCursorKind(cur)

      if(k == CXCursor_FieldDecl) {
         addField(cur)
      } else if(k == CXCursor_TypedefDecl) {
         r = 2L
         inDef <<- FALSE         
      } else if(k == CXCursor_StructDecl) {
          # XXX watch for nested definitions.

         if(length(targetFile) == 0 ||( getFileName(cur) %in% targetFile)) {
        
             inDef <<- TRUE
             r = 2L
             id = getName(cur)
             curName <<- id
          }
      } else
         inDef <<- FALSE

      if(!inDef && length(curDef))
         end()

      r
    }
   
   list(update = update, defs = function() defs)
}




genCallCollector =
  #
  # Collect the names of the routines involved in calls in the code.
  # This does not collect function pointers, similar to the f in lapply(x, f).
  #
function()
{
    calls = character()
    list(update = function(cur, parent) {
                    if(cur$kind == CXCursor_CallExpr)
                      calls <<- c(calls, getName(cur))
                  },
         calls = function() calls,
         reset = function() calls <<- characters()
       )
}


findCalls =
  # vectorize
 # findCalls("../src/manual.c",  includes = c("/usr/local/cuda/include", sprintf("%s/../src/include", R.home()), sprintf("%s/include", R.home())))
function(file, fun = genCallCollector(), ...)
{
  parseTU(file, fun$update, ...)
  fun$calls()
}



genTypeCollector =
function()
{
  defs = list()

  update = function(cur, parent) {
      k = cur$kind
      if(k == CXCursor_StructDecl) {
        id = getName(cur)
        defs[[id]] <<- getStructDef(cur$type, children(cur))
      }

    1L
  }

  list(update = update, defs = function() defs)
}


genDataStructCollector =
function(leaveAsCursor = FALSE)
{
   dataStructs = list()

   update = function(cur, parent) {

     k = cur$kind
     if(k %in% c(CXCursor_UnionDecl, CXCursor_StructDecl, CXCursor_EnumDecl, CXCursor_TypedefDecl)) {
         i = length(dataStructs) + 1L
         cur = clone(cur)
         dataStructs[[i]] <<- cur
         names(dataStructs)[i] <<- getName(cur)
     }

     TRUE
   }

   results = function(asCursor = leaveAsCursor) {
               if(asCursor)
                 dataStructs
               else
                 lapply(dataStructs, getStructDef) #XXX need to be more general and convert, e.g., enums to enumeration descriptions
             }
   
   new("Collector", update = update, results = results)
}

asCollectorFunction =
function(x)
{
  if(is.function(x))
    x
  else if(is(x, "Collector"))
    x@update
  else if(is.list(x) && "update" %in% names(x) && is.function(x$update))
    x$update
  else
     as(x, "function")
}

combineCollectors =
  #
  # Make the result a Collector that combines the result functions as well.
  #
function(..., .funs = list())
{

   .funs = lapply(.funs, asCollectorFunction) # make more general
  
   function(cur, parent)
      lapply(.funs, function(f) f(cur, parent))
}


getDefines =
  #' @example  defs = getDefines("inst/exampleCode/defines.c")
function(tu, names, col = genDefinesCollector(names))
{
   if(is.character(tu))
     tu = createTU(tu)

   visitTU(tu, col$update, clone = FALSE)
   col$defines()
}

genDefinesCollector =
function(names = character())
{
   ans = list()
   update = function(cur, parent) {
     if(cur$kind == CXCursor_MacroDefinition) {  # or MacroDefinition or Expansion ?
       ans[[ getName(cur) ]] <<- clone(cur)
     }

     CXChildVisit_Continue
   }

   
   list(update = update, defines = function() ans)
}
