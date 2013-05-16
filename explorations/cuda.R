library(RCIndex)

dir = "/usr/local/cuda/include"
headers = sprintf("%s/%s", dir, c("cuda.h", "cublas.h"))
includes = sprintf("-I%s", dir)
  
funs = getFunctions(headers[1], args = includes)

length(funs) # 171



if(FALSE) {
 TUIdx = createIndex()
 tus = lapply(headers, createTU, idx = TUIdx, args = includes)
 # lapply(tus, getFunctions)

 col = genFunctionCollector(headers)
 ff = getFunctions(tus[[1]], col)

 bcol = genFunctionCollector(headers)
 funs = lapply(headers, getFunctions, col = bcol, idx = TUIdx, args = includes) 

 ds = lapply(tus, getDataStructures)
 
 as.POSIXct(getFileTime(getFile(tus[[1]], headers[1])))
}
