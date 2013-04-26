r = getFunctions("/Users/duncan/llvm-devel/tools/clang/include/clang-c/Index.h", 
                    args = c("-I/Users/duncan/llvm-devel/tools/clang/include"))

isFn = grep("_is", names(r), val = TRUE)

i = !(gsub(".*_", "", isFn) %in% gsub(".*_", "", ls("package:RCIndex")))

sapply(r[i], function(x) sapply( x$params, function(p) getName(getType(p))))


i = c("clang_isPODType", "clang_isCursorDefinition",
      "clang_CXXMethod_isStatic",   "clang_CXXMethod_isVirtual",
      "clang_Cursor_isDynamicCall",
      "clang_isCursorDefinition",
      "clang_isVirtualBase",
      "clang_isVolatileQualifiedType",                  
     "clang_isRestrictQualifiedType",
     "clang_isInvalid",
 "clang_Cursor_isNull",
  "clang_isDeclaration",
  "clang_isReference",
  "clang_isExpression",
  "clang_isStatement",
  "clang_isAttribute",
  "clang_isTranslationUnit",
  "clang_isPreprocessing",
  "clang_isUnexposed",
  "clang_isConstQualifiedType",
  "clang_isFunctionTypeVariadic",
  "clang_isPODType",
  "clang_Cursor_isBitField"
  )


outFiles = c("R/clangGen.R", "src/clang.c", "NAMESPACE")
lapply(i, function(i) makeCode(r[[i]],  typeMap = typeMap))
