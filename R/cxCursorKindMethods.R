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
