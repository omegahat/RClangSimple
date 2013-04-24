#setClass("TypeDefinition",           representation(type))
setClass("EnumerationDefinition",
          representation(values = "integer",
                         type = "CXType",
                         name = "character"))
