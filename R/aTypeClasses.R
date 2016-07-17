TypeDefinition = setClass("TypeDefinition",  representation(name = "character", type = "CXType", def = "CXCursor"))

setClass("CompositionDefinition", representation(name = "character", fields = "list", def = "CXCursor"))

UnionDefinition = setClass("UnionDefinition", contains = "CompositionDefinition")
StructDefinition = setClass("StructDefinition", contains = "CompositionDefinition")
    
setClass("EnumerationDefinition",
          representation(values = "numeric",
                         type = "CXType",
                         name = "character",
                         def = "CXCursor"))
