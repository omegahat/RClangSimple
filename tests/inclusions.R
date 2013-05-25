library(RCIndex)

tu = createTU(system.file("exampleCode", "register.c", package = "RCIndex"),
                    includes = sprintf("%s%sinclude", R.home(), .Platform$file.sep))

incs = getInclusions(tu, clone = FALSE)
