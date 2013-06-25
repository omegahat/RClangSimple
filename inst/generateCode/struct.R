
makeStructCode =
  # handle different inputs, i.e. not the StructDescription, but CXType, CXCursor
function(desc, name = desc$name[1], isOpaque = FALSE, typeMap = NULL)
{
   # generate  a class for both the Struct represented in R
   # and a C pointer to an instance.
   #
   # For the C pointer version, e.g. <name>Ref,
   #    we extend ExternalReference or RC++Reference
   #  + define $ and $<- operator functions to get/set fields in it
   #    corresponding field set/get routines
   #    constructor routine - that allocates an instance and populates (some) of the fields
   #       add a finalizer, optionally
   #    finalizer callable directly from R.
   #    routine to copy the ref to an R object of class <name>
   #    clone/duplicate routine
  
   #   a coercion method from the Struct class to the Ref type and vice versa
  
   # For the R version,
   #   + define a class with a slot for each field
   #   +  a constructor function
   #
   # 
   #     

   list(r = makeRStructCode(desc, name, isOpaque, typeMap),
        native = makeCStructCode(desc, name, isOpaque, typeMap))

}


makeRStructCode = 
function(desc, name = desc$name[1], isOpaque = FALSE, typeMap = NULL)
{
   fieldDefs = lapply(desc$fields, getRTypeName, typeMap = typeMap)
   classDef = sprintf("setClass('%s', representation(%s))",
                        name, paste(names(fieldDefs), sQuote(fieldDefs), sep = " = ", collapse = ", "))


   ptrClassDef = sprintf("setClass('%sPtr', contains = 'RC++StructReference')", name)
   
   list(classDef= classDef,
        ptrClassDef = ptrClassDef,
        getMethod =  makeRStructMethod(desc$fields, name),
        setMethod =  makeRStructMethod(desc$fields, name, FALSE),        
        constructor = makeRConstructor(desc, name),
        namesMethod = makeNamesMethod(desc, desc$fields, name))
}

makeFieldAccessorRoutineName =
function(name, op = "get")
   sprintf("R_%s_%s", name, op)  

makeFieldMethod =
function(desc, name, op = "get")
{
  code = c(sprintf(".fieldNames = c(%s)", paste(sQuote(names(desc)), collapse = ", ")),
           "if(is.na( i <- pmatch(name, .fieldNames)))",
           sprintf("    stop(name, ' is not a field name for', '%s')", name),
           sprintf(".Call(sprintf('%s_%%s', .fieldNames[i]), x %s)",
                        makeFieldAccessorRoutineName(name, op),
                        if(op == "get") "" else ", value")
        )
}

makeRStructMethod =
function(desc, name, get = TRUE, ops = if(get) c("get", "$") else c("set", "$<-"))
{
  fun = RFunctionDefinition(character(), makeFieldMethod(desc, name, ops[1]), c("x", "name", if(!get) "value"))
  sprintf("setMethod('%s', '%s',\n %s\n)\n",
            ops[2L], name, as(fun, "character"))
}


makeRConstructor =
function(desc, name = desc$name[1])
{
   if(is(desc, "CXCursor"))
      desc = getStructDef(desc)
   
   coerceCode = mapply(function(f, id)
                         makeCoerceArg(name = id, type= f),
                        desc$fields, names(desc$fields))
   set = sprintf("if(!missing(%s))\n       .ans@%s = %s",
                     names(desc$fields), names(desc$fields),
                      coerceCode)
 
  
   code = c("if(is.character(.ans))",
            "   .ans = new(.ans)",
            "",
            set,
            "",
            ".ans")
     
    RFunctionDefinition(name, code, c(names(desc$fields), ".ans"), defaults = c(.ans = sprintf("new('%s')", name)))
}


makeCStructCode =
function(desc, name, isOpaque, typeMap = NULL)
{
     # $ method
  list(getAccessors = mapply(makeCStructFieldAccessor, names(desc$fields), desc$fields, name),
       setAccessors = mapply(makeCStructFieldAccessor, names(desc$fields), desc$fields, name, FALSE))       
       

}

makeCStructFieldAccessor =
function(fieldName, type, structName, get = TRUE, typeMap = NULL)
{
  fnName = sprintf("%s_%s", makeFieldAccessorRoutineName(structName, if(get) "get" else "set"), fieldName)
  if(get) {
    ans = convertValueToR(type, sprintf("obj->%s", fieldName), typeMap = typeMap)
    if(!( is(ans, "AsIs") || length(ans)  > 1))
       ans = sprintf("r_ans = %s;", ans)
  }
  
  code = c("SEXP",
    sprintf("%s(SEXP r_obj%s)", fnName, if(get) "" else ", SEXP r_value"),
    "{",
    "SEXP r_ans = R_NilValue;",
    sprintf("%s * obj = (%s *) getRReference(r_obj);", structName, structName),
    if(get) {
      ans
    } else {
      c(makeLocalVar(, "r_value", "value", type),
        sprintf("obj->%s = value;", fieldName))
    },
    "return(r_ans);",
    "}"
   )
   CRoutineDefinition(fnName, code)
}


makeCCopyStructCode =
function(desc, funName = sprintf("R_copyStruct_%s", gsub("struct ", "", getName(desc$def))), typeMap = NULL)
{

  copyFields =  mapply(function(f, name) {
                          v = convertValueToR(f, sprintf("obj->%s", name), typeMap = typeMap)
                          v[length(v)] = sprintf('SET_VECTOR_ELT(r_ans, i, %s);', gsub(";$", "", v))
                          a = if(length(v) > 1) 
                               c("{",
                                 v,
                                "}")
                                else
                                 v

                            c(a, sprintf('SET_STRING_ELT(r_names, i++, mkChar("%s"));', name))
                       },
                       desc$fields, names(desc$fields))
  nfields = length(desc$fields)
  sig = sprintf("%s(%s *obj)", funName, getName(getCanonicalType(desc$def)))
  code = c("SEXP",
            sig,
           "{",
           "int i = 0;",
           "SEXP r_ans, r_names;",
           sprintf("PROTECT(r_ans = NEW_LIST(%d));", nfields),
           sprintf("PROTECT(r_names = NEW_CHARACTER(%d));", nfields),    
           unlist(copyFields),
           "SET_NAMES(r_ans, r_names);",
           "UNPROTECT(2);",
           "return(r_ans);",
           "}")
  

  
  CRoutineDefinition(funName, code)
}



makeNamesMethod =
function(desc, fields = desc$fields, name = desc$name[1])
{

   code = c("setMethod('names', '%s',\nfunction(x)\n c(%s))" ,
                 name,
                 paste(sQuote(names(fields)), collapse = ", "))
 
}
