getStructDef =
function(type, kids = children(tp))
{
  tp = getTypeDecl(getCanonicalType(type))
  id = getName(tp)
  
  fields = lapply(kids, function(x) x$type)
  names(fields) = lapply(kids, getName)
  structure(list(name = id, fields = fields, def = tp))
}



getDataStructures =
function(src, collector = genDataStructCollector())
{
   visitTU(as(src, "TU"), collector$update)
   getResults(collector)
}

