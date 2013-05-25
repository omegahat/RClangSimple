isSEXP =
  # Determine if the specified parameter is a SEXP
  # in the R sense.
function(param, quick = TRUE)
{
    # quick means we just check the name of the typedef
 if(quick && getName(getTypeDecl(param)) == "SEXP")
   return(TRUE)

      # otherwise drill through and check it is a pointer
      # to a SEXPREC record.
  ty = getCanonicalType(param)
  if(getTypeKind(ty) != CXType_Pointer)
     return(FALSE)

  tt = getPointeeType(ty)
  d = getTypeDecl(tt)
  getName(d) == "SEXPREC"
}


isDotCall =
   # Does the function/routine have a signature
   # consistent with a .Call() invocation, i.e.
   # returns a SEXP and takes only SEXPs
function(fun)
{
  if(length(fun$params) > 0 && !all(sapply(fun$params, isSEXP)))
    return(FALSE)

  isSEXP(fun@returnType)
}


isDotCParamType =
  # Is the parameter consistent with a .C() parameter
  # i.e. a pointer to one of an int, char *, double, void.
function(param)
{
  ty = getCanonicalType(param)  
  if(getTypeKind(param) != CXType_Pointer)
     return(FALSE)

  tt = getPointeeType(ty)
  k = getTypeKind(tt)
  if(k %in% c(CXType_Double, CXType_Int, CXType_Void))
    return(TRUE)

  # now check for char **
  if(k != CXType_Pointer)
    return(FALSE)

  getTypeKind(getPointeeType(tt)) == CXType_Char_S
}

isDotC =
  # Does the function have a signature that allows it
  # to be invoked via a .C() call.
function(fun)
{
  getTypeKind(fun@returnType) == CXType_Void &&
       all(sapply(fun@params, isDotCParamType))

}


getCallableRoutines =
function(dir, src = list.files(dir, pattern = "\\.(c|cpp|cxx|C)$", full.names = TRUE),
          args = sprintf("-I%s/include", R.home()), ...,
          verbose = TRUE)
{
#  col = genFunctionCollector()

  funs = list()
  for(i in src) {
    col = genFunctionCollector()    
     if(verbose)
        cat(i, "\n")
     parseTU(i, col$update, args = args, ..., clone = TRUE)
     where = sapply(col$funcs(), function(x) getFileName(x$def))
     funs = c(funs, col$funcs()[where == i])
  }

 # funs = col$funcs()

  if(length(funs) == 0)
    return(structure(list(), class = "RCallableFunctions"))
  
  type = sapply(funs, getRFuncType)
  funs = funs[!is.na(type)]
  tmp = split(funs, type[!is.na(type)])
  if("Call" %in%  names(tmp))
    tmp$Call = new("RCallFunctionTable",
                         data.frame(sym = names(tmp$Call),
                                    nargs = sapply(tmp$Call, function(x) length(x$params))))

  if("C" %in% names(tmp))
     tmp$C = new("RDotCFunctionList", tmp$C)
  
  structure(tmp, class = "RCallableFunctions")
}

getRFuncType =
function(fun)
{
   if(isDotC(fun))
      "C"
   else if(isDotCall(fun))
      "Call"
   else
      NA
}

makeDotCallRegistration =
      function(from) {
        paste(c("static R_CallMethodDef CallEntries[] = {",
                 sprintf('     {"%s", (DL_FUNC) &%s, %d},',
                     as.character(from$sym),
                     as.character(from$sym),
                     from$nargs),
                  "     {NULL, NULL, 0}",
                  "};"), collapse = "\n")
      }

setAs("RCallFunctionTable", "character",    makeDotCallRegistration)

       

setAs("RCallableFunctions", "RegistrationTable",
       function(from) {

         new("RegistrationTable",
             c(C = as(from$C, "character"),
               Call = as(from$Call, "character")))

       })

makeDotCRegistration =
function(from) { # from is a list of functions
         els = mapply(getDotCSignature, from, names(from), SIMPLIFY = FALSE)
         c(paste(sapply(els, `[[`, "typeDecl"), collapse = "\n"), "\n",
           paste(c("static const R_CMethodDef CEntries[] = {",
                   paste("    ", sapply(els, `[[`, "decl"), collaspe = ",", sep = ""),
                  "     {NULL, NULL, 0}",                                        
                   "}"), collapse = "\n"))
      }

setAs("RDotCFunctionList", "character",  makeDotCRegistration)


getDotCSignature =
function(fun, name)
{
  k = sapply(fun$params, getDotCType)
  list(typeDecl = sprintf("static R_NativePrimitiveArgType %s_t[%d] = {%s};",
                              name, length(fun$params),
                              paste(k, collapse = ", ")),
       decl = sprintf('{"%s", (DL_FUNC) & %s, %d, %s_t}',
                        name, name, length(fun$params), name))
}

DotCTypes = c(INTSXP = CXType_Int, REALSXP = CXType_Double, EXTPTRSXP = CXType_Void)

getDotCType =
  #
  # Map the cursor to an R type, e.g. INTSXP, REALSXP, STRSXP to a string 
  #
function(cur)
{
   pty = getPointeeType(cur$type)
   
   i = match(getTypeKind(pty), DotCTypes)

   if(is.na(i))
      "STRSXP"
   else
      names(DotCTypes)[i]
}     


createRegistrationRoutine =
  # cat this with sep = "\n", e.g.,
  # cat(createRegistrationRoutine(a, "Pkg"), sep = "\n")
function(routines, pkg, id = sprintf("R_init_%s", pkg), useDynamic = TRUE)
{
  c(sprintf("void attribute_visible %s(DllInfo *dll)\n{", id),
    sprintf("   R_registerRoutines(dll, %s, %s, NULL, NULL);",
              if("C" %in% names(routines)) "CEntries" else "NULL",
              if("Call" %in% names(routines)) "CallEntries" else "NULL"),    
    sprintf("   R_useDynamicSymbols(dll, %s);", as.character(as.logical(useDynamic))),
    "}")
}



createRegistrationCode =
function(dir, pkg = dirname(dir),
          routines = getCallableRoutines(dir))
{
    c(as(routines, "RegistrationTable"), "",
      createRegistrationRoutine(routines, pkg))
    
}
