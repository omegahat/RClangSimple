#setClass("TypeDefinition",           representation(type))
setClass("EnumerationDefinition",
          representation(values = "numeric",
                         type = "CXType",
                         name = "character"))
