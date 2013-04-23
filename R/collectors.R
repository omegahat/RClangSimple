genVariableCollector =
function()
{
  vars = list()

  update = function(cur, parent) {
     if(cur$kind != CXCursor_VarDecl)
        return(1L)

     id = getName(cur)
     vars[[id]] <<- clone(cur)
     1L
  }

  list(update = update, vars = function() vars)
}

genFunctionCollector =
function()
{
  funcs = list()

  update = function(cur, parent) {
     if(cur$kind != CXCursor_FunctionDecl)
        return(1L)

     id = getName(cur)
     ret = getResultType(cur$type)

     params = children(cur, CXCursor_ParmDecl)
     names(params) = sapply(params, getName)
     funcs[[id]] <<- structure(list(returnType = ret, params = params, def = clone(cur)), class = "FunctionDecl")
     1L
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




genEnumCollector =
function() {
  enums = list()
  curDef = integer()
  curName = NA

  reset = 
    function() {
       if(length(curDef)) {
          if(is.na(curName))
            curName = length(enums) + 1
          enums[[curName]] <<- curDef
       }
       curDef <<- integer()
       curName <<- NA
    }

doStop = FALSE
  update = 
   function(cur, parent)  {
     kind = cur$kind

     if(kind == CXCursor_EnumDecl) {
        reset()
        curName <<- getName(cur) # get the name for the enum.
     } else if(kind == CXCursor_EnumConstantDecl) {
#if(getName(cur) == "BLUE") doStop <<- TRUE
       curDef[getName( cur ) ] <<- length(curDef) #XX
     } else if(doStop) {

#cat(names(cur$kind), getName(cur), "\n")
#if(cur$kind == CXCursor_FirstExpr) print(getTypeKind(cur$type))
#  doStop <<- FALSE
#            browser()
     }

     2L
  }
  
  list(update = update, enums = function() { reset(); enums})
}



genTypeCollector =
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
      k = cur$kind

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
p      
      return(r)
    }
   
   list(update = update, defs = function() defs)
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


