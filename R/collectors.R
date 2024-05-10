genCollectNodes =
    # Simple collector that just collects the nodes in a list
    # cloning them of course.
function() {
    ans = list()
    list(update = function(cur, ...) ans <<- c(ans, cur),
         value = function() ans)
}

# Method to turn 
setAs("CXCursor", 'list',
      function(from) {
          col = genCollectNodes()
          visitTU(from,  col$update)
          col$value()
      })





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
function(makeRoutine = FALSE, clone = TRUE) # filenames = character())
{
  funcs = list()

  update = function(cur, parent) {
     if(cur$kind != CXCursor_FunctionDecl) #       || !checkFiles(cur, filenames))
        return(CXChildVisit_Continue)

     id = getName(cur)
     funcs[[id]] <<- if(makeRoutine)
                        makeRoutineObject(cur, id) 
                     else if(clone)
                         clone(cur)
                     else
                         cur
     
     CXChildVisit_Continue
  }

  list(update = update, funcs = function() funcs)
}

makeRoutineObject =
function(cur, id = getName(cur))
{
     ret = getResultType(cur$type)

     params = children(cur, CXCursor_ParmDecl)
     names(params) = sapply(params, getName)
#     structure(list(returnType = ret, params = params, def = clone(cur)), class = "FunctionDecl")
     new("FunctionDecl", name = id, def = clone(cur), returnType = ret, params = params)
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
         reset = function() calls <<- character()
       )
}


findCalls =
  # vectorize
 # findCalls("../src/manual.c",  includes = c("/usr/local/cuda/include", sprintf("%s/../src/include", R.home()), sprintf("%s/include", R.home())))
function(file, fileFilter = character(), n = 10000, ...)
{
  if(is.character(file))
     file = createTU(file, ...)
  
  ans = .Call("R_getCalls", as(file, "CXCursor"), vector("list", n))  # character(n))

  if(length(fileFilter))
     ans[ filterByFilenames(ans, fileFilter) ]
  else
     ans      
}


if(FALSE) {
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


}



genDataStructCollector =
function(leaveAsCursor = FALSE)
{
   dataStructs = list()

   update = function(cur, parent) {

     k = cur$kind
     if(k %in% c(CXCursor_UnionDecl, CXCursor_StructDecl, CXCursor_TypedefDecl)) {   # , CXCursor_EnumDecl, CXCursor_TypedefDecl
         i = length(dataStructs) + 1L
         cur = clone(cur)
         dataStructs[[i]] <<- cur
         names(dataStructs)[i] <<- getName(cur)
         return(CXChildVisit_Continue)
     }

     CXChildVisit_Recurse
   }

   results = function(asCursor = leaveAsCursor) {
               if(asCursor)
                 dataStructs
               else
                 lapply(dataStructs, makeDataStructureDescription) #XXX need to be more general and convert, e.g., enums to enumeration descriptions
             }
   
   new("Collector", update = update, results = results)
}

makeDataStructureDescription =
function(cur)
{
    if(cur$kind == CXCursor_UnionDecl)
      getStructDef(cur, class = "UnionDefinition")
    else if(cur$kind == CXCursor_StructDecl)        
      getStructDef(cur, class = "StructDefinition")
    else if(cur$kind == CXCursor_TypedefDecl)
      TypeDefinition(name = getName(cur), type = getType(cur), def = cur)
        
    
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
function(tu, fileFilter = character(), col = genDefinesCollector(), options = CXTranslationUnit_DetailedPreprocessingRecord, ...)
{
   if(is.character(tu)) {
     options = CXTranslationUnit_DetailedPreprocessingRecord | options
     tu = createTU(tu, ..., options = options)
   }

   visitTU(tu, col$update, clone = FALSE)
   ans = col$defines()
   if(length(fileFilter))
      ans[ filterByFilenames(ans, fileFilter) ]
   else
      ans   
}

genDefinesCollector =
function(names = character())
{
   ans = list()
   update = function(cur, parent) {
     if(cur$kind == CXCursor_MacroDefinition) {  # or Expansion ?
       ans[[ getName(cur) ]] <<- clone(cur)
     }

     CXChildVisit_Continue
   }

   
   list(update = update, defines = function() ans)
}


genVariablesCollector =
function(clone = TRUE)
{
    variables = list()
    update = function(cur, parent) {
      k = cur$kind
      if(k == CXCursor_VarDecl) {
        n = length(variables) + 1
        variables[[ n ]] <<- if(clone) clone(cur) else cur
        names(variables)[n] <<- getName(cur)
      }
      CXChildVisit_Continue
    }

    list(update = update, variables = function() variables)
}

getVariables =
function(file, fileFilter = character(), visitor = genVariablesCollector(), ...)
{
  if(is.character(file))
      file = createTU(file, ...)

  visitTU(file, visitor$update)
  ans = visitor$variables()
  
  if(length(fileFilter))
     ans[ filterByFilenames(ans, fileFilter) ]
  else
     ans      
}

genRoutineVariableRefsCollector =
function(merge = TRUE, ignoreConst = TRUE)
{
   params = list()
   localVars = list()
   varRefs = list()
   routineRefs = list()

   #XXXX Add detecting static variables
   
   update = function(cur, parent) {

      k = cur$kind
      if(k == CXCursor_VarDecl) {
        n = length(localVars) + 1
        localVars[[ n ]] <<- cur
        names(localVars)[n] <<- getName(cur)        
      } else if(k == CXCursor_ParmDecl) {
        n = length(params) + 1
        params[[ n ]] <<- cur
        names(params)[n] <<- getName(cur)
      } else if(k == CXCursor_DeclRefExpr) {

        ref = getCursorReferenced(cur)
         # don't bother with enums or references to functions.
         # Could make this more specific - i.e. functions that are in a call.

        if(ref$kind == CXCursor_FunctionDecl && parent$kind %in% c(CXCursor_CallExpr, CXCursor_FirstExpr)) {
          n = length(routineRefs) + 1        
          routineRefs[[n]] <<- cur
          names(routineRefs)[n] <<- getName(cur)          
        } else if(!( any(ref$kind == c(CXCursor_EnumConstantDecl, CXCursor_CallExpr, CXCursor_ParmDecl))) &&
                    !(ignoreConst && isConstQualifiedType(getCanonicalType(getType(ref))))) {
          n = length(varRefs) + 1
          varRefs[[ n ]] <<- cur
          names(varRefs)[n] <<- getName(cur)
        }
      }

      CXChildVisit_Recurse
   }

   result = function() {
     locals = unlist(lapply(list(params, localVars), names))
     ans = lapply(list(vars = varRefs, routines = routineRefs),
                     function(x) setdiff(names(x), locals))
     if(merge)
         structure(unlist(ans), names = NULL)
     else
       ans
     
#       ids = lapply(info, function(x) sapply(x, getName))
#       setdiff(ids$varRefs,  c(ids$params, ids$localVars))
   }

   list(update = update,
        info = function()
                 list(params = params, localVars = localVars, varRefs = varRefs, routineRefs = routineRefs),
        result = result)
}

findGlobals =
function(tu, fileFilter = character(), merge = TRUE, ignoreConst = TRUE, visitor = genRoutineVariableRefsCollector(merge, ignoreConst), ...)
{
  if(is.character(tu))
    tu = createTU(tu, ...)
  
  visitTU(tu, visitor$update, clone = TRUE)
  ans = visitor$result()
  if(length(fileFilter))
     ans[ filterByFilenames(ans, fileFilter) ]
  else
     ans    
}


getGlobalVariables =
function(tu, fileFilter = character(), visitor = genGlobalVariablesCollector(), ...)
{
  visitTU(tu, visitor$update, ...)
  ans = visitor$variables()
  if(length(fileFilter))
     ans[ filterByFilenames(ans, fileFilter) ]
  else
     ans
}

genGlobalVariablesCollector =
  # collect the global variables.
  # This doesn't find static variables within a routine.
  # Or does it now?
function(withinRoutines = TRUE)
{
   vars = list()

   status = if(withinRoutines) CXChildVisit_Recurse else CXChildVisit_Continue
     
   update = function(cur, parent) {

     k = cur$kind
     if(k == CXCursor_VarDecl)  {
         if(parent$kind == CXCursor_TranslationUnit || getQualifiers(cur)["static"])
            vars[[getName(cur) ]] <<- makeVariableDescription(clone(cur))
     }


     status
   }

   list(update = update, variables = function() vars)
}



makeVariableDescription =
  # Create a NativeVariable object.
function(cur, clone = FALSE)
{
  if(clone)
    cur = clone(cur)

  new("NativeVariable", name = getName(cur), type = getType(cur), qualifiers = getQualifiers(cur), def = cur)
}

getQualifiers =
  # determine if an entity is const, static.
  # ??? Should be looking at CXCursor_ConstAttr 
function(cur)
{
  toks = getCursorTokens(cur)

  ty = getType(cur)
  
#  i = match("Identifier", names(toks))
#  if(!is.na(i)) 
#     const = (i > 1 && toks[i-1] == "const")
  const = isConstQualifiedType(ty)

     # can static appear in other positions. Yes!
  static = any(toks == "static")
  
  c(static = static,  const = const)
}



genTypedefCollector =
function()
{
    defs = list()
    
    update =
    function(cur, parent) {

        # Need to do C++ classes and namespaces and CXChildVisit_Recurse
        if(cur$kind == CXCursor_TypedefDecl) {
            defs[[ getName(cur) ]] <<- cur
            return(CXChildVisit_Continue)
        }


        CXChildVisit_Recurse
    }

    list(update = update, defs = function() defs)
}




if(FALSE) {
genMacroCollector =
function(asCursor = TRUE)
{
    defs = list()
    update =
        function(cur, parent) {
            if(cur$kind == CXCursor_MacroDefinition) {
                defs <<- c(defs, if(asCursor) cur else makeMacroDef(cur))
                return(CXChildVisit_Continue)
            }

            CXChildVisit_Recurse
        }
    
    list(update = update, macros = function() defs)
}

#XXX Not implemented yet
makeMacroDef =
function(cur)
{
  stop("not implemented yet")
  
  new("MacroDefinition",
       name = getName(cur)
     )
      
}
}






if(FALSE) {
    # set getInclusions()
genIncludesCollector =
function(byFile = FALSE, asCursor = FALSE)
{
    includes = if(byFile)
                  list()
                else
                  character()
    
    update =
        function(cur, parent) {
            if(cur$kind == CXCursor_InclusionDirective) {
                if(!byFile)
                    includes <<- c(includes, if(asCursor) cur else getFileName(getIncludedFile(cur)))
                else {
                    included = getFileName(getIncludedFile(cur))
                    host = getFileName(cur)
                       includes[[host]] <<- c(includes[[host]], included)
                }
                return(CXChildVisit_Continue)
            }

            CXChildVisit_Recurse
        }
    
    list(update = update, includes = function() includes)
}
}

