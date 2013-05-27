# From RAutoGenRunTime: setClass("RC++Reference", representation(ref = "externalptr"))
setClass("ExternalReference", contains = "RC++Reference")
setClass("ClangReference", contains = "ExternalReference")

setClass("CXCursor", contains = "ExternalReference")
setClass("CXModule", contains = "ExternalReference")
setClass("CXIndex", contains = "ExternalReference")
setClass("CXTranslationUnit", contains = "ExternalReference")
setClass("TU", contains = "CXTranslationUnit")

setClass("CXType", contains = "ExternalReference")
setClass("CXFile", contains = "ExternalReference")
setClass("CXSourceRange", contains = "ExternalReference")
setClass("CXSourceLocation", contains = "ExternalReference")
setClass("CXSourceRange", contains = "ExternalReference")

setClass("CXDiagnostic", contains = "ExternalReference")
setClass("CXDiagnosticSet", contains = "ExternalReference")

setClass("CXComment", contains = "ExternalReference")

tmp = function(x, i, j, ...)
         getDiagnosticInSet(x, i - 1)

setMethod("[", c("CXDiagnosticSet", "numeric"), tmp)
setMethod("[", c("CXDiagnosticSet", "integer"), tmp)



setClass("AnonymousNativeElement", representation(def = "CXCursor"))
setClass("NativeElement", representation(name = "character"), contains = "AnonymousNativeElement")
setClass("NativeVariable",
           representation(name = "character", type = "CXType", qualifiers = "logical"), contains = "NativeElement")

setClass("FunctionDecl", representation(params = "list", returnType = "CXType"), contains = "NativeElement")

setClass("C++Class", representation(superClasses = "list", fields = "list", methods = "list"), contains = "NativeElement")
setClass("TemplateC++Class", representation(templateParams = "list"), contains = "C++Class")

setAs("NativeElement", 'CXCursor', function(from) from@def)



setAs("CXDiagnostic", "character",
      function(from)
         getDiagnosticSpelling(from))


setGeneric("getSpelling",
           function(x, ...)
             standardGeneric("getSpelling"))

setMethod("getSpelling", "CXDiagnostic",
            function(x, ...)
               getDiagnosticSpelling(x))

setMethod("getSpelling", "CXTranslationUnit",
            function(x, ...)
               getTranslationUnitSpelling(x))

setMethod("getSpelling", "CXType",
            function(x, ...)
               getName(x))
setMethod("getSpelling", "CXCursor",
            function(x, ...)
               getName(x))

setAs("CXCursor", "character",
      function(from)
         getName(from))

setAs("CXTranslationUnit", "character",
      function(from)
         getFileName(from))

setMethod("[[", c("CXCursor", "numeric"),
          function(x, i, j, ...)  {
            children(x)[[i]]
          })

# length of CXCursor is the number of children
setMethod("length", "CXCursor",
          function(x) {
            length(children(x))
          })


setMethod("show", "CXCursor",
          function(object) {
            cat(names(object$kind), paste(getCursorTokens(object), sep = " "),"\n")
          })


setMethod("$", "CXType",
          function(x, name) {
            if(name == "kind")
              getTypeKind(x)
            else if(name == "name")
              getName(x)
            else
              NULL
          })


# This looks like nonsense! And it capitalizes type names to, e.g. Int.
setAs("CXType", "character",
       function(from) {
          ty = getCanonicalType(from)
          if(getTypeKind(ty) == CXType_Pointer)
              return(sprintf("%s *", as(getPointeeType(ty), "character")))

          decl = getTypeDecl(ty)
          if(decl$kind == CXCursor_NoDeclFound || getTypeKind(decl) == CXType_Invalid)
            names(getTypeKind(ty))
          else
            getName(decl)
       })


setAs("CXType", "character",
      function(from)
         getName(from))

setAs("FunctionDecl", "CXSourceRange",
       function(from)
          as(as(from, "CXCursor"), "CXSourceRange"))



# Perhaps use a reference class for this.
setClass("Collector", representation(update = "function", results = "function"))

setGeneric("getResults",    function(x, ...)  standardGeneric("getResults"))
setMethod("getResults", "Collector",
            function(x, ...)
               x@results(...))



getCursorLinkage =
function(cur)
  .Call("R_clang_CXCursor_getCursorLinkage", as(cur, "CXCursor"))

getCursorLanguage =
function(cur)
  .Call("R_clang_CXCursor_getCursorLanguage", as(cur, "CXCursor"))

getCursorKind =
 function(cur)
  .Call("R_clang_CXCursor_getKind", as(cur, "CXCursor")  )

setMethod("$", "CXCursor",
           function(x, name) {
             if(name == "kind") {
                val = .Call("R_clang_CXCursor_getKind", x)
                asEnum(val, CXCursorKind, "CXCursorKind")
             } else if(name == "language") {
                val = .Call("R_clang_CXCursor_getCursorLanguage", x)
                asEnum(val, CXLanguageKind, "CXLanguageKind")
             } else if(name == "linkage") {
                val = .Call("R_clang_CXCursor_getCursorLinkage", x)
                asEnum(val, CXLinkageKind, "CXLinkageKind")
             } else if(name == "type") {
                .Call("R_clang_getCursorType", x)
             } else if(name == "cxxSpecifier") {
                val = .Call("R_clang_CXCursor_getCursorCXXAccessSpecifier", x)
                asEnum(val, CX_CXXAccessSpecifier, "CX_CXXAccessSpecifier")
             } else
                 stop("cannot access field ", name, " in a CXCursor") 
                # .Call("R_clang_CXCursor_getData", x)               
           })

setClass("Enum", representation(names = "character"), contains = "integer")
setClass("CXCursorKind", contains = "Enum")
setClass("CX_CXXAccessSpecifier", contains = "Enum")
setClass("CXLinkageKind", contains = "Enum")
setClass("CXLanguageKind", contains = "Enum")
setClass("CXCallingConv", contains = "Enum")
setClass("CXTokenKind", contains = "Enum")

asEnum =
function(val, defs, class)
{
  i = match(val, defs)
  if(is.na(i))
    stop("No matching value")

  ans = new(class, val)
  names(ans) = names(defs)[i]
  ans
}


setGeneric("getTypeKind",  
             function(type, ...)
               standardGeneric("getTypeKind"))

setMethod("getTypeKind", "CXType",
     function(type, ...)
           .Call("R_clang_getTypeKind", type))

setMethod("getTypeKind", "CXCursor",
     function(type, ...)
           getTypeKind(as(type, "CXType")))

setGeneric("getResultType",
            function(obj)
               standardGeneric("getResultType"))

setMethod("getResultType", "CXType",
            function(obj)
                 .Call("R_clang_getResultType", obj))


setMethod("getResultType", "CXCursor",
            function(obj)
                 .Call("R_clang_getCursorResultType", obj))


setGeneric("getTypeDecl", 
           function(obj, ...)
              standardGeneric("getTypeDecl"))

setMethod("getTypeDecl", "CXType",
          function(obj, ...)
            .Call("R_clang_getTypeDeclaration", obj))

setMethod("getTypeDecl", "ANY",
          function(obj, ...)
            getTypeDecl(as(obj, "CXType"), ...))

getTypeDeclaration = getTypeDecl

getPointeeType = 
function(obj) {
   if(!is(obj, "CXType"))
      stop("must be a CXType")
   
  .Call("R_clang_getPointeeType", obj)
}

setGeneric("getCanonicalType",
           function(obj, ...)
              standardGeneric("getCanonicalType"))

setMethod("getCanonicalType", "CXCursor",
          function(obj, ...) {
            getCanonicalType(as(obj, "CXType"), ...)
          })

setMethod("getCanonicalType", "CXType",
          function(obj, ...) {
            .Call("R_clang_getCanonicalType", obj)
          })


setGeneric("isDeclaration",
            function(x, ...)
              standardGeneric("isDeclaration"))

setGeneric("isExpression",
            function(x, ...)
              standardGeneric("isExpression"))


setGeneric("isStatement",
            function(x, ...)
              standardGeneric("isStatement"))

setGeneric("isTranslationUnit",
            function(x, ...)
              standardGeneric("isTranslationUnit"))

setGeneric("isUnexposed",
            function(x, ...)
              standardGeneric("isUnexposed"))


setGeneric("isPOD",
            function(x, ...)
              standardGeneric("isPOD"))

setGeneric("isVirtualBase",
            function(x, ...)
              standardGeneric("isVirtualBase"))

# i = ls("package:RCIndex", pattern = "^is")[-c(3,7)]
# cat(sprintf('setMethod("%s", "CXCursor",\n\t function(x, ...) %s(as(x, "CXCursorKind")))', i, i), sep = "\n")

setMethod("isDeclaration", "CXCursor",
	 function(x, ...) isDeclaration(as(x, "CXCursorKind")))
setMethod("isExpression", "CXCursor",
	 function(x, ...) isExpression(as(x, "CXCursorKind")))
setMethod("isStatement", "CXCursor",
	 function(x, ...) isStatement(as(x, "CXCursorKind")))
setMethod("isTranslationUnit", "CXCursor",
	 function(x, ...) isTranslationUnit(as(x, "CXCursorKind")))
setMethod("isUnexposed", "CXCursor",
	 function(x, ...) isUnexposed(as(x, "CXCursorKind")))


setMethod("isPOD", "CXCursor",
	 function(x, ...) isPOD(as(x, "CXType")))

setMethod("isVirtualBase", "CXCursor",
	 function(x, ...)
		.Call("R_clang_isVirtualBase", x))


#cat(sprintf('setMethod("%s", "CXCursorKind",\n\t function(x, ...)\n\t\t.Call("R_clang_%s", x))', i, i), sep = "\n")

setMethod("isDeclaration", "CXCursorKind",
	 function(x, ...)
		.Call("R_clang_isDeclaration", x))
setMethod("isExpression", "CXCursorKind",
	 function(x, ...)
		.Call("R_clang_isExpression", x))

setMethod("isStatement", "CXCursorKind",
	 function(x, ...)
		.Call("R_clang_isStatement", x))
setMethod("isTranslationUnit", "CXCursorKind",
	 function(x, ...)
		.Call("R_clang_isTranslationUnit", x))
setMethod("isUnexposed", "CXCursorKind",
	 function(x, ...)
		.Call("R_clang_isUnexposed", x))

setMethod("isPOD", "CXType",
	 function(x, ...)
		.Call("R_clang_isPOD", x))


#setOldClass("FunctionDecl")
setOldClass("RCallableFunctions")
setClass("RegistrationTable", contains = "character")

setClass("RCallFunctionTable", contains = "data.frame")

setClass("RDotCFunctionList", contains = "list")
setClass("RDotCFunctionCode", contains = "character")




          
