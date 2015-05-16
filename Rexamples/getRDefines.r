# Read the R header file Rinternals.h and get the preprocessor defines.
library(RCIndex)
tu = createTU("/Users/duncan/Projects/R-3.0-dev/src/include/Rinternals.h",
                    includes = c("/Users/duncan/Projects/R-3.0-dev/build/include", "/Users/duncan/Projects/R-3.0-dev/src/include"))

# Currently empty.
defs = getDefines(tu)
getCursorTokens(defs$STRSXP)


SexpTypes = grep("SXP$", names(defs), value = TRUE)
sapply(defs[SexpTypes], function(x) as.integer(getCursorTokens(x)["Literal"]))




