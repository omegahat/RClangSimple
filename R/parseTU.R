simpleVisitor =
function(cur, parent)
{
  loc = getLocation(cur)
  cat("cursor:", names(cur$kind), getName(cur), "\n",
      "parent:", names(parent$kind), getName(parent),
      "(", loc$file, loc$location['line'], ")",
      "\n")
  CXChildVisit_Recurse
}

parseTU =
function(src, visitor = simpleVisitor,  idx = createIndex(),
           tu = createTU(src, idx = idx, ...), ..., clone = FALSE)
{
   if(is.null(visitor))
     return(tu)
  
   visitTU(tu, visitor, clone = clone)
}

visitChildren =
function(cursor, fun, clone = FALSE, data = NULL) {
  if(!is.function(fun))
    stop("visitChildren needs an R function to apply to each cursor/element")
  
  .Call("R_clang_visitChildren", cursor, fun, as.logical(clone), data)
}

setGeneric("clone",
            function(x, ...)
                standardGeneric("clone"))

setMethod("clone", "CXCursor",
           function(x, ...)
              .Call("R_CXCursor_clone", x))

setMethod("clone", "CXType",
           function(x, ...)
              .Call("R_CXType_clone", x))

# CXCursor_ParmDecl
children =
function(top, types = integer())
{
  kids = list()
  f = function(cur, parent) {
        if(length(types) == 0 || cur$kind %in% types)
                           # need to clone since the cursor is on the stack.
             kids[[length(kids) + 1]] <<- cur
        1L
      }

  visitChildren(top, f, clone = TRUE)

  kids
}


if(FALSE) {
 getFunctions.R = getRoutines.R =
  # These are the pure R visitor forms. The real functions use a C visitor routine when there is no filtering by files.
 function(src, filenames = character(), col = genFunctionCollector(filenames), ...)
 {
  if(is(src, "CXTranslationUnit")) {
    visitTU(src, col$update, clone = TRUE)
    col$funcs()
  } else {
      # if we pass a TU, we don't filter the system routines.
      # To do that, call genFunctionCollector(filenames) and pass the collector.
    parseTU(src, col$update, clone = TRUE, ...)
    w = sapply(col$funcs(), function(x) getFileName(x$def))
    col$funcs()[w == src]
  }
 }
}


getFunctions = getRoutines = 
function(src, fileFilter = character(), expectedNum = 500, recursive = FALSE, ...)
{
#  if(length(filenames))
#    return(getRoutines.R(src, filenames, col, ...))

  if(is.character(src))
     src = createTU(src, ...)

  if(recursive)
      ans = .Call("R_getRoutines", as(src, "CXCursor"), vector("list", expectedNum), character(expectedNum))
  else {
     kids = getChildren(src)
     w = sapply(kids, function(x) x$kind) == CXCursor_FunctionDecl
     ans = kids[w]
  }

  if(length(ans) == 0)
    return(list())
     
  if(length(fileFilter)) 
     ans = ans[ filterByFilenames(ans, fileFilter) ]
  
  tmp = lapply(ans, makeRoutineObject)
  names(tmp) = sapply(tmp, getName)
  tmp
}



getTypedefs =
function(src, fileFilter = character(), col = genTypedefCollector(),  ...)
{
    if(is.character(src))
       src = createTU(src, ...)
    
    visitTU(src, col$update, clone = TRUE)
    defs = col$defs()

    if(length(fileFilter))
       defs = defs[ filterByFilenames(defs, fileFilter) ]

    names(defs) = sapply(defs, getName)           

    defs
}



if(FALSE) {
# See getInclusions
getIncludes =
function(src, byFile = FALSE, col = genIncludesCollector(byFile = byFile), options = CXTranslationUnit_DetailedPreprocessingRecord, ...)
{
    if(is.character(src)) {
       if(!missing(options))
         options = options | CXTranslationUnit_DetailedPreprocessingRecord
       src = createTU(src, ..., options = options)
   }
    
    visitTU(src, col$update, clone = TRUE)
    col$includes()
}



getMacros =
function(src, fileFilter = charactrer(), asCursor = TRUE, col = genMacroCollector(asCursor), options = CXTranslationUnit_DetailedPreprocessingRecord, ...)
{
    if(is.character(src)) {
       if(!missing(options))
          options = options | CXTranslationUnit_DetailedPreprocessingRecord        
       src = createTU(src, ..., options = options)
    }
    
    visitTU(src, col$update, clone = TRUE)
    ans = col$macros()
    if(length(fileFilter))
       ans = ans[ filterByFilenames(defs, fileFilter) ]

    ans
}

}
