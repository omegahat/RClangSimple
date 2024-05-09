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
    # 'Ubuntu clang version 14.0.0-1ubuntu1.1'
function(version = clangVersion())
{
    rx = ".*clang version ([0-9.]+)[- ]?.*"
    if(!grepl(rx, version))
        warning("could not extract the version number from '", version, "'")

   ans = gsub(rx, "\\1", version)
   as.integer(strsplit(ans, "\\.")[[1]])[1:2]
}


