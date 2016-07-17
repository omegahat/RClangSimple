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
     funcs[[id]] <<- makeRoutineObject(cur)
     
     CXChildVisit_Continue
  }

  list(update = update, funcs = function() funcs)
}

makeRoutineObject =
function(cur)
{
     id = getName(cur)
     ret = getResultType(cur$type)

     params = children(cur, CXCursor_ParmDecl)
     names(params) = sapply(params, getName)
#     structure(list(returnType = ret, params = params, def = clone(cur)), class = "FunctionDecl")
     new("FunctionDecl", name = id, def = clone(cur), returnType = ret, params = params)
}








getEnums =
function(src, visitor = genEnumCollector(), ...)
{
  if(is.character(src))
     src = createTU(src, ...)

  visitTU(as(src, "CXTranslationUnit"), visitor$update)
  visitor$enums()
}


if(FALSE) {
genEnumCollector =
function()
{
  vars = list()

  update = function(cur, parent) {
     if(cur$kind != CXCursor_EnumDecl)
        return(CXChildVisit_Recurse)

     id = getName(cur)

     vars[[id]] <<- sapply(children(cur), getName)
     CXChildVisit_Recurse
  }

  list(update = update, enums = function() vars)
}
}

genEnumCollector =
function()
{
  enums = list()
  curDef = integer()
  type = NULL
  curName = NA
  cursor = NULL
  
  flush = 
    function() {
       if(length(curDef)) {
          if(is.na(curName) || curName == "")
            curName = length(enums) + 1
          enums[[curName]] <<- new("EnumerationDefinition", values = curDef, type = type, name = curName, def = cursor)
       }
       curDef <<- integer()
       curName <<- NA
       type <<- NULL
       cursor <<- NULL
    }

  doStop = FALSE
  
  update = 
   function(cur, parent)  {
     kind = getCursorKind(cur)

     if(kind == CXCursor_EnumDecl) {
        flush()
        curName <<- getName(cur) # get the name for the enum.
        type <<- getType(cur)
        cursor <<- cur
        
        if(is.na(curName) || curName == "")
            curName <<- getName(type)
        
     } else if(kind == CXCursor_EnumConstantDecl) {
          # allow for repeats, e.g.  A, B = A,
          # also pick up from the last value.
          # Also allow for explicit numbering

       val = if(length(curDef)) curDef[length(curDef)] + 1L else 0L
       toks = getCursorTokens(cur)

       if(length(toks) && toks[length(toks)] %in%  c(",", "}"))
           toks = toks[ - length(toks)]
       
       if(length(toks) > 2) {
          if( any(names(toks[-1]) == "Identifier") && length(toks) == 3) {
             val = toks[-1]["Identifier"]
             val = curDef[val]
          } else if( any(names(toks[-1]) == "Literal") && length(toks) == 3) {  
                  #XXX Need to handle 1L << 0 or whatever
                  # remove the L at the end of a literal.
             val = as.integer(gsub("L$", "", toks[-1]["Literal"]))
          } else if( "Keyword" %in% names(toks)) {
             tmp = toks["Keyword"]
             i = match(tmp, c("false", "true"))
             if(!is.na(i))
               val = i - 1L
             else {
               warning(paste("don't understand this enum setting yet:", paste(toks, collapse = " ")))
               val = NA
             }
          } else {
              if(any ( i <- toks == "=" ))
                 toks = toks[-(1:which(i)[1])]

              toks = toks[ names(toks) != "Comment" ]

              if(length(toks) > 2 && toks[1] == "(" && toks[length(toks)] == ")")
                  toks = toks[ -c(1, length(toks)) ]

                    # now hopefully we just have the tokens in an expression
               if(length(toks) == 3) {
                   val = enumExpr(toks, curDef, enums)
               } else if(length(toks) == 2) {
                   val = getEnumValue(toks[2], curDef)
                   val = switch(toks[1],
                                 "-" = -val,
                                 "~" = bitFlip(val),
                                 "^" = bitXor(val),
                                 val)

               } else if(length(toks) == 1) {
                   val = getEnumValue(toks, curDef)
               } else {
                   val = computeEnumExpr(toks, curDef, enums)
#                  if(any(grepl("owner_read", toks)))  recover()
                  if(is.na(val)) {
                     warning(paste("don't understand this enum yet:", paste(toks, collapse  = " ")))
                     val = NA
                  }
               }
         }
       } else if(length(toks) == 1 && names(toks) == "Identifier" && length(cur) == 1) {
              # This arises in LLVM with macros of the form
              #   FOO(value, name)  expanding to name = value
              # but clang representing this as name with value as a child.
          val <- as.integer(getCursorTokens(cur[[1]])["Literal"])
       }
       curDef[ getName( cur ) ] <<- val
     } else if(doStop) {
         stop("enum value not processed by current code")
#cat(names(cur$kind), getName(cur), "\n")
#if(cur$kind == CXCursor_FirstExpr) print(getTypeKind(cur$type))
#  doStop <<- FALSE
#            browser()
     }

     CXChildVisit_Recurse
  }
  
  list(update = update, enums = function() { flush(); enums})
}

computeEnumExpr =
    # For more than 3 tokens
function(toks,  values, enums = list())
{
  # assuming operators between terms
  e =  toks[1:3]
  rest = toks[-(1:3)]
  val = enumExpr(e, values, enums)
  while(length(rest)) {
     if(is.na(val))
        return(val)
     val = enumExpr( c(val, rest[c(1, 2)]), values, enums)
     rest = rest[-c(1, 2)]
  }
  val
}

getEnumValue =
function(a, values)
{
  if(a %in% names(values))
     return(values[a])

  if(grepl("^0x", a)) 
    return(convertHex(a))
  
  if(grepl("[UL]$", a))
     a = gsub("[UL]$", "", a)

  as.integer(a)
}

convertHex =
function(a)
{
    a = gsub("^0x", "", a)
    hex = structure(0:15, names = c(0:9, LETTERS[1:6]))
    els = strsplit(a, "")[[1]]
    as.integer(sum(16^rev(seq(0, length = length(els))) * hex[els]))
}


enumExpr =
function(toks, curDef, tuEnums)
{
  if(length(toks) > 3) {
        #   stop("not there yet")
     return(computeEnumExpr(toks, curDef, tuEnums))
  }


  vals = sapply(toks[c(1, 3)], getEnumValue, curDef)
  
  if(toks[2] == "<<") {
    bitShift(vals[1], vals[2])
  } else if(toks[2] == "::") {
        # want to look this up in the entire collection of enums.
      if(! (toks[1] %in% names(tuEnums)) ) {
         warning("don't understand enum term ", paste(toks[1], collapse = " "))
         return(NA)
      }
      def = tuEnums[[ toks[1] ]]
      def[toks[3]]
  } else {
#    get(toks[2], mode = "function")(vals[1], vals[2])
     fun = switch(toks[2], "|" = bitOr, "&" = bitAnd)
     if(is.null(fun)) {
        warning("don't understand the operator ", toks[2], " yet")
        NA
     } else
        fun(vals[1], vals[2])
  }
}

bitShift =
function(x, y)
{
   if(x == 1) {
       if(y > 30)
         2L^y
       else
         as.integer(2L^y)
   } else 
       as.integer(bitShiftL(x, y))
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
         reset = function() calls <<- character()
       )
}


findCalls =
  # vectorize
 # findCalls("../src/manual.c",  includes = c("/usr/local/cuda/include", sprintf("%s/../src/include", R.home()), sprintf("%s/include", R.home())))
function(file, n = 10000, ...)
{
  if(is.character(file))
     file = createTU(file, ...)
  
  .Call("R_getCalls", as(file, "CXCursor"), character(n))
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
function(tu, col = genDefinesCollector(), ...)
{
   if(is.character(tu))
     tu = createTU(tu, ...)

   visitTU(tu, col$update, clone = FALSE)
   col$defines()
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
function()
{
    variables = list()
    update = function(cur, parent) {
      k = cur$kind
      if(k == CXCursor_VarDecl) {
        n = length(variables) + 1
        variables[[ n ]] <<- cur
        names(variables)[n] <<- getName(cur)
      }
      CXChildVisit_Continue
    }

    list(update = update, variables = function() variables)
}

getVariables =
function(file, visitor = genVariablesCollector(), ...)
{
  if(is.character(file))
      file = createTU(file, ...)

  visitTU(file, visitor$update)
  visitor$variables()
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
function(tu, merge = TRUE, ignoreConst = TRUE, visitor = genRoutineVariableRefsCollector(merge, ignoreConst), ...)
{
  if(is.character(tu))
    tu = createTU(tu, ...)
  
  visitTU(tu, visitor$update, clone = TRUE)
  visitor$result()
}


getGlobalVariables =
function(tu, visitor = genGlobalVariablesCollector(), ...)
{
  visitTU(tu, visitor$update, ...)
  visitor$variables()
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
