library(RCIndex)
library(RCodeGen)
# where are the include files?
incs = stop("need to tell me where the include files are")
incs = path.expand("~/local/include")
tu = createTU(sprintf("%s/clang-c/Index.h", incs), includes = incs)
enums = getEnums(tu)


compareEnums = 
function(actual, def)
{
  a = setdiff(actual, def@values)
  b = setdiff(def@values, actual)

  if(length(a) || length(b))
    stop("problem for ", def@name)
  
  TRUE
}