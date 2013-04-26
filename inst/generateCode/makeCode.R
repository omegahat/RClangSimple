source("~/GitWorkingArea/RGCCTranslationUnit/R/codeObjects.R")

makeCode =
function(fun, write = TRUE, typeMap = NULL, ...)
{
  funName = gsub("^clang_", "", getName(fun))
  ans = list(r = createRProxy(fun, funName, typeMap = typeMap),
             native = createNativeProxy(fun, typeMap = typeMap),
             namespace = sprintf("export(%s)", funName))
  
  if(is.logical(write)) {
     if(write)
      sapply(ans, function(x) cat(as(x, "character"), sep = "\n"))
  } else if(length(write))  
      mapply(addToFile, ans, write)


  invisible(ans)
}

addToFile =
function(code, file)
{
   if(!is(file, "connection"))  {
      file = base::file(file, "a")
      on.exit(close(file))      
   }

   if(!isOpen(file)) {
     file = open(file, "a")
     on.exit(close(file))
   }
   cat("\n", as(code, "character"), file = file, sep = "\n")
   
   TRUE
}
