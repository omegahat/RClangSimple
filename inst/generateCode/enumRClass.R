createRClassDef =
function(def)
{  
      # if we have an unnamed enum, then just create a variable with the particular symbolic name
      # and its value using a call to GenericEnumValue.
      # Otherwise, create a new class of enum, extending EnumValue, and then define an R variable
      # using the symbolic name but whose value is an instance of that new class and has the value
      # along with the symbolic name.

  if(length(origName) > 1)
      R.ids = paste(paste(origName[ - length(origName)], collapse = "::"), R.ids, sep = "::")
    
    
    if(length(name) == 1 && is.na(name)) {
      sapply(seq(along = obj@values),
             function(i, ...) {
                 v = R.ids[i]
                 cat(backquote(v), "<- GenericEnumValue(", dQuote(v), ", ", obj@values[v],
                        if(S3Classes) ", S3 = TRUE", 
                             ")\n", file = file, ...)}, ...)
           
    } else if(length(name) == 2 && is.na(name[2])) {
            # an anonymous enum within a scope.
      id = backquote( name[1] )
      cat(id, "<- ", "ScopedEnumDef", "(", paste("'", name[1], "'", sep = ""), ",",
                                          paste(paste("'", names(obj@values), "'", sep = ""), obj@values, sep = " = ", collapse = ", "),
                                      ")", "\n", file = file, ...)
    } else {
       #els = strsplit(name, "::")[[1]]
       els = name
       if(length(els) > 1) {
         if(FALSE)
           warning(Warning(paste("namespace", els[1], "in enumeration defintion. Ignoring this for now."),
                   namespace = els[1],   class = "NamespaceEnumerationWarning"
                  ))
         name = els = paste(els, collapse = "::") # [1], els[2], sep = "::")
       }
       
       defName = paste(els[1], "Values", sep = "")

       if(bitwise || !S3Classes)
          cat("setClass('", name, "', representation(names = 'character'), contains = '", if(bitwise) "BitwiseValue" else "EnumValue", "')", "\n", sep = "", file = file)
       
       #XXX if the name has a :: in it, we are in trouble.
        #??? Really


           # code for the named integer object containing the name-value pairs.
       valStruct = paste("structure(as.integer(c(", paste(obj@values, collapse = ",\n"), ")),\n",
                                    "names = c(",  paste('"', names(obj@values), '"', collapse = ",\n", sep = ""), "))", sep = "")
       
       if(bitwise) {
         cat(backtick(defName), " = BitwiseValue(", valStruct, ", class ='", name, "'",
                          ")\n\n", sep = "", file = file, ...)
       } else {
         cat(backtick(defName), " = EnumDef('", name, "', ", valStruct, ")\n\n", file = file, ..., sep = '')
       }


       cat("\n", file = file)
       
          # Should we write the code explicitly here to make it "faster" or leave it as a function call
          # The same code works for both bitwise and regular enumerations.
          # XXX Seem to need the integer, eventhough is(1L, "numeric") is TRUE.

       if(bitwise || !S3Classes) {
        prefix = ""
        if(length(origName) > 1)
           prefix = paste(origName[-length(origName)], "::", collapse = "", sep = "")
        else {
           prefix = getLongestStartingCommonSubstring(names(obj@values))
        }

        if(prefix != "")
          prefix = c(", prefix = ", dQuote(prefix))
          
        for(i in c("numeric", "character", "integer")) {
             cat("setAs('", i, "', '", name, "', function(from)  ",
                    if(bitwise)
                       "asBitwiseValue"
                    else
                       "asEnumValue",
                    "(from, ", backtick(defName), ", '", name, "'",
                    prefix,
                    "))\n",
                 sep = "", file = file, ...)
        }
       }
         # Now write out the individual variables
       cat("\n\n", file = file)

       sapply(seq(along = obj@values),
               function(i, ...) {
                 v = names(obj@values[i])
                 #  alternatively call the [ method in RAutoGenRunTime
                 #    e.g. wxZipMethodValues['a']
                 #     cat(v, "<- ", defName, "['", v, "']\n", file = file, sep = "", ...)
                 #  But the approach we use here avoids any matching of names and values.

                 rid = backtick(R.ids[i])
                 
                 if(bitwise)
                   cat(rid, " <- BitwiseValue(", obj@values[v], ", '", v, "', class = '", name, "'",
                                      ")\n", file = file, ..., sep = "")
                 else
                   cat(rid, " <- GenericEnumValue('", v, "', ", obj@values[v], ", '", name, "'",
                              if(S3Classes) ", S3 = TRUE",                        
                                   ")\n", file = file, ..., sep = "")
               },
              ...)
     }

}  
