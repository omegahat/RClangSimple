
createIndex =
function(excludeFromPCH = FALSE, verbose = TRUE)
{
  .Call("R_clang_createIndex", as.logical(excludeFromPCH), as.logical(verbose))
}

createTU =
function(src, includes= character(),
          idx = createIndex(), args = character()) #XXX was "-Xclang")
{
  src = path.expand(src)
  if(!file.exists(src))
     stop("no such file: ", src)

  args = c(args, sprintf("-I%s", includes))
  
  .Call("R_clang_createTUFromSource", idx, as.character(src), args)
}

setAs("CXTranslationUnit", "CXCursor",
       function(from) {
         .Call("R_clang_getTranslationUnitCursor", from)
       })

setAs("CXCursor", "CXType",
       function(from)
           from$type)

visitTU = visitCursor = 
function(tu, fun, clone = FALSE)
{
   tu = as(tu, "CXCursor")
   
   if(!is.function(fun))
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

setMethod("getName", "FunctionDecl",
           function(x, ...)
             getName(x$def))


setGeneric("getFileName",
            function(x, ...)
              standardGeneric("getFileName"))

setMethod("getFileName", "CXCursor",
            function(x, ...)
              .Call("R_clang_getInstantionLocation", x))


clangVersion =
function()
  .Call("R_clang_getClangVersion")


