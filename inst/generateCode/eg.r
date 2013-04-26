if(FALSE) {
cat(createNativeProxy(r[["clang_getArraySize"]]), sep = "\n")
cat(createRProxy(r[["clang_getArraySize"]]), sep = "\n")

cat(createRProxy(r[["clang_getNumElements"]]), sep = "\n")
cat(createNativeProxy(r[["clang_getNumElements"]]), sep = "\n")
}


#load = invisible(sapply(list.files("inst/generateCode", pattern = "R$", full.names = TRUE), source))

typeMap = list(CXType = list(convertValueToR = "R_makeCXType"),
               CXCursor = list(convertValueToR = "R_makeCXCursor"))

structNames = c("CXType", "CXCursor", "CXSourceRange", "CXSourceLocation")  # "CXModule", 
typeMap = structure(lapply(structNames,
                 function(x) {
                   list(convertValueToR = sprintf("R_make%s",x))
                 }), names = structNames)

     # need to dispose of the string
     # then need to ensure that this is not assigned to ans, but that we get to add our own code. Say I()
typeMap$CXString = list(convertValueToR = function(name, rvar, type)
                                            {
                                               c(sprintf("%s = mkString(clang_getCString(%s));", rvar, name),
                                                 sprintf("clang_disposeString(%s);", name))
                                            })
typeMap$CXString = list(convertValueToR = "CXStringToSEXP")

r = getFunctions("/Users/duncan/llvm-devel/tools/clang/include/clang-c/Index.h", 
                    args = c("-I/Users/duncan/llvm-devel/tools/clang/include"))

#makeCode(r[["clang_Cursor_getReceiverType"]], c("R/clangGen.R", "src/clang.c", "NAMESPACE"), typeMap = typeMap)


#makeCode(r[["clang_getArrayElementType"]], typeMap = typeMap)
# makeCode(r[["clang_CXXMethod_isStatic"]])
# makeCode(r[["clang_hashCursor"]])
