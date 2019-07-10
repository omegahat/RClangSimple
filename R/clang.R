getCursorTokens =
function(cur)
 .Call("R_getCursorTokens", as(cur, "CXCursor"))

createIndex =
  # verbose means show diagnostics.
function(excludeFromPCH = FALSE, verbose = getOption("ShowParserDiagnostics", TRUE))
{
  .Call("R_clang_createIndex", as.logical(excludeFromPCH), as.logical(verbose))
}

createTU =
  #
  # Multiple TUs in one call.
  # tus = createTU(list.files("src", pattern = "\\.c$", full.names = TRUE), includes = c("~/llvm-devel/tools/clang/include", c(sprintf("%s/../src/include", R.home()), sprintf("%s/include", R.home()))))
  #
  #
function(src, includes = character(),
         idx = createIndex(verbose = verbose), args = character(), verbose =  getOption("ShowParserDiagnostics", TRUE),
         options = 0) #XXX was "-Xclang")
{
  src = path.expand(src)
 
  if(!all(m <- file.exists(src)))
     stop("no such file: ", paste(src[m], collapse = ", "))

  includes = sapply(includes, path.expand)

  args = c(args, sprintf("-I%s", includes))

  if(!missing(options))
    options = as(options, "CXTranslationUnit_Flags")

  tus = lapply(src, function(src)
                    .Call("R_clang_createTUFromSource", idx, as.character(src), args, as.integer(options)))
  
  if(length(src) == 1) {
    tus[[1]]
  } else
    structure(tus, names = src, class = "CXTranslationUnitList")
}

getTranslationUnitCursor =
function(tu)
         .Call("R_clang_getTranslationUnitCursor", as(tu, "CXTranslationUnit"))

setAs("CXTranslationUnit", "CXCursor",
       function(from) {
         .Call("R_clang_getTranslationUnitCursor", from)
       })

setAs("CXCursor", "CXType",
       function(from)
           from$type)

visitTU = visitCursor = 
function(tu, fun, clone = TRUE, data = NULL, ...)
{
   if(is.character(tu))
     tu = createTU(tu, ...)

   orig = fun
   if(is(fun, "S4CursorVisitor"))
     fun = fun@update
   else if(is(fun, "RefCursorVisitor"))
     fun = fun$update
   
   if(!is.function(fun) && !is(fun, "NativeSymbol"))
     stop("must supply an R function to visitTU")

   do = function(tu) {
          tu = as(tu, "CXCursor")            
          .Call("R_clang_visitChildren", tu, fun, as.logical(clone), data)
        }
   
   ans = if(is(tu, "CXTranslationUnitList"))
            lapply(tu, do)
         else
            do(tu)

   
   fun = orig
   if(is(fun, "S4CursorVisitor"))
     fun@result()
   else if(is(fun, "RefCursorVisitor"))
     fun$result()
   else
     ans
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

setMethod("getName", "StructDefinition",
           function(x, ...)
               x@name[1])


setGeneric("getFileName",
            function(x, ...)
              standardGeneric("getFileName"))

setMethod("getFileName", "CXCursor",
            function(x, ...) {
               getFileName(getCursorExtent(x))
            })


setMethod("getFileName", "EnumerationDefinition",
            function(x, ...) {
               getFileName(x@def)
            })

setMethod("getFileName", "FunctionDecl",
            function(x, ...) {
               getFileName(x@def)
            })

setOldClass("StructDescription")
setMethod("getFileName", "StructDescription",
            function(x, ...) {
               getFileName(x@def)
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
  type = match.arg(type, c("Expansion", "Presumed", "Instantiation"))
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
function(flat)
{
   files = character()
   update = function(file, stack, ...) {
     f = getFileName(file)
     parent = if(length(stack) > 0) getFileName(stack[[1]]) else ""
     files <<- c(files, f)
     names(files)[length(files)] <<- parent
   }
   
   list(update = update, files = function() files)   
}

genHierarchicalInclusionCollector =
  #
  #  Do this better, i.e. more hierarchically
  #  so that we determine what includes what, when
  #
function()
{
   files = list()
   base = ""

   update = function(file, stack, ...) {
     f = getFileName(file)
     if(length(stack) == 0) {
       base <<- f
       files[[base]] <<- character()
     } else {
       parent = getFileName(stack[[1]])
       ex = if(parent %in% names(files))
               files[[parent]]
            else
               character()
       files[[parent]] <<- c(ex, f)
     }
}   

   list(update = update, files = function() files)
}

getInclusions = getIncludes =
function(file, flat = FALSE,
           fun = if(flat)
                    genInclusionCollector()
                 else
                    genHierarchicalInclusionCollector(), ...)  
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



getCursorTranslationUnit =
function(cursor)
{
 .Call("R_clang_CXCursor_getCursorTranslationUnit", as(cursor, "CXCursor"))
}


getNumArgTypes =
function(ty)
  .Call("R_clang_getNumArgTypes", as(ty, "CXType"))

getArgType =
function(ty, i)
  .Call("R_clang_getArgType", as(ty, "CXType"), as.integer(i - 1L))

getArgsType =
function(ty)
{
  lapply(seq(1, length = getNumArgTypes(ty)), function(i) getArgType(ty, i))
}



getParent =
function(cursor, semantic = TRUE)
{
    if(semantic)
       getCursorSemanticParent(cursor)
    else
       getCursorLexicalParent(cursor)
}

