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
           tu = createTU(src, idx, ...), ..., clone = FALSE)
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


getFunctions =
function(src, col = genFunctionCollector(), ...)
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
