getStructDef =
function(type, kids = children(tp))
{
  if(!is(type, "CXType") && !is(type, "CXCursor"))
     stop("need a CXType or CXCursor")
  
  tp = getTypeDecl(getCanonicalType(type))
  id = c(name = getName(type), canonicalName = getName(tp))
  
  fields = lapply(kids, function(x) x$type)
  names(fields) = lapply(kids, getName)
  structure(list(name = id, fields = fields, def = tp),
            class = "StructDescription")
}



getDataStructures =
function(src, collector = genDataStructCollector(), ...)
{
   if(is.character(src))
     src = createTU(src, ...)
   
   visitTU(as(src, "CXTranslationUnit"), collector@update)
   getResults(collector)
}

