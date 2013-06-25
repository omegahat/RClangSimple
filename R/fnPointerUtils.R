
isFnPointer =
function(x)
{
  if(!isPointerType(x))
    return(FALSE)
  
  ty = getCanonicalType(getPointeeType(x))
  structure(ty$kind == CXType_FunctionProto, names = NULL)
}


getFnPointerInfo =
function(field, toks = character())
{
  if(is(toks, "CXCursor"))
    toks = getCursorTokens(toks)
  
  ty = getCanonicalType(getPointeeType(field))
  params = getArgsType(ty)

  if(length(toks)) {
      # have to handle the return type if it is an Identifier
      # and not a Keyword.
      # Also, there may be no parameter names.
    
    w = which((names(toks) == "Identifier"))
    ok = toks[ w + 1L ]  %in% c(")", ",") 
    ids = (toks[w[ok]])[-1]
    if(length(ids) == length(params))
      names(params) = ids
  }
  
  structure(list(returnType = getResultType(ty),
                 params = params),
            class = "FunctionPointerInfo")
}
