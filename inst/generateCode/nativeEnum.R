
#
# Generate the native code for an enum
#

# For a simple enum (not bitwise enum), we want to generate
# a routine that has a large switch statemnent with a case
# for each possible value. Each case sets the name (elName)
# Then we can can call a routine that creates the instance
#  R_makeEnum(value, elName,  className).
#

makeEnumConverter =
function(def, routineName = getEnumConvertRoutineName(def), prefix = character(), ...)
{
  funName = routineName
  
  toR = c(paste("SEXP", funName, "(",  getName(getCanonicalType(def@type)),  " val)"),
          "{",
          "const char *elName = NULL;",
          "SEXP klass, ans;")
  
  toR = c(toR, 
          c("switch(val) {",
	     sapply(names(def@values),
	              function(id) {
	                paste("   case ", id, ":\n           ",  "elName = \"",  id, "\";\n       break;", collapse = "\n", sep = "")
	              }),
            "    default:",
            '\telName = "?";',
	    "\t}\n\n"))


  className = getRTypeName(def@name)
  toR = c(toR,
               "#if defined(USE_S4_ENUMS)", "",
               "SEXP tmp;",
               paste('PROTECT(klass = MAKE_CLASS("',  className, '"));', sep = ""),
               'PROTECT(ans = NEW(klass));',
               "PROTECT(tmp = ScalarInteger(val));",    
               "SET_NAMES(tmp, mkString(elName));",    
               'ans = SET_SLOT(ans, Rf_install(".Data"), tmp);',
               "UNPROTECT(3);",
               "",   
               "#else",
               "",
               "PROTECT(ans = ScalarInteger(val));",    
               "SET_NAMES(ans, mkString(elName));",
               "PROTECT(klass = NEW_CHARACTER(2));",    
               paste("SET_STRING_ELT(klass, 0, mkChar(", dQuote(className), "));", sep = ""),
               'SET_STRING_ELT(klass, 1, mkChar("EnumValue"));',
               "SET_CLASS(ans, klass);",
               "UNPROTECT(2);",
               "",
               "#endif",
               "",
               "return(ans);")

  toR = c(toR, "\n}\n")
  
  CRoutineDefinition(funName, toR, 1)
}



getEnumConvertRoutineName =
function(def)
{
  sprintf("Renum_convert_%s", gsub("enum ", "", getName(getCanonicalType(def@type))))
}  
