#
# fixMissingTemplateBaseClasses is the top-level entry point.
# It uses superClassByTokens() to determine the actual base class for those classes that appear not to have a base class.
# Then it calls fixTemplateBaseClass() for each of these
#
# fixTemplateBaseClass() creates the new base class description to put into the superClasses slot and
# returns the updated C++Class object
#    AND any new class description for that base class if it is not in the overall classes
# 
# isTemplateInherited


fixMissingTemplateBaseClasses =
    #
    # For some classes such as LLVM's MemTransferInst, there is no apparent base class
    # in the RCIndex AST. However, in the code there is a base class in the tokens
    #    public MemTransferBase < MemIntrinsic > 
    # To fill these in, we can use the cursor's tokens and try to parse the base class.
    # It is far from the ideal approach. But for now we will go with that.
    #
    # Returns an updated list of C++Class/TemplateC++Class objects with a list
    # in the superClasses slot for those that we found one or more "unidentified" base classes
    # Unike the other superClasses that have a non-empty list whose elements are CXCursor objects,
    # the superClasses slot of each class definition we update in this function
    # will also be a list, but each element will be a character vector of length giving the name of that base class.
function(k)
{
    nobase = sapply(k, function(x) length(x@superClasses)) == 0

    # need the namespace on the names
    newbase = sapply(k[nobase], function(x) superClassByTokens(x@def, list(), classes = k, asPair = TRUE, ns = ""))
    w = sapply(newbase, length) > 0
browser()
# Get data for looking at offline    
    # saveRDS(data.frame(class = names(newbase[w]),
    #                    decl = sapply(k[nobase][w], function(x) paste(getDeclPart(x@def), collapse = " ")),
    #                    newBase = I(newbase[w])), "SuperClassResults.rds")    
    
# tt = table(names(k))   
# table(tt[ names(k)[nobase][w] ])
#  1   2   3   4   6  12 
#118   4   1   3   1  11 

    tmp = mapply(function(x, y) {
        ans = try(fixTemplateBaseClass(x, y, k))
        if(length(ans) > 1) 
            k[[ names(k)[2] ]] <<- ans[[2]]

        ans[[1]]
        }, newbase[w], k[nobase][w])
#browser()    
    k[nobase][w] = tmp
    
    k
}


fixTemplateBaseClass =
    #
    #
    #
    # PassManager in IR/PassManager.h has nested templates
    # class PassManager : public PassInfoMixin<PassManager<IRUnitT, AnalysisManagerT, ExtraArgTs...>> {
    #
    #
function(sup, kl, classes)
{
    baseClass = classes[[ sup [[ 1 ]] ]]

    
    # determine whether the baseClass's own base/super class is determined by its template argument.
    # If it is, create the name for that new class (check if it is in classes)
    #
    isTempl = isInheritanceTemplated(baseClass, sup, classes)

if(kl@name %in% c("AtomicMemIntrinsic", "AtomicMemSetInst", "AtomicMemTransferInst", 
	    "MemIntrinsic", "MemSetInst", "MemTransferInst", "AnyMemIntrinsic", 
	    "AnyMemSetInst", "AnyMemTransferInst"))
    browser()
    
    
    kl@superClasses = structure(as.list(sup), names = gsub(" *<.*", "", sup))
    ans = list(kl)

    #XXX add the new class description if it is not in classes.
    
    ans
}


if(FALSE) {
    options(nwarning = 1000)
    w = sapply(k[nobase], isInheritanceTemplated)
    all(grepl("^dropping", names(warnings())))
    # All warnings are about dropping extra tokens.
    # Not all look like values after an '='
#XXX check which tokens are being dropped when no =     and from what class.
    wrn = names(warnings())

    # How to find from which classes the warnings about the template parameters come.
    w = sapply(k[nobase], function(x) tryCatch(isInheritanceTemplated(x), warning = function(err) print(x@name)))
}

isInheritanceTemplated =
    #
    # class is the
    # If the base class of this class depends on 
    #
    #  Given bclass1, does its super class depend on a template parameter defining 
    #  bclass1, or is the super class a regular class indepedent of the definition
    #  of bclass1?
    #
    # From the Mem..Intrinsic classes we examined, one approach to this is to 
    # use getDeclPart() to get the declaration of this bclass1. Then we separate
    # it into the super class and the qualifiers for bclass1 itself.
    #  LHS : RHS (super class)
    # If any of the template arguments from the LHS are referenced in the RHS
    # then the super class is templated for our purposes.
    #
    # e.g.  MemSetBase is defined as  template <class BaseCL> class MemSetBase : public BaseCL
    #
    # Tests
    #  stopifnot(isInheritanceTemplated(k$MemSetBase))    
    #  stopifnot(isInheritanceTemplated(k$MemIntrinsicBase))
    #  stopifnot(isInheritanceTemplated(k$MemIntrinsicBase) == FALSE)    
    #
    #
    #  nobase = sapply(k, function(x) length(x@superClasses)) == 0
    #  w = sapply(k[nobase], isInheritanceTemplated)
    #
    #  supRes = readRDS("SuperClassResults.rds")
    #  w = sapply(k[ supRes$class ] , isInheritanceTemplated)
    #  table(w)
    #
function(bclass1, name = bclass1@name, sup = superClassByTokens(bclass1, ns = ""), classes = NULL)
{

    if(length(classes) && name %in% names(classes))
        return(FALSE)
    
    tmpl = parseTemplateClass(bclass1)

    if(length(tmpl$rhs) && any(unlist(tmpl$templateParameters) %in% tmpl$rhs))
        return(TRUE)

#XXXX    if(grepl(sprintf("\\<.*%s\\>", name), paste(tmpl$rhs, collapse = " "))

    FALSE
}


parseTemplateClass = 
function(class)
{    
    decl =  getDeclPart(class)
    decl = fixCloseMultiTemplates(decl)
    #names disappear

    
    br = (decl == ":")
    if(!any(br)) {
        lhs = decl
        rhs = list()
    } else {
        lhs = decl[ 1:(which(br)[1] - 1L)]
        rhs = decl[ -(1:(which(br)[1])) ]
    }

    params = getTemplateParameters(lhs)
    list(lhs = lhs, rhs = rhs, templateParameters = params)
}

getTemplateParameters =
    # In llvm/ADT/ilist_node_base.h (#21)
    # template < > class ilist_node_base < false >
    # Empty template.

    #  IR/ValueMap.h,  ValueMap class. Nested template
    # template < typename KeyT , typename ValueT , typename Config = ValueMapConfig < KeyT >> class ValueMap
    # But note base class, i.e. : so could skip this for now higher up if necessary.
    #
    #  Note the tokens contain ">>" which is the two tokens at the end, but the opening <'s are separate.
    #
    #
    # WrapperFunctionHandler
    #
    #  template <typename WrapperFunctionImplT,
    #        template <typename> class ResultSerializer, typename... SPSTagTs>
    #   class WrapperFunctionHandlerHelper
    #    : public WrapperFunctionHandlerHelper<
    #                   decltype(&std::remove_reference_t<WrapperFunctionImplT>::operator()),
    #                   ResultSerializer, SPSTagTs...>
    # 
function(els)
{
    m =  match(c("<", ">"), els)
    if(all(is.na(m)) || (length(m) == 2 && m[1] == (m[2] - 1L)))
        return(list())

    nested = FALSE
    if(sum(els == "<") > 1) {
        # nested
#        browser()
        # Find the last > and then we can try to process the elements separate by ,
        # but could have an inner <> with < x, y>
        # e.g.,    <a, b, <x, y> >
        # so can't just cumsum on ,
        m[2] = max(which(els == ">"))
        nested = TRUE
    }


    els2 = els[seq(m[1] + 1L, m[2] - 1L, by = 1)]
    as.list(tapply(els2, cumsum(els2 == ","), mkTemplateArgument))
}

mkTemplateArgument =
    #
    # Handle typename ... SPSTagsTs
    #
    #
function(x)
{
    if(x[1] == ",")
        x = x[-1]

    if(length(x)  > 2)
        warning("dropping final ", length(x) - 2L,
                " token", if(length(x) > 3) "s" else "",
                " from template parameter: ", paste(x[-(1:2)], collapse = " "))
    
    # what about the 3-4 elements in
    #   typename Config = ValueMapConfig - discarding = ValueMapConfig
    structure(x[2], names = x[1])
}

fixCloseMultiTemplates =
    # nested
    # Fix  ">>"
function(els)
{
    w = grepl(">>", els, fixed = TRUE)
    tmp = as.list(els)
    tmp[w] = lapply(tmp[w], function(x) strsplit(x, "")[[1]])
    ans = unlist(tmp)
    # Need to get the names that give the type of element correct as
    # R has added the 1 2 etc.
    #names(ans) = gsub("[0-9]+$", "", names(ans))
    # or
    names(ans) = rep(names(tmp), sapply(tmp, length)) # unlist(lapply(tmp, names))
    ans
}



############

if(FALSE) {

    stopifnot(identical(superClassByTokens(k$AtomicMemSetInst, asPair = TRUE, ns = ""),
                        c(Identifier = "MemSetBase", Identifier = "AtomicMemIntrinsic")))

    stopifnot(identical(superClassByTokens(k$AtomicMemSetInst, asPair = TRUE),
                        c(Identifier = "llvm::MemSetBase", Identifier = "llvm::AtomicMemIntrinsic")))

    stopifnot(identical(superClassByTokens(k$AtomicMemSetInst),
                        "llvm::MemSetBase <llvm::AtomicMemIntrinsic>"))

    stopifnot(identical(superClassByTokens(k$AtomicMemSetInst, ns = ""),
                        "MemSetBase <AtomicMemIntrinsic>"))


    tut = createTU("tests/templateClass.cc")
    kt = getCppClasses(tut)
    superClassByTokens(kt$Foo)
    superClassByTokens(kt$Foo@def, asPair = TRUE)
    superClassByTokens(kt$Bar)
    # character()
}

getDeclPart =
function(x)
{
    if(is(x, "C++Class"))
        x = x@def
    toks = getCursorTokens(x)
    w = toks %in% c("{", ";")    
    if(!any(w))
        toks
    else
        toks[1:(which(w)[1])]
}



superClassByTokens =
    # was superClass2 initially.
    #
    # This uses the tokens to get the base class as text.
    # It does little interpretation. However, it does
    # substitute any template from the start of the class declaration/definition
    # that might be used in the base class. For example, see MemInstBase in LLVM.
    #
    # TODO
    # Handle more complex template cases in the base class, e.g. two parameters
    #  
    #  tut = createTU("~/GitWorkingArea/RClangSimple/tests/templateClass.cc"); kt = getCppClasses(tut)
    #  superClassByTokens(kt$Foo)
    #  superClassByTokens(kt$Foo@def, asPair = TRUE)
    #
    # When multiple template parameters, do we return a list with the base class name and the template parameters?
    # Return a list always when asPair = TRUE
    #
function(cur, none = character(), ns = getCursorNamespaceName(cur),
         classes = list(), asPair = FALSE,
         toks = getCursorTokens(cur))
{
    if(is(cur, "C++Class"))
        cur = cur@def

    # Find the tokens up to the body of the class ({) or the end of the declaration ;

    w = toks %in% c("{", ";")
    i = which(w)[1]
    if(is.na(i)) {
        return(none)
        # stop("no { or ; for ", getName(cur))
    }
    
    els = toks[seq_len(i)]

    # See if there is a base class, i.e.,  class : base class
    j = which(els == ":")
    if(length(j) == 0)
        return(none)

    els = els[ !( els %in% c("{", ";", "public", "private", "protected"))]

    els2 = els[-(1:j)]

   
    # Add the namespace prefix
    if(ns != "") {
        # XXX
        # Should match these names in a table of class definitions so can verify
        # they are in the same namespace
        # If given the list of C++Class and TemplateC++Class objects or the CXCursorNode
        # match the identifier to that list and query the namespace of the corresponding
        # elements.

        isId = (names(els2) == "Identifier" & !grepl("::", els2)) # could grepl on subset, but okay for now.
        
        ns = rep(ns, sum(isId))
        if(length(classes) && any(w <- (els2[isId] %in% names(classes)))) {
            # Maybe multiple matching classes for a give classname.

            nmatch = table(names(classes))[els2[isId][w]]
            if(any(nmatch > 1)) {
                warning('found more than one class named ', paste(els2[isId][w][nmatch > 1], collapse = " and "))
            }

            m = match(els2[isId][w], names(classes))           

            ns[w] = sapply(classes[ els2[isId][w] ], function(x) getCursorNamespaceName(x@def))
        }
        
        els2[isId] = sprintf("%s::%s", ns, els2[isId])
    }

    if(asPair) {
        #XXX
        # need to check which identifier is the template, i.e., between the < >
        # and make more general than the LLVM examples we are developing this with.

        isId = names(els2) %in% c("Identifier", "Keyword") # Keyword for int, double - see templateClass.cc
                                                           # what else does it match that we don't want ? XXX
        ans = els2[isId]
    } else {
        ans = paste(els2, collapse = " ")
        # Remove spaces before and after the < and > and between elements if there are 2 or more.
        ans = gsub(" ", "", ans)  # gsub(" >", ">", gsub("< ", "<", ans))
    }
    

    tmp = paste(els[1:j], collapse = " ")
    if(grepl(sprintf("^template < (typename|class).*> class %s", getName(cur)), tmp)) {

        #XXX See 17 examples from LLVM in TemplateCases_for_getSuperClassByTokens
        # and figure out what we should be doing for asPair.
        if(asPair) {
#      cat(paste(els, collapse = " " ), "\n")
#            browser() #XXX
            ans
        } else
            sprintf("<%s%s>",
                      ""#if(ns != "")  # Don't add the namespace here.
                        #    paste0(ns, "::")
                      , trimws(gsub(sprintf("^template < (typename|class) (.*)> class %s.*", getName(cur)), "\\1", tmp)))
    } else
        ans
}



if(FALSE) {
getCursorNamespace = 
function(cur)
{
    while(!is.null(cur) && getCursorKind(cur) != CXCursor_FirstInvalid) {
        if(getCursorKind(cur) == CXCursor_Namespace )
            return(cur)
        cur = getParent(cur)
    }

    NULL
}
} else {
   findCursorNamespace = findEnclosingNamespace =
   function(cur)
       findAncestorByKind(cur, CXCursor_Namespace)
}


findEnclosingClass =
function(cur)
     findAncestorByKind(cur, CXCursor_ClassDecl)

getCursorNamespaceName =
function(cur, ns = findEnclosingNamespace(cur))
{
    if(!is.null(ns))
        getName(ns)
    else
        ""
}


findAncestorByKind =
function(cur, kind)
{
    while(!is.null(cur) && getCursorKind(cur) != CXCursor_FirstInvalid) {
        if(getCursorKind(cur) %in% kind)
            return(cur)
        cur = getParent(cur)
    }

    NULL
}

findParentFunction =
function(cur, kind = c(CXCursor_FunctionDecl, CXCursor_CXXMethod))
        findAncestorByKind(cur, kind)
