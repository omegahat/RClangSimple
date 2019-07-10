filterByFilenames =
    #
    # If isRegex  then just do a regular expression.
    #
    # If not, then match either a 
    #
    #  Filter by a directory
    #   i = filterByFilenames( filenames = c("/usr/local/include/llvm"), cursorFilenames = ff)
    #   setdiff(ff, ff[ i ])
    #
    #  A file and a directory
    #
    #
    #   i = filterByFilenames( filenames = c("/usr/local/include/llvm", "/Users/duncan/LLVM3.7/clang+llvm-3.7.0-x86_64-apple-darwin/include/c++/v1/atomic"), cursorFilenames = ff)
    #   unique(ff[i])
    #
    #   i = filterByFilenames( filenames = c("Dwarf.h"), cursorFilenames = ff)
    #   setdiff(ff, ff[ i ])        
    #
    #
    #
    #  By regex
    #   i = filterByFilenames( filenames = c("/llvm"), cursorFilenames = ff)
    #   setdiff(ff, ff[ i ])
    #
    #
function(cursors, filenames = character(), isRegex = !any(file.exists(filenames)),
          cursorFilenames = sapply(cursors, getFileName))
{
   
    if(isRegex)
       return( grepl(paste(filenames, collapse = "|"),  cursorFilenames) )


    ans = rep(NA, length = length(cursorFilenames))

    info = file.info(filenames)

      # Get the names that don't exist as files or directories and then we will
      # use these as regular expressions after matching the others.
    na = is.na(info[, "size"])
    notExist = filenames[ na ]
    info = info[!na, ]

      # Check the actual files
    files = rownames(info) [! info$isdir ]
    if(length(files)) {
       i = cursorFilenames %in% files
       ans[i] = TRUE
    }

      # Check the directories    
    dirs = rownames(info) [ info$isdir ]
    if(length(dirs)) {
       w = which(is.na(ans) | !ans)
       i = grepl( sprintf("^(%s)", paste(dirs, collapse = "|")),  cursorFilenames[w] ) 
       ans[ w[ i ] ] = TRUE
    }

    if(length(notExist)) {
       w = which(is.na(ans) | !ans)
       i = grepl( sprintf("^(%s)", paste(escapeRX(notExist), collapse = "|")),  cursorFilenames[w] ) 
       ans[ w[ i ] ] = TRUE
    }

    #XX???
    ans[is.na(ans)] = FALSE   

    ans
}


escapeRX =
function(x)
{
     gsub("+", "\\\\+", x, fixed = TRUE)
}
