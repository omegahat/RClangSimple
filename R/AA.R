clangVersion =
    #
    # Run time version
    #
function(asNums = FALSE)
{    
  ans = .Call("R_clang_getClangVersion")
  if(asNums)
    clangVersionNum(ans)
  else
    ans
}

clangVersionNum =
    #  clangVersionNum("clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)")
function(version = clangVersion())
{
   ans = gsub("^clang version ([0-9.]+)[- ].*", "\\1", version)
   as.integer(strsplit(ans, "\\.")[[1]])[1:2]
}


