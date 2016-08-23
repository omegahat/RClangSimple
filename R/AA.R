clangVersion =
    #
    # Run time version
    #
function()
  .Call("R_clang_getClangVersion")


clangVersionNum =
function(version = clangVersion())
{
 ans = gsub("^clang version ([0-9.]+) .*", "\\1", version)
 as.integer(strsplit(ans, "\\.")[[1]])[1:2]
#  c(3, 7)
}


