library(RCIndex)
tu = createTU(system.file("exampleCode", "error.c", package = "RCIndex"), verbose = FALSE)
n = getNumDiagnostics(tu)
d = getDiagnostic(tu, 1)

sapply(seq(1, length = n), 
         function(i) getDiagnosticSpelling(getDiagnostic(tu, i)))

.Call("R_clang_getDiagnosticOption", d, NULL)
.Call("R_clang_getDiagnosticCategory", d)

.Call("R_clang_getDiagnosticCategoryText", d)
