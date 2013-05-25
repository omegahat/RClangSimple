getCursorTokens =
function(cur)
 .Call("R_getCursorTokens", cur)

createIndex =
  # verbose means show diagnostics.
function(excludeFromPCH = FALSE, verbose = getOption("ShowParserDiagnostics", TRUE))
{
  .Call("R_clang_createIndex", as.logical(excludeFromPCH), as.logical(verbose))
}

createTU =
function(src, includes = character(),
         idx = createIndex(verbose = verbose), args = character(), verbose =  getOption("ShowParserDiagnostics", TRUE),
         options = 0) #XXX was "-Xclang")
{
  src = path.expand(src)
  if(!file.exists(src))
     stop("no such file: ", src)

  includes = sapply(includes, path.expand)

  args = c(args, sprintf("-I%s", includes))

  if(!missing(options))
    options = as(options, "CXTranslationUnit_Flags")
  
  .Call("R_clang_createTUFromSource", idx, as.character(src), args, as.integer(options))
}

setAs("CXTranslationUnit", "CXCursor",
       function(from) {
         .Call("R_clang_getTranslationUnitCursor", from)
       })

setAs("CXCursor", "CXType",
       function(from)
           from$type)

visitTU = visitCursor = 
function(tu, fun, clone = FALSE, ...)
{
   if(is.character(tu))
     tu = createTU(tu, ...)
   
   tu = as(tu, "CXCursor")
   
   if(!is.function(fun) && !is(fun, "NativeSymbol"))
     stop("must supply an R function to visitTU")
   
   .Call("R_clang_visitChildren", tu, fun, as.logical(clone))
}



setGeneric("getName",
            function(x, ...)
              standardGeneric("getName"))

setMethod("getName", "CXCursor",
           function(x, display = FALSE, ...)
             if(display)
               .Call("R_clang_getCursorDisplayName", x)
             else
               .Call("R_clang_getCursorSpelling", x))

setMethod("getName", "CXType",
           function(x, ...)
               .Call("R_clang_getTypeSpelling", x))

setMethod("getName", "NativeElement",
           function(x, ...)
           # getName(x@def
             x@name)



setGeneric("getFileName",
            function(x, ...)
              standardGeneric("getFileName"))

setMethod("getFileName", "CXCursor",
            function(x, ...) {
               getFileName(getCursorExtent(x))
            })

setAs("CXCursor", "CXSourceRange",
       function(from)
             getCursorExtent(from))

getCursorExtent =
function(x)
  .Call("R_clang_getCursorExtent", as(x, "CXCursor"))

getLocation =
function(x, type = "Expansion")
{
  routine = sprintf("R_clang_get%sLocation", type)
  
  ans = .Call(routine, as(x, "CXSourceRange"))
  names(ans) = c("file", "location")
  names(ans$location) = c("line", "column", "offset")[seq(along = ans$location)] # Presumed doesn't return offset.

  ans
}

getInstantiationLocation =
function(x)
  getLocation(x, "Instantiation")

getExpansionLocation =
function(x)
  getLocation(x, "Expansion")

getPresumedLocation =
function(x)
  getLocation(x, "Presumed")
  

setMethod("getFileName", "CXSourceRange",
            function(x, ...)          
              .Call("R_clang_getInstantiationLocation", x)[[1]])

setMethod("getFileName", "CXSourceLocation",
            function(x, ...)          
              .Call("R_clang_getInstantiationLocation", x)[[1]])

setMethod("getFileName", "CXFile",
            function(x, ...) {
                .Call('R_clang_getFileName', x)
            })



clangVersion =
function()
  .Call("R_clang_getClangVersion")




getChildren =
function(x)
{
   kids = list()
   update = function(cur, parent) {
     kids[[length(kids) + 1L]] <<- cur
     CXChildVisit_Continue
   }
   visitTU(as(x, "CXCursor"), update, clone = TRUE)
   kids
}
  


genInclusionCollector =
function()
{
   files = character()
   update = function(file, stack, ...) {
     files <<- c(files, getFileName(file))
     names(files)[length(files)] <<- if(length(stack) > 1) getFileName(stack[[1]]) else ""
   }

   list(update = update, files = function() files)
}

getInclusions =
function(file, fun = genInclusionCollector(), ...)  
{
   if(is.character(file))
      file = createTU(file, ...)
   else
      file = as(file, "CXTranslationUnit")

   .Call("R_clang_getInclusions", file, fun$update)
   fun$files()
} 


getTUResourceUsage = getCXTUResourceUsage =
function(tu)
{
  .Call("R_clang_getCXTUResourceUsage", as(tu, "CXTranslationUnit"))
}


setMethod("getFileName", "CXTranslationUnit",
           function(x, ...)
             getTranslationUnitSpelling(x))
