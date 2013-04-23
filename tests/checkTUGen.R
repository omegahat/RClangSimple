library(RCIndex)
parseTU("~/GitWorkingArea/RClangSimple/inst/exampleCode/const.c",
         function(cur, parent)  {
             if(cur$kind == CXCursor_ParmDecl) browser()
               NULL
         })

