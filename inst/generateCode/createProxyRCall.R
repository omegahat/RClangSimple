# Taken from RGCCTranslationUnit and adapted.
#
# initialize  return value to something sensible.
# R_createRef() call should not have the struct
#
createProxyRCall =
  #
  # func = FunctionPointer
  # We are working with a C routine, but name it func for ease of reference
  #
  # functionVar  is the C expression that provides the R function to invoke
  # This might be a simple variable name referring to a "non-local" variable,
  # an expression such as vars->circle
  # 
  #  preamble is extra code that is inserted at the end of the declarations
  # This allows the caller to perform some local initializations, e.g. declare
  #  a variable that cases one of the parameter symbols to a particular type and 
  #  then we can use this to find the function later one.
  #

function(func, name, functionVar = paste("R", name, "function_var", sep = "_"),
          preamble = character(), typeMap = list())  
{
  if(length(names(func$params)) == 0)
     names(func$params) = paste("r", seq(along = func$params), sep = "")

  params = func$params
  
  w = sapply(params, isVoidType) # function(x) isVoidP(x@type))
  
  n = length(params[!w]) + 1
  
  if(!missing(functionVar) && any(w))
     fun = paste("(SEXP)", names(params)[which(w)[1]])
  else
     fun = functionVar

  
  isVoid = isVoidType(func$returnType)
      #XXX Merge if possible with the same sort of thing in derivedClass.R. Hardly worth it!!!!
  addParams =  sapply(names(params)[!w],
                       function(id)
                            paste("SETCAR(p,", convertValueToR(params[[id]], id, typeMap = typeMap), "); p = CDR(p);")
                      )

  declAns = if(!isVoid) gsub(";", " = 0;", getNativeDeclaration("ans", func$returnType))
            else character()

  convertAns = if(!isVoid)
                 convertRValue("ans", "r_ans", func$returnType, typeMap = typeMap) 
               else
                 character()
  
  txt = c(getNativeDeclaration("", func$returnType, addSemiColon = FALSE),
          paste(name, "(",
                   paste(sapply(names(func$params),
                                function(id) {
                                  if(isFnPointer(params[[id]]))
                                    return(character())

                                  getNativeDeclaration(id, params[[id]], addSemiColon = FALSE)
                                }), collapse = ", "), ")"))
                               

  test = paste("if(", fun, "== NULL ||", fun, "== R_NilValue)\n\t", if(isVoid) "return" else "return(ans)", ";")
  
  txt = c(txt,
    "{",
    "SEXP e, p, r_ans;",
    declAns, 
    "",   
    preamble,
    "",
    test,
    "",
    paste("PROTECT(p = e = allocVector(LANGSXP,", n, "));"),
    paste("SETCAR(p,", fun, "); p = CDR(p);"),
    "",
    addParams,
    "",
    "PROTECT(r_ans = Rf_eval(e, R_GlobalEnv));",
    convertAns,
    "UNPROTECT(2);",
    paste("return", if(!isVoid) "(ans)", ";"),
    "}")

   CRoutineDefinition(name, txt)
}
