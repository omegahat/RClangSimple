library(RGCCTranslationUnit)
tu = parseTU("cindex.c.001t.tu")

map = list(CXString = list(target = 'CXString', convertValueToR = 'CXStringToSEXP'))

rr = resolveType(getRoutines(tu), tu)
rr = rr[ grepl("^clang_", names(rr)) ]
names(rr)

OmitRoutines = c("indexSourceFile",  "indexTranslationUnit",
                 "getInstantiationLocation",
                 "getDiagnosticCategoryName", "executeOnThread",
                # not working yet
                "tokenize", "getExpansionLocation",  "getSpellingLocation",
                 "getFileLocation", "getOverriddenCursors", "getOffsetOf",  "indexLoc_getFileLocation"
                )
                 

rr = rr[ !(names(rr) %in% sprintf("clang_%s", OmitRoutines)) ]

# "clang_getRemappingsFromFileList"
b = createRoutineBinding(rr[["clang_getDefinitionSpellingAndExtent"]], typeMap = map)

#b = createRoutineBinding(rr[["clang_getTypeSpelling"]], typeMap = map)
 # The following now fails!
e = createRoutineBinding(rr[["clang_getExpansionLocation"]], typeMap = map)
cat('#include "RClang.h"\n\n', as(b$native, "character"), file = "../../src/test.c") 

out = file("../../src/tmp.c", "w")
rout = file("../../R/tmp.R", "w")

cat('#include "RClang.h"\n', file = out)

mk = lapply(names(rr),
       function(id) {
         b = createRoutineBinding(rr[[id]], typeMap = map)
         writeCode(b, "native", file = out)
         writeCode(b, "r", file = rout)         
       })

close(out); close(rout)


###########

filep = function(src) length(src) > 0
ds = getDataStructures(tu)
ids = grep("^CX", names(ds), value = TRUE)
cds = ds[ids]
rcds = lapply(resolveType(cds, tu), resolveType, tu)
rcds = rcds[!duplicated(names(rcds))]

 
tyStructs = rcds[  sapply(rcds, function(x) is(x, "StructDefinition") || (is(x, "TypedefDefinition") && is(x@type, "StructDefinition")))]

dc = DefinitionContainer(tu)

com = generateStructInterface(tyStructs[["CXComment"]], dc)


out = file("../../src/structCode.c", "w")
hout = file("../../src/structDecls.h", "w")
rout = file("../../R/struct.R", "w")

cat('#include "RClang.h"\n\n\n', file = out)



done = invisible(lapply(tyStructs,
         function(x) {
           tmp = generateStructInterface(x, dc)
           writeCode(tmp, "native", out)
           writeCode(tmp, "header", hout)
           writeCode(tmp, "r", rout)
           tmp
         }))
close(out); close(hout); close(rout)

#generateStructInterface(tyStructs[["CXTranslationUnit"]])

