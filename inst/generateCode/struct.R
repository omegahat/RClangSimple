
makeStructCode =
  # handle different inputs, i.e. not the StructDescription, but CXType, CXCursor
function(desc, name = desc$name[1], isOpaque = FALSE)
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

   list(r = makeRStructCode(desc, name, isOpaque),
        native = makeCStructCode(desc, name, isOpaque))

}


makeRStructCode = 
function(desc, name = desc$name[1], isOpaque = FALSE)
{
   fieldDefs = lapply(desc$fields, getRTypeName)
   classDef = sprintf("setClass('%s', representation(%s))",
                        name, paste(names(fieldDefs), sQuote(fieldDefs), sep = " = ", collapse = ", "))

   list(classDef= classDef,
        getMethod =  makeSetStructGetMethod(desc, name),
        setMethod =  makeSetStructSetMethod(desc, name),        
        constructor = makeRConstructor(desc, name))
}

makeFieldAccesorRoutineName =
function(name, op = "get")
   sprintf("R_%s_%s", name, op)  

makeFieldMethod =
function(desc, name, op = "get")
{
  code = c(sprintf(".fieldNames = c(%s)", paste(sQuote(names(desc)), collapse = ", ")),
           "if(!(name %in% .fieldNames))",
           sprintf("    stop(name, ' is not a field name for', '%s')", name),
           sprintf(".Call(sprintf('%s_%%s', name), x %s)",
                        makeFieldAccesorRoutineName(name, op),
                        if(op == "get") "" else ", value")
        )
}

makeRStructMethod =
function(desc, name, get = TRUE, ops = if(get) c("get", "$") else c("set", "$<-"))
{
  fun = RFunctionDefinition(character(), makeFieldMethod(desc, name, ops[1]), c("x", "name", if(!get) "value"))
  sprintf("setMethod('%s', %s,\n %s\n)\n",
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
function(desc, name, isOpaque)
{
     # $ method

}

