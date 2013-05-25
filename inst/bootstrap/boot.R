library(RCIndex)

# enums
# typedefs
# structs
# routines
# defines

llvmInc = path.expand("~/llvm-devel/tools/clang/include")
h = sprintf("%s/clang-c/Index.h", llvmInc)
tu = createTU(h, includes  = llvmInc)

enums = getEnums(tu)

r = getRoutines(tu)
cr = r[ grep("^clang_", names(r), value = TRUE) ]

 # what we already have
rcodeFiles = list.files("src", pattern = "\\.c$", full.names = TRUE)
kalls = lapply(rcodeFiles, findCalls, includes = c(llvmInc, sprintf("%s/include", R.home()), sprintf("%s/../src/include", R.home())))
clangKalls = table(grep("clang_", unlist(kalls), value = TRUE))

omitted = setdiff(names(cr), names(clangKalls))

w = grep("(clang_[Ii]ndex|HTML|Complet)", omitted, value = TRUE, invert = TRUE)

TypeMap = list(CXString = list(convertValueToR = function(name, ...) sprintf("CXStringToSEXP(%s)", name)),
               CXCursor = list(convertValueToR = function(name, ...) sprintf("R_makeCXCursor(%s)", name) ),
               CXType = list(convertValueToR = function(name, ...) sprintf("R_makeCXType(%s)", name) ),
#               CXFile = list(convertValueToR = function(name, ...) sprintf("R_makeCXFile(%s)", name) ),  
               CXComment = list(convertValueToR = function(name, ...) sprintf("R_makeCXComment(%s)", name) ),  
               CXSourceLocation = list(convertValueToR = function(name, ...) sprintf("R_makeCXSourceLocation(%s)", name) ),
               CXSourceRange = list(convertValueToR = function(name, ...) sprintf("R_makeCXSourceRange(%s)", name) )    
              )

cat(makeEnumClass(enums$CXTranslationUnit_Flags, bitwise = TRUE, prefix = "CXTranslationUnit_"), file = "R/CXTranslationUnit_Flags.R", sep = "\n")
cat(makeEnumClass(enums$CXGlobalOptFlags, bitwise = TRUE, prefix = c("CXGlobalOpt_", "CXGlobalOpt_ThreadBackgroundPriorityFor")), sep = "\n", file = "R/CXGlobalOptFlags.R")


createNativeProxy(r$clang_getDiagnosticOption, typeMap = TypeMap)

if(FALSE) {
ec = genEnumCollector()
z = visitTU(tu, ec$update)
e = ec$enums()
}

rc = genFunctionCollector()
z = visitTU(tu, rc$update)
r = rc$funcs()
r = r[grepl("^clang_", names(r))]

ga = r[["clang_Cursor_getArgument"]]

tp = getType(r[["clang_equalTypes"]]$params[[1]])



tyFuns = sapply(r, function(x) length(x$params) && getName(getType(x$params[[1]]))== "CXType")

tyTypes = list(ins = unlist(lapply(r[tyFuns], function(x) sapply(x$params[-1], function(x) getName(getType(x))))),
                outs = unlist(lapply(r[tyFuns], function(x) getName(x$returnType))))

