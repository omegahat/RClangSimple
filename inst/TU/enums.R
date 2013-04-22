library(RGCCTranslationUnit)
tu = parseTU("cindex.c.001t.tu")
enums = getEnumerations(tu)
r.enums = resolveType(enums, tu)
if(FALSE) {
writeEnum("CXCursorKind", "../../R/cursorKind.R", enums = enums)
writeEnum("CXTypeKind", "../../R/CXTypeKind.R", enums = enums)
}

writeEnum =
function(id, filename = sprintf("%s.R", id), tu = NULL, def = enums[[id]], enums = getEnumerations(tu))
{
  if(file.info(filename)[1, "isdir"])
     filename = sprintf("%s/%s.R", filename, id)
  
  con = file(filename, "w")
  on.exit(close(con))
  r = resolveType(def, tu)
  tmp = r@values
  cat(id, "=", file = con)
  dput(r@values, con)
  cat("\n\n\n", file = con)
  cat(sprintf("`%s` = %d\n", names(tmp), tmp), file = con)
  filename
}
