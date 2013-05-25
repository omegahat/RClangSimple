Indent = "   "
makeEnumDef =
function(def, name = def@name, decl = getName(def@type))
{
  name;decl
  if(is(def, "EnumerationDefinition"))
    def = def@values

  def = def[!duplicated(def)]

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
function(def, name = def@name, bitwise = FALSE, superClass = if(bitwise) "BitwiseValue" else "EnumValue", prefix = NA)
{
  classDef = sprintf('setClass("%s", contains = "%s")', name, superClass)
  
  c(classDef, "",
    sprintf("%sValues = structure(c(%s), .Names = c(%s))",
         name, paste(def@values, "L", sep = "", collapse = ", "),  paste(sQuote(names(def@values)), collapse = ", ")),
    "",
    if(bitwise)
       makeBitwiseEnumValues(def, name)
    else
       sprintf("%s = %dL", names(def@values), as.integer(def@values)),

    "",

    makeEnumCoerce(def, name, bitwise, prefix = prefix)
    
    )
}

makeBitwiseEnumValues =
function(def, className = def@name)
{
 c(sprintf("%s = BitwiseValue(%dL, '%s', class = '%s')",
            names(def@values), def@values, def@values, className))
   
}


makeEnumCoerce =
function(def, name = def@name, bitwise = FALSE, prefix = NA)
{
  prefix = if(length(prefix) > 1)
             sprintf("c(%s)", paste(sQuote(prefix),  collapse = ", "))
           else if(!is.na(prefix))
             sQuote(prefix)
           else
              prefix

 cvtCode = 
         sprintf('as%sValue(from, %sValues, "%s", prefix = %s)', if(bitwise) "Bitwise" else "Enum", name, name, prefix)
              
 sprintf(' setAs("%s", "%s", function(from) %s )', c("character", "integer", "numeric"), name, cvtCode)
}

sQuote =
function(x)
   sprintf("'%s'", x)
