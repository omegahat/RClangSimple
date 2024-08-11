library(RCIndex)

RSrcDir = path.expand("~/Rtrunk")
flags = system2("R", c("CMD", "config", "CPPFLAGS"), stdout = TRUE)
flags = strsplit(flags, " ")[[1]]
flags = c(flags, "-DHAVE_CONFIG_H", "-DTESTING_WRITE_BARRIER", "-g", "-O2", "-Wall")
# , "-inline-threshold=0", "-inlinehint-threshold=10")
inc = c(file.path(RSrcDir, "build2", "src/include"), file.path(RSrcDir, "src/include"))
tu = createTU(file.path(RSrcDir, "src/main/main.c"), includes = inc, args = flags)

# message about fatal error: math.h file not found. Can ignore.


getName2 = 
function(x)
{
   v = getName(x)
   if(v == "")
      v = getCursorTokens(x)[1]
   v
}


k = findCalls(tu, "main.c")
rtns = sapply(k, getName2)
w = rtns == ""
#if(any(w))
#  rtns[w] = sapply(k[w], function(x) getCursorTokens(x)[1])

w = rtns == "Rf_eval"

k2 = k[w]

a2 = lapply(k2, `[[`, 3)
sapply(a2, getCursorKind)
# All CXCursor_FirstExpr

v = sapply(a2, getName)
w2 = v == "R_GlobalEnv"

table(w2)
k3 = k2[w2]


# alternative.  Get the routines and their calls rather than all calls in the TU.
r = getRoutines(tu)
kr = lapply(r, findCalls)


# Does this match the results from Rllvm. See Rllvm/inst/doc/staticCodeAnalysis.md
# 7 from there, 6 from here.
# Different compilation flags?

# Check where they occur

do.call(rbind, lapply(k2[w2], function(x) getLocation(x)$location))

# Which routines do these occur in?

sapply(k2[w2], function(x) getName(findParentFunction(x)))

# LLVM has Rf_ReplIteration and R_ReplDLLdo1 and 3 setup_Rmainloop and 2 R_dot_Last.
# Here, we have the same counts for setup_Rmainloop and R_dot_Last, and one for ParseBrowser.
# And indeed, there is one in ParseBrowser. ParseBrowser is static and not included in the list of
# routines from the LLVM Module.
#
# Why is the RCIndex approach missing Rf_ReplIteration and R_ReplDLLdo1?
#
# R_ReplDLLdo1 - the variable in the call is rho, but this is initialized to R_GlobalEnv and not
# reassigned.  We can check the assignments to rho. llvm recognizes that this variable is unchanged
# and so inlines R_GlobalEnv.
#
#
# Rf_ReplIteration - llvm inlines R_GlobalEnv, if we use -O2. With no optimization, it uses rho, the
# local variable which is actually a parameter.
#  Within this file, Rf_ReplIteration() is only called from R_ReplConsole() and R_ReplConsole() is
# only called from 
#  + run_Rmainloop() with R_GlobalEnv as the argument for the parameter rho
#  + do_browser()
# Considering Rf_ReplIteration is not static and neither is do_browser(), it is not obvious
# how llvm determines rho will be R_GlobalEnv.
#  
#






