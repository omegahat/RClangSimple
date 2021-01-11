getEnums =
function(src, fileFilter = character(), visitor = genEnumCollector(), ...)
{
  if(is.character(src))
     src = createTU(src, ...)

  visitTU(as(src, "CXTranslationUnit"), visitor$update)
  e = visitor$enums()

  if(length(fileFilter) != 0)
     e [ filterByFilenames(e, fileFilter) ]
  else
     e
}


if(FALSE) {
genEnumCollector =
function()
{
  vars = list()

  update = function(cur, parent) {
     if(cur$kind != CXCursor_EnumDecl)
        return(CXChildVisit_Recurse)

     id = getName(cur)

     vars[[id]] <<- sapply(children(cur), getName)
     CXChildVisit_Recurse
  }

  list(update = update, enums = function() vars)
}
}

genEnumCollector =
function()
{
  enums = list()
  curDef = integer()
  type = NULL
  curName = NA
  cursor = NULL
  
  flush = 
    function() {
       if(length(curDef)) {
          if(is.na(curName) || curName == "")
            curName = length(enums) + 1
          enums[[curName]] <<- new("EnumerationDefinition", values = curDef, type = type, name = curName, def = cursor)
       }
       curDef <<- integer()
       curName <<- NA
       type <<- NULL
       cursor <<- NULL
    }

  doStop = FALSE
  
  update = 
   function(cur, parent)  {
     kind = getCursorKind(cur)

     if(kind == CXCursor_EnumDecl) {
        flush()
        curName <<- getName(cur) # get the name for the enum.
        type <<- getType(cur)
        cursor <<- cur
        
        if(is.na(curName) || curName == "")
            curName <<- getName(type)
        
     } else if(kind == CXCursor_EnumConstantDecl) {
          # allow for repeats, e.g.  A, B = A,
          # also pick up from the last value.
          # Also allow for explicit numbering

       val = if(length(curDef)) curDef[length(curDef)] + 1L else 0L
       toks = getCursorTokens(cur)

       if(length(toks) && toks[length(toks)] %in%  c(",", "}"))
           toks = toks[ - length(toks)]
       
       if(length(toks) > 2) {
          if( any(names(toks[-1]) == "Identifier") && length(toks) == 3) {
             val = toks[-1]["Identifier"]
             val = curDef[val]
          } else if( any(names(toks[-1]) == "Literal") && length(toks) == 3) {  
                  #XXX Need to handle 1L << 0 or whatever
                  # remove the L at the end of a literal.
             val = as.integer(gsub("L$", "", toks[-1]["Literal"]))
          } else if( "Keyword" %in% names(toks)) {
             tmp = toks["Keyword"]
             i = match(tmp, c("false", "true"))
             if(!is.na(i))
               val = i - 1L
             else {
               warning(paste("don't understand this enum setting yet:", paste(toks, collapse = " ")))
               val = NA
             }
          } else {
              if(any ( i <- toks == "=" ))
                 toks = toks[-(1:which(i)[1])]

              toks = toks[ names(toks) != "Comment" ]

              if(length(toks) > 2 && toks[1] == "(" && toks[length(toks)] == ")")
                  toks = toks[ -c(1, length(toks)) ]

                    # now hopefully we just have the tokens in an expression
               if(length(toks) == 3) {
                   val = enumExpr(toks, curDef, enums)
               } else if(length(toks) == 2) {
                   val = getEnumValue(toks[2], curDef)
                   val = switch(toks[1],
                                 "-" = -val,
                                 "~" = bitTilde(val),
                                 "^" = bitXor(val),
                                 val)

               } else if(length(toks) == 1) {
                   val = getEnumValue(toks, curDef)
               } else {
                   val = computeEnumExpr(toks, curDef, enums)
#                  if(any(grepl("owner_read", toks)))  recover()
                   if(is.na(val)) {
                     warning(paste("don't understand this enum yet:", paste(toks, collapse  = " ")))
                     val = NA
                  }
               }
         }
       } else if(length(toks) == 1 && names(toks) == "Identifier" && length(cur) == 1) {
              # This arises in LLVM with macros of the form
              #   FOO(value, name)  expanding to name = value
              # but clang representing this as name with value as a child.
          val <- as.integer(getCursorTokens(cur[[1]])["Literal"])
       }
       curDef[ getName( cur ) ] <<- val
     } else if(doStop) {
         stop("enum value not processed by current code")
#cat(names(cur$kind), getName(cur), "\n")
#if(cur$kind == CXCursor_FirstExpr) print(getTypeKind(cur$type))
#  doStop <<- FALSE
#            browser()
     }

     CXChildVisit_Recurse
  }
  
  list(update = update, enums = function() { flush(); enums})
}

computeEnumExpr =
    # For more than 3 tokens
function(toks,  values, enums = list())
{
  # assuming operators between terms
  e =  toks[1:3]
  rest = toks[-(1:3)]
  val = enumExpr(e, values, enums)
  while(length(rest)) {
     if(is.na(val))
        return(val)
     val = enumExpr( c(val, rest[c(1, 2)]), values, enums)
     rest = rest[-c(1, 2)]
  }
  val
}

getEnumValue =
function(a, values)
{
  if(a %in% names(values))
     return(values[a])

  if(grepl("^0x", a)) 
    return(convertHex(a))
  
  if(grepl("[UL]$", a))
     a = gsub("[UL]$", "", a)

  as.integer(a)
}

convertHex =
function(a)
{
    a = gsub("^0x", "", a)
    hex = structure(0:15, names = c(0:9, LETTERS[1:6]))
    els = strsplit(a, "")[[1]]
    as.integer(sum(16^rev(seq(0, length = length(els))) * hex[els]))
}

lookupEnumValue =
    #
    # Try to find the symbolic name in the current set of enum constants being processed
    # But if not there, look through all the other enums as it might be used across sets of enums.
    #
function(tok, enumSet, allEnums)
{
    val = getEnumValue(tok, enumSet)
    if(!is.na(val))
        return(val)

    w = sapply(allEnums, function(x) tok %in% names(x@values))
    if(!any(w)) {
        warning("cannot find enum value for ", tok)
        return(NA)
    }

    vals = lapply(allEnums[w], function(x) x@values[tok])
    if(length(unique(unlist(vals))) != 1) {
        warning("found more than one enum value for ", tok)
        return(NA)
    }

    vals[[1]]
}

enumExpr =
function(toks, curDef, tuEnums)
{
  if(length(toks) > 3) {
        #   stop("not there yet")
     return(computeEnumExpr(toks, curDef, tuEnums))
  }


  vals = sapply(toks[c(1, 3)], lookupEnumValue, curDef, tuEnums)
  
  if(toks[2] == "<<") {
    bitShift(vals[1], vals[2])
  } else if(toks[2] == "::") {
        # want to look this up in the entire collection of enums.
      if(! (toks[1] %in% names(tuEnums)) ) {
         warning("don't understand enum term ", paste(toks[1], collapse = " "))
         return(NA)
      }
      def = tuEnums[[ toks[1] ]]
      def[toks[3]]
  } else {
#    get(toks[2], mode = "function")(vals[1], vals[2])
     fun = switch(toks[2], "|" = bitOr, "&" = bitAnd)
     if(is.null(fun)) {
        warning("don't understand the operator ", toks[2], " yet")
        NA
     } else
        fun(vals[1], vals[2])
  }
}

bitShift =
function(x, y)
{
   if(x == 1) {
       if(y > 30)
         2L^y
       else
         as.integer(2L^y)
   } else 
       as.integer(bitShiftL(x, y))
}


bitTilde =
function(val)
{
    if(val == 0)
        -1L
    else {
        warning("not processing value for ~ ", val)
        NA
    }
}

    
