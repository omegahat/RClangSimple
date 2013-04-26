Indent = "   "
makeEnumDef =
function(def, name, decl = name)
{

  c("SEXP",
    sprintf("Renum_convert_%s(%s val)",  name, decl),
    "{",
    "const char *elName;",
    "switch(val) {",
    sprintf('%scase %s:\n\telName = "%s";\n\tbreak;', Indent, names(def), names(def)),
    paste(Indent, "default:", sep = ""),
    '\telName = "?";',
    "}",
    sprintf('return(R_makeEnumValue(val, elName, "%s"));', name),
    "}")
}


makeEnumClass =
function(def, name)
{
  c(sprintf("%s = structure((%s) .Names = c(%s)",
         name, paste(def, "L", sep = "", collapse = ", "),  paste(sQuote(names(def)), collapse = ", ")),
    "",
    sprintf("%s = %d", names(def), as.integer(def))
    )
}


