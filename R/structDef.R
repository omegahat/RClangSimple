getStructDef =
function(type, kids = children(tp), class = "StructDefinition" )  # XXX compute whether union or not.
{
  if(!is(type, "CXType") && !is(type, "CXCursor"))
     stop("need a CXType or CXCursor")
  
  tp = getTypeDecl(getCanonicalType(type))
  id = c(name = getName(type), canonicalName = getName(tp))
  
  fields = lapply(kids, function(x) x$type)
  names(fields) = lapply(kids, getName)
#  structure(list(name = id, fields = fields, def = tp),
#            class = "StructDescription")

  
  new(class, name = id, fields = fields, def = tp)
}




getDataStructures =
function(src, fileFilter = character(), collector = genDataStructCollector(), ...)
{
   if(is.character(src))
     src = createTU(src, ...)
   
   visitTU(as(src, "CXTranslationUnit"), collector@update)
   ans = getResults(collector)
   if(length(fileFilter))
      ans [ filterByFilenames(ans, fileFilter)  ]
   else
      ans
}

