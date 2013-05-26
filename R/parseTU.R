simpleVisitor =
function(cur, parent)
{
  cat("cursor:", names(cur$kind), getName(cur), "\n",
      "parent:", names(parent$kind), getName(parent),
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
function(cursor, fun, clone = FALSE) {
  if(!is.function(fun))
    stop("visitChildren needs an R function to apply to each cursor/element")
  
  .Call("R_clang_visitChildren", cursor, fun, as.logical(clone))
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


getFunctions.R = getRoutines.R =
  # THese are the pure R visitor forms. The real functions use a C visitor routine when there is no filtering by files.
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


getFunctions = getRoutines = 
function(src, filenames = TRUE, col = genFunctionCollector(filenames), expectedNum = 500, ...)
{
#  if(length(filenames))
#    return(getRoutines.R(src, filenames, col, ...))

  if(is.character(src))
    src = createTU(src, ...)
  ans = .Call("R_getRoutines", as(src, "CXCursor"), vector("list", expectedNum), character(expectedNum))

  if(is.logical(filenames) && filenames)
    filenames = getFileName(src)
  
  if(length(filenames) && is.character(filenames) )
    ans = ans[ sapply(ans, function(x) getFileName(x) %in% filenames) ]
  
  lapply(ans, makeRoutineObject)
}
