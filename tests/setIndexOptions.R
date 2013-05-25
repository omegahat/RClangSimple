library(RCIndex)

idx = createIndex()

CXIndex_setGlobalOptions(idx, c("Indexing", "Editing"))
CXIndex_getGlobalOptions(idx) 

