
.onLoad =
function(...)
{
    cfg = clangVersionNum(libclangVersion_Install)
    rt = clangVersion(TRUE)

    if( cfg[1] != rt[1] )
        message("**** SERIOUS:  run-time version and the configuration version of libclang are different and this could lead to incorrect results or crashes!\n",
                if(cfg[1] > rt[1])
                    "**** If building from source, perhaps you need to remove the .o files in src/ and re-install", "\n\n")
}
