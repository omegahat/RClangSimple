
isFunctionPointer = isFnPointer =
function(x)
{
  if(!isPointerType(x))
    return(FALSE)
  
  ty = getCanonicalType(getPointeeType(x))
  structure(ty$kind == CXType_FunctionProto, names = NULL)
}

if(FALSE) {
getFunctionPointerInfo = getFnPointerInfo =
function(field, toks = character(), useCanonical = FALSE)
{
  if(is(toks, "CXCursor"))
    toks = getCursorTokens(toks)
  

  ty = getPointeeType(field)
  if(useCanonical)
     ty = getCanonicalType(ty)
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
}


getFunctionPointerInfo = getFnPointerInfo =
function(field, cur = NULL,
         toks = if(!is.null(cur))
                   sapply(children(cur), getCursorTokens),
         useCanonical = FALSE)
{

  ty = getPointeeType(field)
  if(useCanonical)
     ty = getCanonicalType(ty)
  params = getArgsType(ty)

  retType = getResultType(ty)
  if(length(toks)) {
      # have to handle the return type if it is an Identifier
      # and not a Keyword.
      # Also, there may be no parameter names.

    if(length(toks) != length(params))
      toks = toks[ seq(along = params) + 1L]

    ids = mapply(getParamName, toks, params)
    if(!all(is.na(ids)))
      names(params) = ids
  }
  
  structure(list(returnType = retType,
                 params = params),
            class = "FunctionPointerInfo")
}

getParamName =
function(toks, type)
{
  i = grep(",|\\)", toks)
  if(length(i))
    toks = toks[1:(i-1)]
  
  w = which(names(toks) == "Identifier")
  if(length(w) == 0)
    return(NA)

  ans = toks[w][length(w)]
  if(getName(type) == ans)
    NA
  else
    ans
    
}

