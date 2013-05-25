BasicKinds = CXTypeKind[3:24]

rdyncallMap = c(
  v = CXType_Void,
  B = CXType_Bool,
  C = CXType_Char_U,
  C = CXType_UChar,
  c = CXType_Char32,
  c = CXType_Char_S,
  S = CXType_UShort,
  I = CXType_UInt,
  J = CXType_ULong,
  L = CXType_ULongLong,
  s = CXType_Short,
  i = CXType_Int,
  l = CXType_Long,
  l = CXType_LongLong,
  f = CXType_Float,
  d = CXType_Double
)

makeType = 
function(ty)
{
   if(is(ty, "CXCursor"))
     ty = getType(ty)

   kind = getTypeKind(ty)
   
   if(kind %in% BasicKinds) {
     
      mapBasicKindToRdyncall(kind)

   } else if(kind == CXType_Pointer) {
     
     pty = getPointeeType(ty)
     if(getTypeKind(pty) == c(CXType_Char_S))
        "Z"
     else if((pk <- getTypeKind(pty)) %in% BasicKinds)
         sprintf("*%s", mapBasicKindToRdyncall(pk))
     else
         "p"
     
   } else if(kind == CXType_Typedef) {
     makeType(getCanonicalType(ty))
   }
}

makeSig = 
function(r)
{
   args = sapply(r@params, makeType)
   rtype = makeType(r@returnType)
   paste( paste(args, collapse = ""), rtype, sep = ")")
}

mapBasicKindToRdyncall =
function(kind)
{
  i = match(kind, rdyncallMap)
  if(is.na(i))
    stop("don't recognize that type")

  names(rdyncallMap)[i]
}
