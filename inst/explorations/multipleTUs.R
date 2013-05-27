# How can we resolve across TUs.
library(RCIndex)
tus = createTU(list.files("../exampleCode", pattern = "file[12].c$", full.names = TRUE), includes = "inst/exampleCode")
r1 = getRoutines(tus[[1]])
a = getCursorReferenced(r1$foo@def[[2]][[1]][[1]][[1]][[1]][[1]])

getFileName(getCursorTranslationUnit(a))

 # both of these return CXCursor_FirstInvalid  
getCursorDefinition(a)
getCursorDefinition(r1$foo@def[[2]][[1]][[1]][[1]][[1]][[1]])

# getCursorUSR to compare across tu's.
