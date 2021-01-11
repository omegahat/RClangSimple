
mkIRTemplate =
    #
    # To create the text with the C code for the void *[] array:
    #  cat(mkIRTemplate(r[1:4]), sep = "\n")
    #
    # To create a file and include header files:
    #  mkIRTemplate(r, "/tmp/bob.c", "clang-c/Index.h")
    #
    #  Could add support for types to reference them also.
    #
    #
function(routines, file = character(), headerFiles)
{    
    if(!is.character(routines))
        routines = sapply(routines, getName)

    cmd = sprintf("void *_[] = { %s \n            };",
                   paste(sprintf("(void *) &%s", routines), collapse = ",\n             "))

    if(length(file)) {
        if(is.character(file)) {
            con = file(file, "w")
            on.exit(close(con))
        }
        if(length(headerFiles)) {
            # add a < if no < or " at the beginning of each file name.
            w = !grepl('^[<"]', headerFiles)
            headerFiles[w] = sprintf("<%s>", headerFiles[w])
            
            cat(sprintf("#include %s", headerFiles), "\n", file = con, sep = "\n")
        }
        cat("\n", cmd, file = con)
        return(file)
    } else
        cmd
}
