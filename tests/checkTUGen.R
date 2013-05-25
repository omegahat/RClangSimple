library(RCIndex)
parseTU(system.file("exampleCode", "const.c", package = "RCIndex"),
         function(cur, parent)  {
             if(cur$kind == CXCursor_ParmDecl) browser()
               NULL
         })

