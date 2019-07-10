# Read the R header file Rinternals.h and get the preprocessor defines.
library(RCIndex)
tu = createTU("/Users/duncan/Projects/R-3.0-dev/src/include/Rinternals.h",
              includes = c("/Users/duncan/Projects/R-3.0-dev/build/include",
                           "/Users/duncan/Projects/R-3.0-dev/src/include"),
              options = CXTranslationUnit_DetailedPreprocessingRecord)

# Get all of the defines, including the system & compiler ones.
rdefs = getDefines(tu)
length(rdefs)

# Restrict to those in the R header files.
rdefs = getDefines(tu, "R-3.0-dev")
length(rdefs)

getCursorTokens(rdefs$STRSXP)


SexpTypes = grep("SXP$", names(rdefs), value = TRUE)
sapply(rdefs[SexpTypes], function(x) as.integer(getCursorTokens(x)["Literal"]))




