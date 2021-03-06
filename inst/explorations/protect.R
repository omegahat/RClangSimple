# Start of a simple-minded example to find
# PROTECT() and UNPROTECT() calls
# and to try to do some simple warnings
#
# not trying to handle protects within conditionals, or other more compex issues
#
library(RCIndex)


genProtectAnalyzer =
function()
{
  numAllocs = 0  
  numProtectCalls = 0
  numUnprotectCalls = numeric()

  inUnprotect = FALSE  
  allocCounterVarName = ""    
  unProtectParent = NULL

  update = function(cur, parent)    {
    k = cur$kind

    if(inUnprotect && identical(unProtectParent, cur) ) {
       unProtectParent <<- NULL
       inUnprotect <<- FALSE
     }
    
   if(k == CXCursor_CallExpr) {
      fn = getName(cur)
      print(fn)
      if(fn == "PROTECT" || fn == "Rf_protect")
        numProtectCalls <<- numProtectCalls + 1
      else if(fn == "UNPROTECT" || fn == "Rf_unprotect") {
        numUnprotectCalls <<- numUnprotectCalls
        unProtectParent <<- parent
        inUnprotect <<- TRUE
        browser()
      } else if(fn %in% c("Rf_allocVector", "NEW_NUMERIC", "NEW_INTEGER", "NEW_LOGICAL", "NEW_CHARACTER"))
          numAllocs <<- numAllocs + 1
    } else if(inUnprotect) {
       if(k == CXCursor_IntegerLiteral) {
          val = getCursorTokens(cur)["Literal"]
          numUnprotectCalls <<-  c(numUnprotectCalls, as.integer(val))
       } else if(k == CXCursor_FirstExpr) {
           allocCounterVarName <<- getName(cur)
       }
    }
    
    CXChildVisit_Recurse
  }

  reset = function() {
    numProtectCalls <<- 0
    numUnprotectCalls <<- 0
    unProtectParent <<- NULL
    inUnprotect <<- FALSE
    numAllocs <<- 0
    allocCounterVarName <<- ""    
  }

  list(update = update,
       info = function() {
                 list(numProtectCalls = numProtectCalls,
                      numUnprotectCalls = numUnprotectCalls,
                      inUnprotect = inUnprotect,
                      numAllocs = numAllocs)},
       reset = reset)
}


if(FALSE) {
# source("explorations/protect.R")
 tu = createTU("../exampleCode/protectError.c", includes = sprintf("%s/include", R.home()))
 r = getRoutines(tu)
# a <- genProtectAnalyzer()
# visitTU(as(r$R_bar$def, "CXCursor"), a$update)

 a <- genProtectAnalyzer()
 gctorture(TRUE)
 visitTU(as(r$R_foobar_ctr@def, "CXCursor"), a$update)
}
