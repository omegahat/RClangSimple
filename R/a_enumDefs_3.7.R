if(all(clangVersionNum(libclangVersion_Install) == c( 3 ,  7 ))) {


setClass("CXErrorCode", contains = "EnumValue")

CXErrorCode = CXErrorCodeValues = structure(c(0L, 1L, 2L, 3L, 4L), .Names = c('CXError_Success', 'CXError_Failure', 'CXError_Crashed', 'CXError_InvalidArguments', 'CXError_ASTReadError'))

`CXError_Success` = GenericEnumValue('CXError_Success', 0L, 'CXErrorCode')
`CXError_Failure` = GenericEnumValue('CXError_Failure', 1L, 'CXErrorCode')
`CXError_Crashed` = GenericEnumValue('CXError_Crashed', 2L, 'CXErrorCode')
`CXError_InvalidArguments` = GenericEnumValue('CXError_InvalidArguments', 3L, 'CXErrorCode')
`CXError_ASTReadError` = GenericEnumValue('CXError_ASTReadError', 4L, 'CXErrorCode')

 setAs("character", "CXErrorCode", function(from) asEnumValue(from, CXErrorCodeValues, "CXErrorCode", prefix = NA) )
 setAs("integer", "CXErrorCode", function(from) asEnumValue(from, CXErrorCodeValues, "CXErrorCode", prefix = NA) )
 setAs("numeric", "CXErrorCode", function(from) asEnumValue(from, CXErrorCodeValues, "CXErrorCode", prefix = NA) )


#####################################
setClass("CXAvailabilityKind", contains = "EnumValue")

CXAvailabilityKind = CXAvailabilityKindValues = structure(c(0L, 1L, 2L, 3L), .Names = c('CXAvailability_Available', 'CXAvailability_Deprecated', 'CXAvailability_NotAvailable', 'CXAvailability_NotAccessible'))

`CXAvailability_Available` = GenericEnumValue('CXAvailability_Available', 0L, 'CXAvailabilityKind')
`CXAvailability_Deprecated` = GenericEnumValue('CXAvailability_Deprecated', 1L, 'CXAvailabilityKind')
`CXAvailability_NotAvailable` = GenericEnumValue('CXAvailability_NotAvailable', 2L, 'CXAvailabilityKind')
`CXAvailability_NotAccessible` = GenericEnumValue('CXAvailability_NotAccessible', 3L, 'CXAvailabilityKind')

 setAs("character", "CXAvailabilityKind", function(from) asEnumValue(from, CXAvailabilityKindValues, "CXAvailabilityKind", prefix = NA) )
 setAs("integer", "CXAvailabilityKind", function(from) asEnumValue(from, CXAvailabilityKindValues, "CXAvailabilityKind", prefix = NA) )
 setAs("numeric", "CXAvailabilityKind", function(from) asEnumValue(from, CXAvailabilityKindValues, "CXAvailabilityKind", prefix = NA) )


#####################################
setClass("CXGlobalOptFlags", contains = "EnumValue")

CXGlobalOptFlags = CXGlobalOptFlagsValues = structure(c(0L, 1L, 2L, 3L), .Names = c('CXGlobalOpt_None', 'CXGlobalOpt_ThreadBackgroundPriorityForIndexing', 'CXGlobalOpt_ThreadBackgroundPriorityForEditing', 'CXGlobalOpt_ThreadBackgroundPriorityForAll'))

`CXGlobalOpt_None` = GenericEnumValue('CXGlobalOpt_None', 0L, 'CXGlobalOptFlags')
`CXGlobalOpt_ThreadBackgroundPriorityForIndexing` = GenericEnumValue('CXGlobalOpt_ThreadBackgroundPriorityForIndexing', 1L, 'CXGlobalOptFlags')
`CXGlobalOpt_ThreadBackgroundPriorityForEditing` = GenericEnumValue('CXGlobalOpt_ThreadBackgroundPriorityForEditing', 2L, 'CXGlobalOptFlags')
`CXGlobalOpt_ThreadBackgroundPriorityForAll` = GenericEnumValue('CXGlobalOpt_ThreadBackgroundPriorityForAll', 3L, 'CXGlobalOptFlags')

 setAs("character", "CXGlobalOptFlags", function(from) asEnumValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = NA) )
 setAs("integer", "CXGlobalOptFlags", function(from) asEnumValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = NA) )
 setAs("numeric", "CXGlobalOptFlags", function(from) asEnumValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = NA) )


#####################################
setClass("CXDiagnosticSeverity", contains = "EnumValue")

CXDiagnosticSeverity = CXDiagnosticSeverityValues = structure(c(0L, 1L, 2L, 3L, 4L), .Names = c('CXDiagnostic_Ignored', 'CXDiagnostic_Note', 'CXDiagnostic_Warning', 'CXDiagnostic_Error', 'CXDiagnostic_Fatal'))

`CXDiagnostic_Ignored` = GenericEnumValue('CXDiagnostic_Ignored', 0L, 'CXDiagnosticSeverity')
`CXDiagnostic_Note` = GenericEnumValue('CXDiagnostic_Note', 1L, 'CXDiagnosticSeverity')
`CXDiagnostic_Warning` = GenericEnumValue('CXDiagnostic_Warning', 2L, 'CXDiagnosticSeverity')
`CXDiagnostic_Error` = GenericEnumValue('CXDiagnostic_Error', 3L, 'CXDiagnosticSeverity')
`CXDiagnostic_Fatal` = GenericEnumValue('CXDiagnostic_Fatal', 4L, 'CXDiagnosticSeverity')

 setAs("character", "CXDiagnosticSeverity", function(from) asEnumValue(from, CXDiagnosticSeverityValues, "CXDiagnosticSeverity", prefix = NA) )
 setAs("integer", "CXDiagnosticSeverity", function(from) asEnumValue(from, CXDiagnosticSeverityValues, "CXDiagnosticSeverity", prefix = NA) )
 setAs("numeric", "CXDiagnosticSeverity", function(from) asEnumValue(from, CXDiagnosticSeverityValues, "CXDiagnosticSeverity", prefix = NA) )


#####################################
setClass("CXLoadDiag_Error", contains = "EnumValue")

CXLoadDiag_Error = CXLoadDiag_ErrorValues = structure(c(0L, 1L, 2L, 3L), .Names = c('CXLoadDiag_None', 'CXLoadDiag_Unknown', 'CXLoadDiag_CannotLoad', 'CXLoadDiag_InvalidFile'))

`CXLoadDiag_None` = GenericEnumValue('CXLoadDiag_None', 0L, 'CXLoadDiag_Error')
`CXLoadDiag_Unknown` = GenericEnumValue('CXLoadDiag_Unknown', 1L, 'CXLoadDiag_Error')
`CXLoadDiag_CannotLoad` = GenericEnumValue('CXLoadDiag_CannotLoad', 2L, 'CXLoadDiag_Error')
`CXLoadDiag_InvalidFile` = GenericEnumValue('CXLoadDiag_InvalidFile', 3L, 'CXLoadDiag_Error')

 setAs("character", "CXLoadDiag_Error", function(from) asEnumValue(from, CXLoadDiag_ErrorValues, "CXLoadDiag_Error", prefix = NA) )
 setAs("integer", "CXLoadDiag_Error", function(from) asEnumValue(from, CXLoadDiag_ErrorValues, "CXLoadDiag_Error", prefix = NA) )
 setAs("numeric", "CXLoadDiag_Error", function(from) asEnumValue(from, CXLoadDiag_ErrorValues, "CXLoadDiag_Error", prefix = NA) )


#####################################
setClass("CXDiagnosticDisplayOptions", contains = "EnumValue")

CXDiagnosticDisplayOptions = CXDiagnosticDisplayOptionsValues = structure(c(1L, 2L, 4L, 8L, 16L, 32L), .Names = c('CXDiagnostic_DisplaySourceLocation', 'CXDiagnostic_DisplayColumn', 'CXDiagnostic_DisplaySourceRanges', 'CXDiagnostic_DisplayOption', 'CXDiagnostic_DisplayCategoryId', 'CXDiagnostic_DisplayCategoryName'))

`CXDiagnostic_DisplaySourceLocation` = GenericEnumValue('CXDiagnostic_DisplaySourceLocation', 1L, 'CXDiagnosticDisplayOptions')
`CXDiagnostic_DisplayColumn` = GenericEnumValue('CXDiagnostic_DisplayColumn', 2L, 'CXDiagnosticDisplayOptions')
`CXDiagnostic_DisplaySourceRanges` = GenericEnumValue('CXDiagnostic_DisplaySourceRanges', 4L, 'CXDiagnosticDisplayOptions')
`CXDiagnostic_DisplayOption` = GenericEnumValue('CXDiagnostic_DisplayOption', 8L, 'CXDiagnosticDisplayOptions')
`CXDiagnostic_DisplayCategoryId` = GenericEnumValue('CXDiagnostic_DisplayCategoryId', 16L, 'CXDiagnosticDisplayOptions')
`CXDiagnostic_DisplayCategoryName` = GenericEnumValue('CXDiagnostic_DisplayCategoryName', 32L, 'CXDiagnosticDisplayOptions')

 setAs("character", "CXDiagnosticDisplayOptions", function(from) asEnumValue(from, CXDiagnosticDisplayOptionsValues, "CXDiagnosticDisplayOptions", prefix = NA) )
 setAs("integer", "CXDiagnosticDisplayOptions", function(from) asEnumValue(from, CXDiagnosticDisplayOptionsValues, "CXDiagnosticDisplayOptions", prefix = NA) )
 setAs("numeric", "CXDiagnosticDisplayOptions", function(from) asEnumValue(from, CXDiagnosticDisplayOptionsValues, "CXDiagnosticDisplayOptions", prefix = NA) )


#####################################
setClass("CXTranslationUnit_Flags", contains = "EnumValue")

CXTranslationUnit_Flags = CXTranslationUnit_FlagsValues = structure(c(0L, 1L, 2L, 4L, 8L, 16L, 32L, 64L, 128L), .Names = c('CXTranslationUnit_None', 'CXTranslationUnit_DetailedPreprocessingRecord', 'CXTranslationUnit_Incomplete', 'CXTranslationUnit_PrecompiledPreamble', 'CXTranslationUnit_CacheCompletionResults', 'CXTranslationUnit_ForSerialization', 'CXTranslationUnit_CXXChainedPCH', 'CXTranslationUnit_SkipFunctionBodies', 'CXTranslationUnit_IncludeBriefCommentsInCodeCompletion'))

`CXTranslationUnit_None` = GenericEnumValue('CXTranslationUnit_None', 0L, 'CXTranslationUnit_Flags')
`CXTranslationUnit_DetailedPreprocessingRecord` = GenericEnumValue('CXTranslationUnit_DetailedPreprocessingRecord', 1L, 'CXTranslationUnit_Flags')
`CXTranslationUnit_Incomplete` = GenericEnumValue('CXTranslationUnit_Incomplete', 2L, 'CXTranslationUnit_Flags')
`CXTranslationUnit_PrecompiledPreamble` = GenericEnumValue('CXTranslationUnit_PrecompiledPreamble', 4L, 'CXTranslationUnit_Flags')
`CXTranslationUnit_CacheCompletionResults` = GenericEnumValue('CXTranslationUnit_CacheCompletionResults', 8L, 'CXTranslationUnit_Flags')
`CXTranslationUnit_ForSerialization` = GenericEnumValue('CXTranslationUnit_ForSerialization', 16L, 'CXTranslationUnit_Flags')
`CXTranslationUnit_CXXChainedPCH` = GenericEnumValue('CXTranslationUnit_CXXChainedPCH', 32L, 'CXTranslationUnit_Flags')
`CXTranslationUnit_SkipFunctionBodies` = GenericEnumValue('CXTranslationUnit_SkipFunctionBodies', 64L, 'CXTranslationUnit_Flags')
`CXTranslationUnit_IncludeBriefCommentsInCodeCompletion` = GenericEnumValue('CXTranslationUnit_IncludeBriefCommentsInCodeCompletion', 128L, 'CXTranslationUnit_Flags')

 setAs("character", "CXTranslationUnit_Flags", function(from) asEnumValue(from, CXTranslationUnit_FlagsValues, "CXTranslationUnit_Flags", prefix = NA) )
 setAs("integer", "CXTranslationUnit_Flags", function(from) asEnumValue(from, CXTranslationUnit_FlagsValues, "CXTranslationUnit_Flags", prefix = NA) )
 setAs("numeric", "CXTranslationUnit_Flags", function(from) asEnumValue(from, CXTranslationUnit_FlagsValues, "CXTranslationUnit_Flags", prefix = NA) )


#####################################
setClass("CXSaveTranslationUnit_Flags", contains = "EnumValue")

CXSaveTranslationUnit_Flags = CXSaveTranslationUnit_FlagsValues = structure(c(0L), .Names = c('CXSaveTranslationUnit_None'))

`CXSaveTranslationUnit_None` = GenericEnumValue('CXSaveTranslationUnit_None', 0L, 'CXSaveTranslationUnit_Flags')

 setAs("character", "CXSaveTranslationUnit_Flags", function(from) asEnumValue(from, CXSaveTranslationUnit_FlagsValues, "CXSaveTranslationUnit_Flags", prefix = NA) )
 setAs("integer", "CXSaveTranslationUnit_Flags", function(from) asEnumValue(from, CXSaveTranslationUnit_FlagsValues, "CXSaveTranslationUnit_Flags", prefix = NA) )
 setAs("numeric", "CXSaveTranslationUnit_Flags", function(from) asEnumValue(from, CXSaveTranslationUnit_FlagsValues, "CXSaveTranslationUnit_Flags", prefix = NA) )


#####################################
setClass("CXSaveError", contains = "EnumValue")

CXSaveError = CXSaveErrorValues = structure(c(0L, 1L, 2L, 3L), .Names = c('CXSaveError_None', 'CXSaveError_Unknown', 'CXSaveError_TranslationErrors', 'CXSaveError_InvalidTU'))

`CXSaveError_None` = GenericEnumValue('CXSaveError_None', 0L, 'CXSaveError')
`CXSaveError_Unknown` = GenericEnumValue('CXSaveError_Unknown', 1L, 'CXSaveError')
`CXSaveError_TranslationErrors` = GenericEnumValue('CXSaveError_TranslationErrors', 2L, 'CXSaveError')
`CXSaveError_InvalidTU` = GenericEnumValue('CXSaveError_InvalidTU', 3L, 'CXSaveError')

 setAs("character", "CXSaveError", function(from) asEnumValue(from, CXSaveErrorValues, "CXSaveError", prefix = NA) )
 setAs("integer", "CXSaveError", function(from) asEnumValue(from, CXSaveErrorValues, "CXSaveError", prefix = NA) )
 setAs("numeric", "CXSaveError", function(from) asEnumValue(from, CXSaveErrorValues, "CXSaveError", prefix = NA) )


#####################################
setClass("CXReparse_Flags", contains = "EnumValue")

CXReparse_Flags = CXReparse_FlagsValues = structure(c(0L), .Names = c('CXReparse_None'))

`CXReparse_None` = GenericEnumValue('CXReparse_None', 0L, 'CXReparse_Flags')

 setAs("character", "CXReparse_Flags", function(from) asEnumValue(from, CXReparse_FlagsValues, "CXReparse_Flags", prefix = NA) )
 setAs("integer", "CXReparse_Flags", function(from) asEnumValue(from, CXReparse_FlagsValues, "CXReparse_Flags", prefix = NA) )
 setAs("numeric", "CXReparse_Flags", function(from) asEnumValue(from, CXReparse_FlagsValues, "CXReparse_Flags", prefix = NA) )


#####################################
setClass("CXTUResourceUsageKind", contains = "EnumValue")

CXTUResourceUsageKind = CXTUResourceUsageKindValues = structure(c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 14L, 1L, 14L, 1L, 14L), .Names = c('CXTUResourceUsage_AST', 'CXTUResourceUsage_Identifiers', 'CXTUResourceUsage_Selectors', 'CXTUResourceUsage_GlobalCompletionResults', 'CXTUResourceUsage_SourceManagerContentCache', 'CXTUResourceUsage_AST_SideTables', 'CXTUResourceUsage_SourceManager_Membuffer_Malloc', 'CXTUResourceUsage_SourceManager_Membuffer_MMap', 'CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc', 'CXTUResourceUsage_ExternalASTSource_Membuffer_MMap', 'CXTUResourceUsage_Preprocessor', 'CXTUResourceUsage_PreprocessingRecord', 'CXTUResourceUsage_SourceManager_DataStructures', 'CXTUResourceUsage_Preprocessor_HeaderSearch', 'CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN', 'CXTUResourceUsage_MEMORY_IN_BYTES_END', 'CXTUResourceUsage_First', 'CXTUResourceUsage_Last'))

`CXTUResourceUsage_AST` = GenericEnumValue('CXTUResourceUsage_AST', 1L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_Identifiers` = GenericEnumValue('CXTUResourceUsage_Identifiers', 2L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_Selectors` = GenericEnumValue('CXTUResourceUsage_Selectors', 3L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_GlobalCompletionResults` = GenericEnumValue('CXTUResourceUsage_GlobalCompletionResults', 4L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_SourceManagerContentCache` = GenericEnumValue('CXTUResourceUsage_SourceManagerContentCache', 5L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_AST_SideTables` = GenericEnumValue('CXTUResourceUsage_AST_SideTables', 6L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_SourceManager_Membuffer_Malloc` = GenericEnumValue('CXTUResourceUsage_SourceManager_Membuffer_Malloc', 7L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_SourceManager_Membuffer_MMap` = GenericEnumValue('CXTUResourceUsage_SourceManager_Membuffer_MMap', 8L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc` = GenericEnumValue('CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc', 9L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_ExternalASTSource_Membuffer_MMap` = GenericEnumValue('CXTUResourceUsage_ExternalASTSource_Membuffer_MMap', 10L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_Preprocessor` = GenericEnumValue('CXTUResourceUsage_Preprocessor', 11L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_PreprocessingRecord` = GenericEnumValue('CXTUResourceUsage_PreprocessingRecord', 12L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_SourceManager_DataStructures` = GenericEnumValue('CXTUResourceUsage_SourceManager_DataStructures', 13L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_Preprocessor_HeaderSearch` = GenericEnumValue('CXTUResourceUsage_Preprocessor_HeaderSearch', 14L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN` = GenericEnumValue('CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN', 1L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_MEMORY_IN_BYTES_END` = GenericEnumValue('CXTUResourceUsage_MEMORY_IN_BYTES_END', 14L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_First` = GenericEnumValue('CXTUResourceUsage_First', 1L, 'CXTUResourceUsageKind')
`CXTUResourceUsage_Last` = GenericEnumValue('CXTUResourceUsage_Last', 14L, 'CXTUResourceUsageKind')

 setAs("character", "CXTUResourceUsageKind", function(from) asEnumValue(from, CXTUResourceUsageKindValues, "CXTUResourceUsageKind", prefix = NA) )
 setAs("integer", "CXTUResourceUsageKind", function(from) asEnumValue(from, CXTUResourceUsageKindValues, "CXTUResourceUsageKind", prefix = NA) )
 setAs("numeric", "CXTUResourceUsageKind", function(from) asEnumValue(from, CXTUResourceUsageKindValues, "CXTUResourceUsageKind", prefix = NA) )


#####################################
setClass("CXCursorKind", contains = "EnumValue")

CXCursorKind = CXCursorKindValues = structure(c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 14L, 15L, 16L, 17L, 18L, 19L, 20L, 21L, 22L, 23L, 24L, 25L, 26L, 27L, 28L, 29L, 30L, 31L, 32L, 33L, 34L, 35L, 36L, 37L, 38L, 39L, 1L, 39L, 40L, 40L, 41L, 42L, 43L, 44L, 45L, 46L, 47L, 48L, 49L, 50L, 50L, 70L, 70L, 71L, 72L, 73L, 73L, 100L, 100L, 101L, 102L, 103L, 104L, 105L, 106L, 107L, 108L, 109L, 110L, 111L, 112L, 113L, 114L, 115L, 116L, 117L, 118L, 119L, 120L, 121L, 122L, 123L, 124L, 125L, 126L, 127L, 128L, 129L, 130L, 131L, 132L, 133L, 134L, 135L, 136L, 137L, 138L, 139L, 140L, 141L, 142L, 143L, 144L, 145L, 146L, 146L, 200L, 200L, 201L, 202L, 203L, 204L, 205L, 206L, 207L, 208L, 209L, 210L, 211L, 212L, 213L, 214L, 215L, 215L, 216L, 217L, 218L, 219L, 220L, 221L, 222L, 223L, 224L, 225L, 226L, 227L, 228L, 229L, 230L, 231L, 232L, 233L, 234L, 235L, 236L, 237L, 238L, 239L, 240L, 241L, 242L, 243L, 244L, 245L, 246L, 247L, 248L, 249L, 250L, 251L, 252L, 253L, 254L, 255L, 256L, 256L, 300L, 400L, 400L, 401L, 402L, 403L, 404L, 405L, 406L, 407L, 408L, 409L, 410L, 411L, 412L, 413L, 414L, 415L, 416L, 416L, 500L, 501L, 502L, 502L, 503L, 500L, 503L, 600L, 600L, 600L, 700L), .Names = c('CXCursor_UnexposedDecl', 'CXCursor_StructDecl', 'CXCursor_UnionDecl', 'CXCursor_ClassDecl', 'CXCursor_EnumDecl', 'CXCursor_FieldDecl', 'CXCursor_EnumConstantDecl', 'CXCursor_FunctionDecl', 'CXCursor_VarDecl', 'CXCursor_ParmDecl', 'CXCursor_ObjCInterfaceDecl', 'CXCursor_ObjCCategoryDecl', 'CXCursor_ObjCProtocolDecl', 'CXCursor_ObjCPropertyDecl', 'CXCursor_ObjCIvarDecl', 'CXCursor_ObjCInstanceMethodDecl', 'CXCursor_ObjCClassMethodDecl', 'CXCursor_ObjCImplementationDecl', 'CXCursor_ObjCCategoryImplDecl', 'CXCursor_TypedefDecl', 'CXCursor_CXXMethod', 'CXCursor_Namespace', 'CXCursor_LinkageSpec', 'CXCursor_Constructor', 'CXCursor_Destructor', 'CXCursor_ConversionFunction', 'CXCursor_TemplateTypeParameter', 'CXCursor_NonTypeTemplateParameter', 'CXCursor_TemplateTemplateParameter', 'CXCursor_FunctionTemplate', 'CXCursor_ClassTemplate', 'CXCursor_ClassTemplatePartialSpecialization', 'CXCursor_NamespaceAlias', 'CXCursor_UsingDirective', 'CXCursor_UsingDeclaration', 'CXCursor_TypeAliasDecl', 'CXCursor_ObjCSynthesizeDecl', 'CXCursor_ObjCDynamicDecl', 'CXCursor_CXXAccessSpecifier', 'CXCursor_FirstDecl', 'CXCursor_LastDecl', 'CXCursor_FirstRef', 'CXCursor_ObjCSuperClassRef', 'CXCursor_ObjCProtocolRef', 'CXCursor_ObjCClassRef', 'CXCursor_TypeRef', 'CXCursor_CXXBaseSpecifier', 'CXCursor_TemplateRef', 'CXCursor_NamespaceRef', 'CXCursor_MemberRef', 'CXCursor_LabelRef', 'CXCursor_OverloadedDeclRef', 'CXCursor_VariableRef', 'CXCursor_LastRef', 'CXCursor_FirstInvalid', 'CXCursor_InvalidFile', 'CXCursor_NoDeclFound', 'CXCursor_NotImplemented', 'CXCursor_InvalidCode', 'CXCursor_LastInvalid', 'CXCursor_FirstExpr', 'CXCursor_UnexposedExpr', 'CXCursor_DeclRefExpr', 'CXCursor_MemberRefExpr', 'CXCursor_CallExpr', 'CXCursor_ObjCMessageExpr', 'CXCursor_BlockExpr', 'CXCursor_IntegerLiteral', 'CXCursor_FloatingLiteral', 'CXCursor_ImaginaryLiteral', 'CXCursor_StringLiteral', 'CXCursor_CharacterLiteral', 'CXCursor_ParenExpr', 'CXCursor_UnaryOperator', 'CXCursor_ArraySubscriptExpr', 'CXCursor_BinaryOperator', 'CXCursor_CompoundAssignOperator', 'CXCursor_ConditionalOperator', 'CXCursor_CStyleCastExpr', 'CXCursor_CompoundLiteralExpr', 'CXCursor_InitListExpr', 'CXCursor_AddrLabelExpr', 'CXCursor_StmtExpr', 'CXCursor_GenericSelectionExpr', 'CXCursor_GNUNullExpr', 'CXCursor_CXXStaticCastExpr', 'CXCursor_CXXDynamicCastExpr', 'CXCursor_CXXReinterpretCastExpr', 'CXCursor_CXXConstCastExpr', 'CXCursor_CXXFunctionalCastExpr', 'CXCursor_CXXTypeidExpr', 'CXCursor_CXXBoolLiteralExpr', 'CXCursor_CXXNullPtrLiteralExpr', 'CXCursor_CXXThisExpr', 'CXCursor_CXXThrowExpr', 'CXCursor_CXXNewExpr', 'CXCursor_CXXDeleteExpr', 'CXCursor_UnaryExpr', 'CXCursor_ObjCStringLiteral', 'CXCursor_ObjCEncodeExpr', 'CXCursor_ObjCSelectorExpr', 'CXCursor_ObjCProtocolExpr', 'CXCursor_ObjCBridgedCastExpr', 'CXCursor_PackExpansionExpr', 'CXCursor_SizeOfPackExpr', 'CXCursor_LambdaExpr', 'CXCursor_ObjCBoolLiteralExpr', 'CXCursor_ObjCSelfExpr', 'CXCursor_LastExpr', 'CXCursor_FirstStmt', 'CXCursor_UnexposedStmt', 'CXCursor_LabelStmt', 'CXCursor_CompoundStmt', 'CXCursor_CaseStmt', 'CXCursor_DefaultStmt', 'CXCursor_IfStmt', 'CXCursor_SwitchStmt', 'CXCursor_WhileStmt', 'CXCursor_DoStmt', 'CXCursor_ForStmt', 'CXCursor_GotoStmt', 'CXCursor_IndirectGotoStmt', 'CXCursor_ContinueStmt', 'CXCursor_BreakStmt', 'CXCursor_ReturnStmt', 'CXCursor_GCCAsmStmt', 'CXCursor_AsmStmt', 'CXCursor_ObjCAtTryStmt', 'CXCursor_ObjCAtCatchStmt', 'CXCursor_ObjCAtFinallyStmt', 'CXCursor_ObjCAtThrowStmt', 'CXCursor_ObjCAtSynchronizedStmt', 'CXCursor_ObjCAutoreleasePoolStmt', 'CXCursor_ObjCForCollectionStmt', 'CXCursor_CXXCatchStmt', 'CXCursor_CXXTryStmt', 'CXCursor_CXXForRangeStmt', 'CXCursor_SEHTryStmt', 'CXCursor_SEHExceptStmt', 'CXCursor_SEHFinallyStmt', 'CXCursor_MSAsmStmt', 'CXCursor_NullStmt', 'CXCursor_DeclStmt', 'CXCursor_OMPParallelDirective', 'CXCursor_OMPSimdDirective', 'CXCursor_OMPForDirective', 'CXCursor_OMPSectionsDirective', 'CXCursor_OMPSectionDirective', 'CXCursor_OMPSingleDirective', 'CXCursor_OMPParallelForDirective', 'CXCursor_OMPParallelSectionsDirective', 'CXCursor_OMPTaskDirective', 'CXCursor_OMPMasterDirective', 'CXCursor_OMPCriticalDirective', 'CXCursor_OMPTaskyieldDirective', 'CXCursor_OMPBarrierDirective', 'CXCursor_OMPTaskwaitDirective', 'CXCursor_OMPFlushDirective', 'CXCursor_SEHLeaveStmt', 'CXCursor_OMPOrderedDirective', 'CXCursor_OMPAtomicDirective', 'CXCursor_OMPForSimdDirective', 'CXCursor_OMPParallelForSimdDirective', 'CXCursor_OMPTargetDirective', 'CXCursor_OMPTeamsDirective', 'CXCursor_OMPTaskgroupDirective', 'CXCursor_OMPCancellationPointDirective', 'CXCursor_OMPCancelDirective', 'CXCursor_LastStmt', 'CXCursor_TranslationUnit', 'CXCursor_FirstAttr', 'CXCursor_UnexposedAttr', 'CXCursor_IBActionAttr', 'CXCursor_IBOutletAttr', 'CXCursor_IBOutletCollectionAttr', 'CXCursor_CXXFinalAttr', 'CXCursor_CXXOverrideAttr', 'CXCursor_AnnotateAttr', 'CXCursor_AsmLabelAttr', 'CXCursor_PackedAttr', 'CXCursor_PureAttr', 'CXCursor_ConstAttr', 'CXCursor_NoDuplicateAttr', 'CXCursor_CUDAConstantAttr', 'CXCursor_CUDADeviceAttr', 'CXCursor_CUDAGlobalAttr', 'CXCursor_CUDAHostAttr', 'CXCursor_CUDASharedAttr', 'CXCursor_LastAttr', 'CXCursor_PreprocessingDirective', 'CXCursor_MacroDefinition', 'CXCursor_MacroExpansion', 'CXCursor_MacroInstantiation', 'CXCursor_InclusionDirective', 'CXCursor_FirstPreprocessing', 'CXCursor_LastPreprocessing', 'CXCursor_ModuleImportDecl', 'CXCursor_FirstExtraDecl', 'CXCursor_LastExtraDecl', 'CXCursor_OverloadCandidate'))

`CXCursor_UnexposedDecl` = GenericEnumValue('CXCursor_UnexposedDecl', 1L, 'CXCursorKind')
`CXCursor_StructDecl` = GenericEnumValue('CXCursor_StructDecl', 2L, 'CXCursorKind')
`CXCursor_UnionDecl` = GenericEnumValue('CXCursor_UnionDecl', 3L, 'CXCursorKind')
`CXCursor_ClassDecl` = GenericEnumValue('CXCursor_ClassDecl', 4L, 'CXCursorKind')
`CXCursor_EnumDecl` = GenericEnumValue('CXCursor_EnumDecl', 5L, 'CXCursorKind')
`CXCursor_FieldDecl` = GenericEnumValue('CXCursor_FieldDecl', 6L, 'CXCursorKind')
`CXCursor_EnumConstantDecl` = GenericEnumValue('CXCursor_EnumConstantDecl', 7L, 'CXCursorKind')
`CXCursor_FunctionDecl` = GenericEnumValue('CXCursor_FunctionDecl', 8L, 'CXCursorKind')
`CXCursor_VarDecl` = GenericEnumValue('CXCursor_VarDecl', 9L, 'CXCursorKind')
`CXCursor_ParmDecl` = GenericEnumValue('CXCursor_ParmDecl', 10L, 'CXCursorKind')
`CXCursor_ObjCInterfaceDecl` = GenericEnumValue('CXCursor_ObjCInterfaceDecl', 11L, 'CXCursorKind')
`CXCursor_ObjCCategoryDecl` = GenericEnumValue('CXCursor_ObjCCategoryDecl', 12L, 'CXCursorKind')
`CXCursor_ObjCProtocolDecl` = GenericEnumValue('CXCursor_ObjCProtocolDecl', 13L, 'CXCursorKind')
`CXCursor_ObjCPropertyDecl` = GenericEnumValue('CXCursor_ObjCPropertyDecl', 14L, 'CXCursorKind')
`CXCursor_ObjCIvarDecl` = GenericEnumValue('CXCursor_ObjCIvarDecl', 15L, 'CXCursorKind')
`CXCursor_ObjCInstanceMethodDecl` = GenericEnumValue('CXCursor_ObjCInstanceMethodDecl', 16L, 'CXCursorKind')
`CXCursor_ObjCClassMethodDecl` = GenericEnumValue('CXCursor_ObjCClassMethodDecl', 17L, 'CXCursorKind')
`CXCursor_ObjCImplementationDecl` = GenericEnumValue('CXCursor_ObjCImplementationDecl', 18L, 'CXCursorKind')
`CXCursor_ObjCCategoryImplDecl` = GenericEnumValue('CXCursor_ObjCCategoryImplDecl', 19L, 'CXCursorKind')
`CXCursor_TypedefDecl` = GenericEnumValue('CXCursor_TypedefDecl', 20L, 'CXCursorKind')
`CXCursor_CXXMethod` = GenericEnumValue('CXCursor_CXXMethod', 21L, 'CXCursorKind')
`CXCursor_Namespace` = GenericEnumValue('CXCursor_Namespace', 22L, 'CXCursorKind')
`CXCursor_LinkageSpec` = GenericEnumValue('CXCursor_LinkageSpec', 23L, 'CXCursorKind')
`CXCursor_Constructor` = GenericEnumValue('CXCursor_Constructor', 24L, 'CXCursorKind')
`CXCursor_Destructor` = GenericEnumValue('CXCursor_Destructor', 25L, 'CXCursorKind')
`CXCursor_ConversionFunction` = GenericEnumValue('CXCursor_ConversionFunction', 26L, 'CXCursorKind')
`CXCursor_TemplateTypeParameter` = GenericEnumValue('CXCursor_TemplateTypeParameter', 27L, 'CXCursorKind')
`CXCursor_NonTypeTemplateParameter` = GenericEnumValue('CXCursor_NonTypeTemplateParameter', 28L, 'CXCursorKind')
`CXCursor_TemplateTemplateParameter` = GenericEnumValue('CXCursor_TemplateTemplateParameter', 29L, 'CXCursorKind')
`CXCursor_FunctionTemplate` = GenericEnumValue('CXCursor_FunctionTemplate', 30L, 'CXCursorKind')
`CXCursor_ClassTemplate` = GenericEnumValue('CXCursor_ClassTemplate', 31L, 'CXCursorKind')
`CXCursor_ClassTemplatePartialSpecialization` = GenericEnumValue('CXCursor_ClassTemplatePartialSpecialization', 32L, 'CXCursorKind')
`CXCursor_NamespaceAlias` = GenericEnumValue('CXCursor_NamespaceAlias', 33L, 'CXCursorKind')
`CXCursor_UsingDirective` = GenericEnumValue('CXCursor_UsingDirective', 34L, 'CXCursorKind')
`CXCursor_UsingDeclaration` = GenericEnumValue('CXCursor_UsingDeclaration', 35L, 'CXCursorKind')
`CXCursor_TypeAliasDecl` = GenericEnumValue('CXCursor_TypeAliasDecl', 36L, 'CXCursorKind')
`CXCursor_ObjCSynthesizeDecl` = GenericEnumValue('CXCursor_ObjCSynthesizeDecl', 37L, 'CXCursorKind')
`CXCursor_ObjCDynamicDecl` = GenericEnumValue('CXCursor_ObjCDynamicDecl', 38L, 'CXCursorKind')
`CXCursor_CXXAccessSpecifier` = GenericEnumValue('CXCursor_CXXAccessSpecifier', 39L, 'CXCursorKind')
`CXCursor_FirstDecl` = GenericEnumValue('CXCursor_FirstDecl', 1L, 'CXCursorKind')
`CXCursor_LastDecl` = GenericEnumValue('CXCursor_LastDecl', 39L, 'CXCursorKind')
`CXCursor_FirstRef` = GenericEnumValue('CXCursor_FirstRef', 40L, 'CXCursorKind')
`CXCursor_ObjCSuperClassRef` = GenericEnumValue('CXCursor_ObjCSuperClassRef', 40L, 'CXCursorKind')
`CXCursor_ObjCProtocolRef` = GenericEnumValue('CXCursor_ObjCProtocolRef', 41L, 'CXCursorKind')
`CXCursor_ObjCClassRef` = GenericEnumValue('CXCursor_ObjCClassRef', 42L, 'CXCursorKind')
`CXCursor_TypeRef` = GenericEnumValue('CXCursor_TypeRef', 43L, 'CXCursorKind')
`CXCursor_CXXBaseSpecifier` = GenericEnumValue('CXCursor_CXXBaseSpecifier', 44L, 'CXCursorKind')
`CXCursor_TemplateRef` = GenericEnumValue('CXCursor_TemplateRef', 45L, 'CXCursorKind')
`CXCursor_NamespaceRef` = GenericEnumValue('CXCursor_NamespaceRef', 46L, 'CXCursorKind')
`CXCursor_MemberRef` = GenericEnumValue('CXCursor_MemberRef', 47L, 'CXCursorKind')
`CXCursor_LabelRef` = GenericEnumValue('CXCursor_LabelRef', 48L, 'CXCursorKind')
`CXCursor_OverloadedDeclRef` = GenericEnumValue('CXCursor_OverloadedDeclRef', 49L, 'CXCursorKind')
`CXCursor_VariableRef` = GenericEnumValue('CXCursor_VariableRef', 50L, 'CXCursorKind')
`CXCursor_LastRef` = GenericEnumValue('CXCursor_LastRef', 50L, 'CXCursorKind')
`CXCursor_FirstInvalid` = GenericEnumValue('CXCursor_FirstInvalid', 70L, 'CXCursorKind')
`CXCursor_InvalidFile` = GenericEnumValue('CXCursor_InvalidFile', 70L, 'CXCursorKind')
`CXCursor_NoDeclFound` = GenericEnumValue('CXCursor_NoDeclFound', 71L, 'CXCursorKind')
`CXCursor_NotImplemented` = GenericEnumValue('CXCursor_NotImplemented', 72L, 'CXCursorKind')
`CXCursor_InvalidCode` = GenericEnumValue('CXCursor_InvalidCode', 73L, 'CXCursorKind')
`CXCursor_LastInvalid` = GenericEnumValue('CXCursor_LastInvalid', 73L, 'CXCursorKind')
`CXCursor_FirstExpr` = GenericEnumValue('CXCursor_FirstExpr', 100L, 'CXCursorKind')
`CXCursor_UnexposedExpr` = GenericEnumValue('CXCursor_UnexposedExpr', 100L, 'CXCursorKind')
`CXCursor_DeclRefExpr` = GenericEnumValue('CXCursor_DeclRefExpr', 101L, 'CXCursorKind')
`CXCursor_MemberRefExpr` = GenericEnumValue('CXCursor_MemberRefExpr', 102L, 'CXCursorKind')
`CXCursor_CallExpr` = GenericEnumValue('CXCursor_CallExpr', 103L, 'CXCursorKind')
`CXCursor_ObjCMessageExpr` = GenericEnumValue('CXCursor_ObjCMessageExpr', 104L, 'CXCursorKind')
`CXCursor_BlockExpr` = GenericEnumValue('CXCursor_BlockExpr', 105L, 'CXCursorKind')
`CXCursor_IntegerLiteral` = GenericEnumValue('CXCursor_IntegerLiteral', 106L, 'CXCursorKind')
`CXCursor_FloatingLiteral` = GenericEnumValue('CXCursor_FloatingLiteral', 107L, 'CXCursorKind')
`CXCursor_ImaginaryLiteral` = GenericEnumValue('CXCursor_ImaginaryLiteral', 108L, 'CXCursorKind')
`CXCursor_StringLiteral` = GenericEnumValue('CXCursor_StringLiteral', 109L, 'CXCursorKind')
`CXCursor_CharacterLiteral` = GenericEnumValue('CXCursor_CharacterLiteral', 110L, 'CXCursorKind')
`CXCursor_ParenExpr` = GenericEnumValue('CXCursor_ParenExpr', 111L, 'CXCursorKind')
`CXCursor_UnaryOperator` = GenericEnumValue('CXCursor_UnaryOperator', 112L, 'CXCursorKind')
`CXCursor_ArraySubscriptExpr` = GenericEnumValue('CXCursor_ArraySubscriptExpr', 113L, 'CXCursorKind')
`CXCursor_BinaryOperator` = GenericEnumValue('CXCursor_BinaryOperator', 114L, 'CXCursorKind')
`CXCursor_CompoundAssignOperator` = GenericEnumValue('CXCursor_CompoundAssignOperator', 115L, 'CXCursorKind')
`CXCursor_ConditionalOperator` = GenericEnumValue('CXCursor_ConditionalOperator', 116L, 'CXCursorKind')
`CXCursor_CStyleCastExpr` = GenericEnumValue('CXCursor_CStyleCastExpr', 117L, 'CXCursorKind')
`CXCursor_CompoundLiteralExpr` = GenericEnumValue('CXCursor_CompoundLiteralExpr', 118L, 'CXCursorKind')
`CXCursor_InitListExpr` = GenericEnumValue('CXCursor_InitListExpr', 119L, 'CXCursorKind')
`CXCursor_AddrLabelExpr` = GenericEnumValue('CXCursor_AddrLabelExpr', 120L, 'CXCursorKind')
`CXCursor_StmtExpr` = GenericEnumValue('CXCursor_StmtExpr', 121L, 'CXCursorKind')
`CXCursor_GenericSelectionExpr` = GenericEnumValue('CXCursor_GenericSelectionExpr', 122L, 'CXCursorKind')
`CXCursor_GNUNullExpr` = GenericEnumValue('CXCursor_GNUNullExpr', 123L, 'CXCursorKind')
`CXCursor_CXXStaticCastExpr` = GenericEnumValue('CXCursor_CXXStaticCastExpr', 124L, 'CXCursorKind')
`CXCursor_CXXDynamicCastExpr` = GenericEnumValue('CXCursor_CXXDynamicCastExpr', 125L, 'CXCursorKind')
`CXCursor_CXXReinterpretCastExpr` = GenericEnumValue('CXCursor_CXXReinterpretCastExpr', 126L, 'CXCursorKind')
`CXCursor_CXXConstCastExpr` = GenericEnumValue('CXCursor_CXXConstCastExpr', 127L, 'CXCursorKind')
`CXCursor_CXXFunctionalCastExpr` = GenericEnumValue('CXCursor_CXXFunctionalCastExpr', 128L, 'CXCursorKind')
`CXCursor_CXXTypeidExpr` = GenericEnumValue('CXCursor_CXXTypeidExpr', 129L, 'CXCursorKind')
`CXCursor_CXXBoolLiteralExpr` = GenericEnumValue('CXCursor_CXXBoolLiteralExpr', 130L, 'CXCursorKind')
`CXCursor_CXXNullPtrLiteralExpr` = GenericEnumValue('CXCursor_CXXNullPtrLiteralExpr', 131L, 'CXCursorKind')
`CXCursor_CXXThisExpr` = GenericEnumValue('CXCursor_CXXThisExpr', 132L, 'CXCursorKind')
`CXCursor_CXXThrowExpr` = GenericEnumValue('CXCursor_CXXThrowExpr', 133L, 'CXCursorKind')
`CXCursor_CXXNewExpr` = GenericEnumValue('CXCursor_CXXNewExpr', 134L, 'CXCursorKind')
`CXCursor_CXXDeleteExpr` = GenericEnumValue('CXCursor_CXXDeleteExpr', 135L, 'CXCursorKind')
`CXCursor_UnaryExpr` = GenericEnumValue('CXCursor_UnaryExpr', 136L, 'CXCursorKind')
`CXCursor_ObjCStringLiteral` = GenericEnumValue('CXCursor_ObjCStringLiteral', 137L, 'CXCursorKind')
`CXCursor_ObjCEncodeExpr` = GenericEnumValue('CXCursor_ObjCEncodeExpr', 138L, 'CXCursorKind')
`CXCursor_ObjCSelectorExpr` = GenericEnumValue('CXCursor_ObjCSelectorExpr', 139L, 'CXCursorKind')
`CXCursor_ObjCProtocolExpr` = GenericEnumValue('CXCursor_ObjCProtocolExpr', 140L, 'CXCursorKind')
`CXCursor_ObjCBridgedCastExpr` = GenericEnumValue('CXCursor_ObjCBridgedCastExpr', 141L, 'CXCursorKind')
`CXCursor_PackExpansionExpr` = GenericEnumValue('CXCursor_PackExpansionExpr', 142L, 'CXCursorKind')
`CXCursor_SizeOfPackExpr` = GenericEnumValue('CXCursor_SizeOfPackExpr', 143L, 'CXCursorKind')
`CXCursor_LambdaExpr` = GenericEnumValue('CXCursor_LambdaExpr', 144L, 'CXCursorKind')
`CXCursor_ObjCBoolLiteralExpr` = GenericEnumValue('CXCursor_ObjCBoolLiteralExpr', 145L, 'CXCursorKind')
`CXCursor_ObjCSelfExpr` = GenericEnumValue('CXCursor_ObjCSelfExpr', 146L, 'CXCursorKind')
`CXCursor_LastExpr` = GenericEnumValue('CXCursor_LastExpr', 146L, 'CXCursorKind')
`CXCursor_FirstStmt` = GenericEnumValue('CXCursor_FirstStmt', 200L, 'CXCursorKind')
`CXCursor_UnexposedStmt` = GenericEnumValue('CXCursor_UnexposedStmt', 200L, 'CXCursorKind')
`CXCursor_LabelStmt` = GenericEnumValue('CXCursor_LabelStmt', 201L, 'CXCursorKind')
`CXCursor_CompoundStmt` = GenericEnumValue('CXCursor_CompoundStmt', 202L, 'CXCursorKind')
`CXCursor_CaseStmt` = GenericEnumValue('CXCursor_CaseStmt', 203L, 'CXCursorKind')
`CXCursor_DefaultStmt` = GenericEnumValue('CXCursor_DefaultStmt', 204L, 'CXCursorKind')
`CXCursor_IfStmt` = GenericEnumValue('CXCursor_IfStmt', 205L, 'CXCursorKind')
`CXCursor_SwitchStmt` = GenericEnumValue('CXCursor_SwitchStmt', 206L, 'CXCursorKind')
`CXCursor_WhileStmt` = GenericEnumValue('CXCursor_WhileStmt', 207L, 'CXCursorKind')
`CXCursor_DoStmt` = GenericEnumValue('CXCursor_DoStmt', 208L, 'CXCursorKind')
`CXCursor_ForStmt` = GenericEnumValue('CXCursor_ForStmt', 209L, 'CXCursorKind')
`CXCursor_GotoStmt` = GenericEnumValue('CXCursor_GotoStmt', 210L, 'CXCursorKind')
`CXCursor_IndirectGotoStmt` = GenericEnumValue('CXCursor_IndirectGotoStmt', 211L, 'CXCursorKind')
`CXCursor_ContinueStmt` = GenericEnumValue('CXCursor_ContinueStmt', 212L, 'CXCursorKind')
`CXCursor_BreakStmt` = GenericEnumValue('CXCursor_BreakStmt', 213L, 'CXCursorKind')
`CXCursor_ReturnStmt` = GenericEnumValue('CXCursor_ReturnStmt', 214L, 'CXCursorKind')
`CXCursor_GCCAsmStmt` = GenericEnumValue('CXCursor_GCCAsmStmt', 215L, 'CXCursorKind')
`CXCursor_AsmStmt` = GenericEnumValue('CXCursor_AsmStmt', 215L, 'CXCursorKind')
`CXCursor_ObjCAtTryStmt` = GenericEnumValue('CXCursor_ObjCAtTryStmt', 216L, 'CXCursorKind')
`CXCursor_ObjCAtCatchStmt` = GenericEnumValue('CXCursor_ObjCAtCatchStmt', 217L, 'CXCursorKind')
`CXCursor_ObjCAtFinallyStmt` = GenericEnumValue('CXCursor_ObjCAtFinallyStmt', 218L, 'CXCursorKind')
`CXCursor_ObjCAtThrowStmt` = GenericEnumValue('CXCursor_ObjCAtThrowStmt', 219L, 'CXCursorKind')
`CXCursor_ObjCAtSynchronizedStmt` = GenericEnumValue('CXCursor_ObjCAtSynchronizedStmt', 220L, 'CXCursorKind')
`CXCursor_ObjCAutoreleasePoolStmt` = GenericEnumValue('CXCursor_ObjCAutoreleasePoolStmt', 221L, 'CXCursorKind')
`CXCursor_ObjCForCollectionStmt` = GenericEnumValue('CXCursor_ObjCForCollectionStmt', 222L, 'CXCursorKind')
`CXCursor_CXXCatchStmt` = GenericEnumValue('CXCursor_CXXCatchStmt', 223L, 'CXCursorKind')
`CXCursor_CXXTryStmt` = GenericEnumValue('CXCursor_CXXTryStmt', 224L, 'CXCursorKind')
`CXCursor_CXXForRangeStmt` = GenericEnumValue('CXCursor_CXXForRangeStmt', 225L, 'CXCursorKind')
`CXCursor_SEHTryStmt` = GenericEnumValue('CXCursor_SEHTryStmt', 226L, 'CXCursorKind')
`CXCursor_SEHExceptStmt` = GenericEnumValue('CXCursor_SEHExceptStmt', 227L, 'CXCursorKind')
`CXCursor_SEHFinallyStmt` = GenericEnumValue('CXCursor_SEHFinallyStmt', 228L, 'CXCursorKind')
`CXCursor_MSAsmStmt` = GenericEnumValue('CXCursor_MSAsmStmt', 229L, 'CXCursorKind')
`CXCursor_NullStmt` = GenericEnumValue('CXCursor_NullStmt', 230L, 'CXCursorKind')
`CXCursor_DeclStmt` = GenericEnumValue('CXCursor_DeclStmt', 231L, 'CXCursorKind')
`CXCursor_OMPParallelDirective` = GenericEnumValue('CXCursor_OMPParallelDirective', 232L, 'CXCursorKind')
`CXCursor_OMPSimdDirective` = GenericEnumValue('CXCursor_OMPSimdDirective', 233L, 'CXCursorKind')
`CXCursor_OMPForDirective` = GenericEnumValue('CXCursor_OMPForDirective', 234L, 'CXCursorKind')
`CXCursor_OMPSectionsDirective` = GenericEnumValue('CXCursor_OMPSectionsDirective', 235L, 'CXCursorKind')
`CXCursor_OMPSectionDirective` = GenericEnumValue('CXCursor_OMPSectionDirective', 236L, 'CXCursorKind')
`CXCursor_OMPSingleDirective` = GenericEnumValue('CXCursor_OMPSingleDirective', 237L, 'CXCursorKind')
`CXCursor_OMPParallelForDirective` = GenericEnumValue('CXCursor_OMPParallelForDirective', 238L, 'CXCursorKind')
`CXCursor_OMPParallelSectionsDirective` = GenericEnumValue('CXCursor_OMPParallelSectionsDirective', 239L, 'CXCursorKind')
`CXCursor_OMPTaskDirective` = GenericEnumValue('CXCursor_OMPTaskDirective', 240L, 'CXCursorKind')
`CXCursor_OMPMasterDirective` = GenericEnumValue('CXCursor_OMPMasterDirective', 241L, 'CXCursorKind')
`CXCursor_OMPCriticalDirective` = GenericEnumValue('CXCursor_OMPCriticalDirective', 242L, 'CXCursorKind')
`CXCursor_OMPTaskyieldDirective` = GenericEnumValue('CXCursor_OMPTaskyieldDirective', 243L, 'CXCursorKind')
`CXCursor_OMPBarrierDirective` = GenericEnumValue('CXCursor_OMPBarrierDirective', 244L, 'CXCursorKind')
`CXCursor_OMPTaskwaitDirective` = GenericEnumValue('CXCursor_OMPTaskwaitDirective', 245L, 'CXCursorKind')
`CXCursor_OMPFlushDirective` = GenericEnumValue('CXCursor_OMPFlushDirective', 246L, 'CXCursorKind')
`CXCursor_SEHLeaveStmt` = GenericEnumValue('CXCursor_SEHLeaveStmt', 247L, 'CXCursorKind')
`CXCursor_OMPOrderedDirective` = GenericEnumValue('CXCursor_OMPOrderedDirective', 248L, 'CXCursorKind')
`CXCursor_OMPAtomicDirective` = GenericEnumValue('CXCursor_OMPAtomicDirective', 249L, 'CXCursorKind')
`CXCursor_OMPForSimdDirective` = GenericEnumValue('CXCursor_OMPForSimdDirective', 250L, 'CXCursorKind')
`CXCursor_OMPParallelForSimdDirective` = GenericEnumValue('CXCursor_OMPParallelForSimdDirective', 251L, 'CXCursorKind')
`CXCursor_OMPTargetDirective` = GenericEnumValue('CXCursor_OMPTargetDirective', 252L, 'CXCursorKind')
`CXCursor_OMPTeamsDirective` = GenericEnumValue('CXCursor_OMPTeamsDirective', 253L, 'CXCursorKind')
`CXCursor_OMPTaskgroupDirective` = GenericEnumValue('CXCursor_OMPTaskgroupDirective', 254L, 'CXCursorKind')
`CXCursor_OMPCancellationPointDirective` = GenericEnumValue('CXCursor_OMPCancellationPointDirective', 255L, 'CXCursorKind')
`CXCursor_OMPCancelDirective` = GenericEnumValue('CXCursor_OMPCancelDirective', 256L, 'CXCursorKind')
`CXCursor_LastStmt` = GenericEnumValue('CXCursor_LastStmt', 256L, 'CXCursorKind')
`CXCursor_TranslationUnit` = GenericEnumValue('CXCursor_TranslationUnit', 300L, 'CXCursorKind')
`CXCursor_FirstAttr` = GenericEnumValue('CXCursor_FirstAttr', 400L, 'CXCursorKind')
`CXCursor_UnexposedAttr` = GenericEnumValue('CXCursor_UnexposedAttr', 400L, 'CXCursorKind')
`CXCursor_IBActionAttr` = GenericEnumValue('CXCursor_IBActionAttr', 401L, 'CXCursorKind')
`CXCursor_IBOutletAttr` = GenericEnumValue('CXCursor_IBOutletAttr', 402L, 'CXCursorKind')
`CXCursor_IBOutletCollectionAttr` = GenericEnumValue('CXCursor_IBOutletCollectionAttr', 403L, 'CXCursorKind')
`CXCursor_CXXFinalAttr` = GenericEnumValue('CXCursor_CXXFinalAttr', 404L, 'CXCursorKind')
`CXCursor_CXXOverrideAttr` = GenericEnumValue('CXCursor_CXXOverrideAttr', 405L, 'CXCursorKind')
`CXCursor_AnnotateAttr` = GenericEnumValue('CXCursor_AnnotateAttr', 406L, 'CXCursorKind')
`CXCursor_AsmLabelAttr` = GenericEnumValue('CXCursor_AsmLabelAttr', 407L, 'CXCursorKind')
`CXCursor_PackedAttr` = GenericEnumValue('CXCursor_PackedAttr', 408L, 'CXCursorKind')
`CXCursor_PureAttr` = GenericEnumValue('CXCursor_PureAttr', 409L, 'CXCursorKind')
`CXCursor_ConstAttr` = GenericEnumValue('CXCursor_ConstAttr', 410L, 'CXCursorKind')
`CXCursor_NoDuplicateAttr` = GenericEnumValue('CXCursor_NoDuplicateAttr', 411L, 'CXCursorKind')
`CXCursor_CUDAConstantAttr` = GenericEnumValue('CXCursor_CUDAConstantAttr', 412L, 'CXCursorKind')
`CXCursor_CUDADeviceAttr` = GenericEnumValue('CXCursor_CUDADeviceAttr', 413L, 'CXCursorKind')
`CXCursor_CUDAGlobalAttr` = GenericEnumValue('CXCursor_CUDAGlobalAttr', 414L, 'CXCursorKind')
`CXCursor_CUDAHostAttr` = GenericEnumValue('CXCursor_CUDAHostAttr', 415L, 'CXCursorKind')
`CXCursor_CUDASharedAttr` = GenericEnumValue('CXCursor_CUDASharedAttr', 416L, 'CXCursorKind')
`CXCursor_LastAttr` = GenericEnumValue('CXCursor_LastAttr', 416L, 'CXCursorKind')
`CXCursor_PreprocessingDirective` = GenericEnumValue('CXCursor_PreprocessingDirective', 500L, 'CXCursorKind')
`CXCursor_MacroDefinition` = GenericEnumValue('CXCursor_MacroDefinition', 501L, 'CXCursorKind')
`CXCursor_MacroExpansion` = GenericEnumValue('CXCursor_MacroExpansion', 502L, 'CXCursorKind')
`CXCursor_MacroInstantiation` = GenericEnumValue('CXCursor_MacroInstantiation', 502L, 'CXCursorKind')
`CXCursor_InclusionDirective` = GenericEnumValue('CXCursor_InclusionDirective', 503L, 'CXCursorKind')
`CXCursor_FirstPreprocessing` = GenericEnumValue('CXCursor_FirstPreprocessing', 500L, 'CXCursorKind')
`CXCursor_LastPreprocessing` = GenericEnumValue('CXCursor_LastPreprocessing', 503L, 'CXCursorKind')
`CXCursor_ModuleImportDecl` = GenericEnumValue('CXCursor_ModuleImportDecl', 600L, 'CXCursorKind')
`CXCursor_FirstExtraDecl` = GenericEnumValue('CXCursor_FirstExtraDecl', 600L, 'CXCursorKind')
`CXCursor_LastExtraDecl` = GenericEnumValue('CXCursor_LastExtraDecl', 600L, 'CXCursorKind')
`CXCursor_OverloadCandidate` = GenericEnumValue('CXCursor_OverloadCandidate', 700L, 'CXCursorKind')

 setAs("character", "CXCursorKind", function(from) asEnumValue(from, CXCursorKindValues, "CXCursorKind", prefix = NA) )
 setAs("integer", "CXCursorKind", function(from) asEnumValue(from, CXCursorKindValues, "CXCursorKind", prefix = NA) )
 setAs("numeric", "CXCursorKind", function(from) asEnumValue(from, CXCursorKindValues, "CXCursorKind", prefix = NA) )


#####################################
setClass("CXLinkageKind", contains = "EnumValue")

CXLinkageKind = CXLinkageKindValues = structure(c(0L, 1L, 2L, 3L, 4L), .Names = c('CXLinkage_Invalid', 'CXLinkage_NoLinkage', 'CXLinkage_Internal', 'CXLinkage_UniqueExternal', 'CXLinkage_External'))

`CXLinkage_Invalid` = GenericEnumValue('CXLinkage_Invalid', 0L, 'CXLinkageKind')
`CXLinkage_NoLinkage` = GenericEnumValue('CXLinkage_NoLinkage', 1L, 'CXLinkageKind')
`CXLinkage_Internal` = GenericEnumValue('CXLinkage_Internal', 2L, 'CXLinkageKind')
`CXLinkage_UniqueExternal` = GenericEnumValue('CXLinkage_UniqueExternal', 3L, 'CXLinkageKind')
`CXLinkage_External` = GenericEnumValue('CXLinkage_External', 4L, 'CXLinkageKind')

 setAs("character", "CXLinkageKind", function(from) asEnumValue(from, CXLinkageKindValues, "CXLinkageKind", prefix = NA) )
 setAs("integer", "CXLinkageKind", function(from) asEnumValue(from, CXLinkageKindValues, "CXLinkageKind", prefix = NA) )
 setAs("numeric", "CXLinkageKind", function(from) asEnumValue(from, CXLinkageKindValues, "CXLinkageKind", prefix = NA) )


#####################################
setClass("CXLanguageKind", contains = "EnumValue")

CXLanguageKind = CXLanguageKindValues = structure(c(0L, 1L, 2L, 3L), .Names = c('CXLanguage_Invalid', 'CXLanguage_C', 'CXLanguage_ObjC', 'CXLanguage_CPlusPlus'))

`CXLanguage_Invalid` = GenericEnumValue('CXLanguage_Invalid', 0L, 'CXLanguageKind')
`CXLanguage_C` = GenericEnumValue('CXLanguage_C', 1L, 'CXLanguageKind')
`CXLanguage_ObjC` = GenericEnumValue('CXLanguage_ObjC', 2L, 'CXLanguageKind')
`CXLanguage_CPlusPlus` = GenericEnumValue('CXLanguage_CPlusPlus', 3L, 'CXLanguageKind')

 setAs("character", "CXLanguageKind", function(from) asEnumValue(from, CXLanguageKindValues, "CXLanguageKind", prefix = NA) )
 setAs("integer", "CXLanguageKind", function(from) asEnumValue(from, CXLanguageKindValues, "CXLanguageKind", prefix = NA) )
 setAs("numeric", "CXLanguageKind", function(from) asEnumValue(from, CXLanguageKindValues, "CXLanguageKind", prefix = NA) )


#####################################
setClass("CXTypeKind", contains = "EnumValue")

CXTypeKind = CXTypeKindValues = structure(c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 14L, 15L, 16L, 17L, 18L, 19L, 20L, 21L, 22L, 23L, 24L, 25L, 26L, 27L, 28L, 29L, 2L, 29L, 100L, 101L, 102L, 103L, 104L, 105L, 106L, 107L, 108L, 109L, 110L, 111L, 112L, 113L, 114L, 115L, 116L, 117L), .Names = c('CXType_Invalid', 'CXType_Unexposed', 'CXType_Void', 'CXType_Bool', 'CXType_Char_U', 'CXType_UChar', 'CXType_Char16', 'CXType_Char32', 'CXType_UShort', 'CXType_UInt', 'CXType_ULong', 'CXType_ULongLong', 'CXType_UInt128', 'CXType_Char_S', 'CXType_SChar', 'CXType_WChar', 'CXType_Short', 'CXType_Int', 'CXType_Long', 'CXType_LongLong', 'CXType_Int128', 'CXType_Float', 'CXType_Double', 'CXType_LongDouble', 'CXType_NullPtr', 'CXType_Overload', 'CXType_Dependent', 'CXType_ObjCId', 'CXType_ObjCClass', 'CXType_ObjCSel', 'CXType_FirstBuiltin', 'CXType_LastBuiltin', 'CXType_Complex', 'CXType_Pointer', 'CXType_BlockPointer', 'CXType_LValueReference', 'CXType_RValueReference', 'CXType_Record', 'CXType_Enum', 'CXType_Typedef', 'CXType_ObjCInterface', 'CXType_ObjCObjectPointer', 'CXType_FunctionNoProto', 'CXType_FunctionProto', 'CXType_ConstantArray', 'CXType_Vector', 'CXType_IncompleteArray', 'CXType_VariableArray', 'CXType_DependentSizedArray', 'CXType_MemberPointer'))

`CXType_Invalid` = GenericEnumValue('CXType_Invalid', 0L, 'CXTypeKind')
`CXType_Unexposed` = GenericEnumValue('CXType_Unexposed', 1L, 'CXTypeKind')
`CXType_Void` = GenericEnumValue('CXType_Void', 2L, 'CXTypeKind')
`CXType_Bool` = GenericEnumValue('CXType_Bool', 3L, 'CXTypeKind')
`CXType_Char_U` = GenericEnumValue('CXType_Char_U', 4L, 'CXTypeKind')
`CXType_UChar` = GenericEnumValue('CXType_UChar', 5L, 'CXTypeKind')
`CXType_Char16` = GenericEnumValue('CXType_Char16', 6L, 'CXTypeKind')
`CXType_Char32` = GenericEnumValue('CXType_Char32', 7L, 'CXTypeKind')
`CXType_UShort` = GenericEnumValue('CXType_UShort', 8L, 'CXTypeKind')
`CXType_UInt` = GenericEnumValue('CXType_UInt', 9L, 'CXTypeKind')
`CXType_ULong` = GenericEnumValue('CXType_ULong', 10L, 'CXTypeKind')
`CXType_ULongLong` = GenericEnumValue('CXType_ULongLong', 11L, 'CXTypeKind')
`CXType_UInt128` = GenericEnumValue('CXType_UInt128', 12L, 'CXTypeKind')
`CXType_Char_S` = GenericEnumValue('CXType_Char_S', 13L, 'CXTypeKind')
`CXType_SChar` = GenericEnumValue('CXType_SChar', 14L, 'CXTypeKind')
`CXType_WChar` = GenericEnumValue('CXType_WChar', 15L, 'CXTypeKind')
`CXType_Short` = GenericEnumValue('CXType_Short', 16L, 'CXTypeKind')
`CXType_Int` = GenericEnumValue('CXType_Int', 17L, 'CXTypeKind')
`CXType_Long` = GenericEnumValue('CXType_Long', 18L, 'CXTypeKind')
`CXType_LongLong` = GenericEnumValue('CXType_LongLong', 19L, 'CXTypeKind')
`CXType_Int128` = GenericEnumValue('CXType_Int128', 20L, 'CXTypeKind')
`CXType_Float` = GenericEnumValue('CXType_Float', 21L, 'CXTypeKind')
`CXType_Double` = GenericEnumValue('CXType_Double', 22L, 'CXTypeKind')
`CXType_LongDouble` = GenericEnumValue('CXType_LongDouble', 23L, 'CXTypeKind')
`CXType_NullPtr` = GenericEnumValue('CXType_NullPtr', 24L, 'CXTypeKind')
`CXType_Overload` = GenericEnumValue('CXType_Overload', 25L, 'CXTypeKind')
`CXType_Dependent` = GenericEnumValue('CXType_Dependent', 26L, 'CXTypeKind')
`CXType_ObjCId` = GenericEnumValue('CXType_ObjCId', 27L, 'CXTypeKind')
`CXType_ObjCClass` = GenericEnumValue('CXType_ObjCClass', 28L, 'CXTypeKind')
`CXType_ObjCSel` = GenericEnumValue('CXType_ObjCSel', 29L, 'CXTypeKind')
`CXType_FirstBuiltin` = GenericEnumValue('CXType_FirstBuiltin', 2L, 'CXTypeKind')
`CXType_LastBuiltin` = GenericEnumValue('CXType_LastBuiltin', 29L, 'CXTypeKind')
`CXType_Complex` = GenericEnumValue('CXType_Complex', 100L, 'CXTypeKind')
`CXType_Pointer` = GenericEnumValue('CXType_Pointer', 101L, 'CXTypeKind')
`CXType_BlockPointer` = GenericEnumValue('CXType_BlockPointer', 102L, 'CXTypeKind')
`CXType_LValueReference` = GenericEnumValue('CXType_LValueReference', 103L, 'CXTypeKind')
`CXType_RValueReference` = GenericEnumValue('CXType_RValueReference', 104L, 'CXTypeKind')
`CXType_Record` = GenericEnumValue('CXType_Record', 105L, 'CXTypeKind')
`CXType_Enum` = GenericEnumValue('CXType_Enum', 106L, 'CXTypeKind')
`CXType_Typedef` = GenericEnumValue('CXType_Typedef', 107L, 'CXTypeKind')
`CXType_ObjCInterface` = GenericEnumValue('CXType_ObjCInterface', 108L, 'CXTypeKind')
`CXType_ObjCObjectPointer` = GenericEnumValue('CXType_ObjCObjectPointer', 109L, 'CXTypeKind')
`CXType_FunctionNoProto` = GenericEnumValue('CXType_FunctionNoProto', 110L, 'CXTypeKind')
`CXType_FunctionProto` = GenericEnumValue('CXType_FunctionProto', 111L, 'CXTypeKind')
`CXType_ConstantArray` = GenericEnumValue('CXType_ConstantArray', 112L, 'CXTypeKind')
`CXType_Vector` = GenericEnumValue('CXType_Vector', 113L, 'CXTypeKind')
`CXType_IncompleteArray` = GenericEnumValue('CXType_IncompleteArray', 114L, 'CXTypeKind')
`CXType_VariableArray` = GenericEnumValue('CXType_VariableArray', 115L, 'CXTypeKind')
`CXType_DependentSizedArray` = GenericEnumValue('CXType_DependentSizedArray', 116L, 'CXTypeKind')
`CXType_MemberPointer` = GenericEnumValue('CXType_MemberPointer', 117L, 'CXTypeKind')

 setAs("character", "CXTypeKind", function(from) asEnumValue(from, CXTypeKindValues, "CXTypeKind", prefix = NA) )
 setAs("integer", "CXTypeKind", function(from) asEnumValue(from, CXTypeKindValues, "CXTypeKind", prefix = NA) )
 setAs("numeric", "CXTypeKind", function(from) asEnumValue(from, CXTypeKindValues, "CXTypeKind", prefix = NA) )


#####################################
setClass("CXCallingConv", contains = "EnumValue")

CXCallingConv = CXCallingConvValues = structure(c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 9L, 10L, 11L, 12L, 100L, 200L), .Names = c('CXCallingConv_Default', 'CXCallingConv_C', 'CXCallingConv_X86StdCall', 'CXCallingConv_X86FastCall', 'CXCallingConv_X86ThisCall', 'CXCallingConv_X86Pascal', 'CXCallingConv_AAPCS', 'CXCallingConv_AAPCS_VFP', 'CXCallingConv_IntelOclBicc', 'CXCallingConv_X86_64Win64', 'CXCallingConv_X86_64SysV', 'CXCallingConv_X86VectorCall', 'CXCallingConv_Invalid', 'CXCallingConv_Unexposed'))

`CXCallingConv_Default` = GenericEnumValue('CXCallingConv_Default', 0L, 'CXCallingConv')
`CXCallingConv_C` = GenericEnumValue('CXCallingConv_C', 1L, 'CXCallingConv')
`CXCallingConv_X86StdCall` = GenericEnumValue('CXCallingConv_X86StdCall', 2L, 'CXCallingConv')
`CXCallingConv_X86FastCall` = GenericEnumValue('CXCallingConv_X86FastCall', 3L, 'CXCallingConv')
`CXCallingConv_X86ThisCall` = GenericEnumValue('CXCallingConv_X86ThisCall', 4L, 'CXCallingConv')
`CXCallingConv_X86Pascal` = GenericEnumValue('CXCallingConv_X86Pascal', 5L, 'CXCallingConv')
`CXCallingConv_AAPCS` = GenericEnumValue('CXCallingConv_AAPCS', 6L, 'CXCallingConv')
`CXCallingConv_AAPCS_VFP` = GenericEnumValue('CXCallingConv_AAPCS_VFP', 7L, 'CXCallingConv')
`CXCallingConv_IntelOclBicc` = GenericEnumValue('CXCallingConv_IntelOclBicc', 9L, 'CXCallingConv')
`CXCallingConv_X86_64Win64` = GenericEnumValue('CXCallingConv_X86_64Win64', 10L, 'CXCallingConv')
`CXCallingConv_X86_64SysV` = GenericEnumValue('CXCallingConv_X86_64SysV', 11L, 'CXCallingConv')
`CXCallingConv_X86VectorCall` = GenericEnumValue('CXCallingConv_X86VectorCall', 12L, 'CXCallingConv')
`CXCallingConv_Invalid` = GenericEnumValue('CXCallingConv_Invalid', 100L, 'CXCallingConv')
`CXCallingConv_Unexposed` = GenericEnumValue('CXCallingConv_Unexposed', 200L, 'CXCallingConv')

 setAs("character", "CXCallingConv", function(from) asEnumValue(from, CXCallingConvValues, "CXCallingConv", prefix = NA) )
 setAs("integer", "CXCallingConv", function(from) asEnumValue(from, CXCallingConvValues, "CXCallingConv", prefix = NA) )
 setAs("numeric", "CXCallingConv", function(from) asEnumValue(from, CXCallingConvValues, "CXCallingConv", prefix = NA) )


#####################################
setClass("CXTemplateArgumentKind", contains = "EnumValue")

CXTemplateArgumentKind = CXTemplateArgumentKindValues = structure(c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L), .Names = c('CXTemplateArgumentKind_Null', 'CXTemplateArgumentKind_Type', 'CXTemplateArgumentKind_Declaration', 'CXTemplateArgumentKind_NullPtr', 'CXTemplateArgumentKind_Integral', 'CXTemplateArgumentKind_Template', 'CXTemplateArgumentKind_TemplateExpansion', 'CXTemplateArgumentKind_Expression', 'CXTemplateArgumentKind_Pack', 'CXTemplateArgumentKind_Invalid'))

`CXTemplateArgumentKind_Null` = GenericEnumValue('CXTemplateArgumentKind_Null', 0L, 'CXTemplateArgumentKind')
`CXTemplateArgumentKind_Type` = GenericEnumValue('CXTemplateArgumentKind_Type', 1L, 'CXTemplateArgumentKind')
`CXTemplateArgumentKind_Declaration` = GenericEnumValue('CXTemplateArgumentKind_Declaration', 2L, 'CXTemplateArgumentKind')
`CXTemplateArgumentKind_NullPtr` = GenericEnumValue('CXTemplateArgumentKind_NullPtr', 3L, 'CXTemplateArgumentKind')
`CXTemplateArgumentKind_Integral` = GenericEnumValue('CXTemplateArgumentKind_Integral', 4L, 'CXTemplateArgumentKind')
`CXTemplateArgumentKind_Template` = GenericEnumValue('CXTemplateArgumentKind_Template', 5L, 'CXTemplateArgumentKind')
`CXTemplateArgumentKind_TemplateExpansion` = GenericEnumValue('CXTemplateArgumentKind_TemplateExpansion', 6L, 'CXTemplateArgumentKind')
`CXTemplateArgumentKind_Expression` = GenericEnumValue('CXTemplateArgumentKind_Expression', 7L, 'CXTemplateArgumentKind')
`CXTemplateArgumentKind_Pack` = GenericEnumValue('CXTemplateArgumentKind_Pack', 8L, 'CXTemplateArgumentKind')
`CXTemplateArgumentKind_Invalid` = GenericEnumValue('CXTemplateArgumentKind_Invalid', 9L, 'CXTemplateArgumentKind')

 setAs("character", "CXTemplateArgumentKind", function(from) asEnumValue(from, CXTemplateArgumentKindValues, "CXTemplateArgumentKind", prefix = NA) )
 setAs("integer", "CXTemplateArgumentKind", function(from) asEnumValue(from, CXTemplateArgumentKindValues, "CXTemplateArgumentKind", prefix = NA) )
 setAs("numeric", "CXTemplateArgumentKind", function(from) asEnumValue(from, CXTemplateArgumentKindValues, "CXTemplateArgumentKind", prefix = NA) )


#####################################
setClass("CXTypeLayoutError", contains = "EnumValue")

CXTypeLayoutError = CXTypeLayoutErrorValues = structure(c(-1L, -2L, -3L, -4L, -5L), .Names = c('CXTypeLayoutError_Invalid', 'CXTypeLayoutError_Incomplete', 'CXTypeLayoutError_Dependent', 'CXTypeLayoutError_NotConstantSize', 'CXTypeLayoutError_InvalidFieldName'))

`CXTypeLayoutError_Invalid` = GenericEnumValue('CXTypeLayoutError_Invalid', -1L, 'CXTypeLayoutError')
`CXTypeLayoutError_Incomplete` = GenericEnumValue('CXTypeLayoutError_Incomplete', -2L, 'CXTypeLayoutError')
`CXTypeLayoutError_Dependent` = GenericEnumValue('CXTypeLayoutError_Dependent', -3L, 'CXTypeLayoutError')
`CXTypeLayoutError_NotConstantSize` = GenericEnumValue('CXTypeLayoutError_NotConstantSize', -4L, 'CXTypeLayoutError')
`CXTypeLayoutError_InvalidFieldName` = GenericEnumValue('CXTypeLayoutError_InvalidFieldName', -5L, 'CXTypeLayoutError')

 setAs("character", "CXTypeLayoutError", function(from) asEnumValue(from, CXTypeLayoutErrorValues, "CXTypeLayoutError", prefix = NA) )
 setAs("integer", "CXTypeLayoutError", function(from) asEnumValue(from, CXTypeLayoutErrorValues, "CXTypeLayoutError", prefix = NA) )
 setAs("numeric", "CXTypeLayoutError", function(from) asEnumValue(from, CXTypeLayoutErrorValues, "CXTypeLayoutError", prefix = NA) )


#####################################
setClass("CXRefQualifierKind", contains = "EnumValue")

CXRefQualifierKind = CXRefQualifierKindValues = structure(c(0L, 1L, 2L), .Names = c('CXRefQualifier_None', 'CXRefQualifier_LValue', 'CXRefQualifier_RValue'))

`CXRefQualifier_None` = GenericEnumValue('CXRefQualifier_None', 0L, 'CXRefQualifierKind')
`CXRefQualifier_LValue` = GenericEnumValue('CXRefQualifier_LValue', 1L, 'CXRefQualifierKind')
`CXRefQualifier_RValue` = GenericEnumValue('CXRefQualifier_RValue', 2L, 'CXRefQualifierKind')

 setAs("character", "CXRefQualifierKind", function(from) asEnumValue(from, CXRefQualifierKindValues, "CXRefQualifierKind", prefix = NA) )
 setAs("integer", "CXRefQualifierKind", function(from) asEnumValue(from, CXRefQualifierKindValues, "CXRefQualifierKind", prefix = NA) )
 setAs("numeric", "CXRefQualifierKind", function(from) asEnumValue(from, CXRefQualifierKindValues, "CXRefQualifierKind", prefix = NA) )


#####################################
setClass("CX_CXXAccessSpecifier", contains = "EnumValue")

CX_CXXAccessSpecifier = CX_CXXAccessSpecifierValues = structure(c(0L, 1L, 2L, 3L), .Names = c('CX_CXXInvalidAccessSpecifier', 'CX_CXXPublic', 'CX_CXXProtected', 'CX_CXXPrivate'))

`CX_CXXInvalidAccessSpecifier` = GenericEnumValue('CX_CXXInvalidAccessSpecifier', 0L, 'CX_CXXAccessSpecifier')
`CX_CXXPublic` = GenericEnumValue('CX_CXXPublic', 1L, 'CX_CXXAccessSpecifier')
`CX_CXXProtected` = GenericEnumValue('CX_CXXProtected', 2L, 'CX_CXXAccessSpecifier')
`CX_CXXPrivate` = GenericEnumValue('CX_CXXPrivate', 3L, 'CX_CXXAccessSpecifier')

 setAs("character", "CX_CXXAccessSpecifier", function(from) asEnumValue(from, CX_CXXAccessSpecifierValues, "CX_CXXAccessSpecifier", prefix = NA) )
 setAs("integer", "CX_CXXAccessSpecifier", function(from) asEnumValue(from, CX_CXXAccessSpecifierValues, "CX_CXXAccessSpecifier", prefix = NA) )
 setAs("numeric", "CX_CXXAccessSpecifier", function(from) asEnumValue(from, CX_CXXAccessSpecifierValues, "CX_CXXAccessSpecifier", prefix = NA) )


#####################################
setClass("CX_StorageClass", contains = "EnumValue")

CX_StorageClass = CX_StorageClassValues = structure(c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L), .Names = c('CX_SC_Invalid', 'CX_SC_None', 'CX_SC_Extern', 'CX_SC_Static', 'CX_SC_PrivateExtern', 'CX_SC_OpenCLWorkGroupLocal', 'CX_SC_Auto', 'CX_SC_Register'))

`CX_SC_Invalid` = GenericEnumValue('CX_SC_Invalid', 0L, 'CX_StorageClass')
`CX_SC_None` = GenericEnumValue('CX_SC_None', 1L, 'CX_StorageClass')
`CX_SC_Extern` = GenericEnumValue('CX_SC_Extern', 2L, 'CX_StorageClass')
`CX_SC_Static` = GenericEnumValue('CX_SC_Static', 3L, 'CX_StorageClass')
`CX_SC_PrivateExtern` = GenericEnumValue('CX_SC_PrivateExtern', 4L, 'CX_StorageClass')
`CX_SC_OpenCLWorkGroupLocal` = GenericEnumValue('CX_SC_OpenCLWorkGroupLocal', 5L, 'CX_StorageClass')
`CX_SC_Auto` = GenericEnumValue('CX_SC_Auto', 6L, 'CX_StorageClass')
`CX_SC_Register` = GenericEnumValue('CX_SC_Register', 7L, 'CX_StorageClass')

 setAs("character", "CX_StorageClass", function(from) asEnumValue(from, CX_StorageClassValues, "CX_StorageClass", prefix = NA) )
 setAs("integer", "CX_StorageClass", function(from) asEnumValue(from, CX_StorageClassValues, "CX_StorageClass", prefix = NA) )
 setAs("numeric", "CX_StorageClass", function(from) asEnumValue(from, CX_StorageClassValues, "CX_StorageClass", prefix = NA) )


#####################################
setClass("CXChildVisitResult", contains = "EnumValue")

CXChildVisitResult = CXChildVisitResultValues = structure(c(0L, 1L, 2L), .Names = c('CXChildVisit_Break', 'CXChildVisit_Continue', 'CXChildVisit_Recurse'))

`CXChildVisit_Break` = GenericEnumValue('CXChildVisit_Break', 0L, 'CXChildVisitResult')
`CXChildVisit_Continue` = GenericEnumValue('CXChildVisit_Continue', 1L, 'CXChildVisitResult')
`CXChildVisit_Recurse` = GenericEnumValue('CXChildVisit_Recurse', 2L, 'CXChildVisitResult')

 setAs("character", "CXChildVisitResult", function(from) asEnumValue(from, CXChildVisitResultValues, "CXChildVisitResult", prefix = NA) )
 setAs("integer", "CXChildVisitResult", function(from) asEnumValue(from, CXChildVisitResultValues, "CXChildVisitResult", prefix = NA) )
 setAs("numeric", "CXChildVisitResult", function(from) asEnumValue(from, CXChildVisitResultValues, "CXChildVisitResult", prefix = NA) )


#####################################
setClass("CXObjCPropertyAttrKind", contains = "EnumValue")

CXObjCPropertyAttrKind = CXObjCPropertyAttrKindValues = structure(c(0L, 1L, 2L, 4L, 8L, 16L, 32L, 64L, 128L, 256L, 512L, 1024L, 2048L), .Names = c('CXObjCPropertyAttr_noattr', 'CXObjCPropertyAttr_readonly', 'CXObjCPropertyAttr_getter', 'CXObjCPropertyAttr_assign', 'CXObjCPropertyAttr_readwrite', 'CXObjCPropertyAttr_retain', 'CXObjCPropertyAttr_copy', 'CXObjCPropertyAttr_nonatomic', 'CXObjCPropertyAttr_setter', 'CXObjCPropertyAttr_atomic', 'CXObjCPropertyAttr_weak', 'CXObjCPropertyAttr_strong', 'CXObjCPropertyAttr_unsafe_unretained'))

`CXObjCPropertyAttr_noattr` = GenericEnumValue('CXObjCPropertyAttr_noattr', 0L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_readonly` = GenericEnumValue('CXObjCPropertyAttr_readonly', 1L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_getter` = GenericEnumValue('CXObjCPropertyAttr_getter', 2L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_assign` = GenericEnumValue('CXObjCPropertyAttr_assign', 4L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_readwrite` = GenericEnumValue('CXObjCPropertyAttr_readwrite', 8L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_retain` = GenericEnumValue('CXObjCPropertyAttr_retain', 16L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_copy` = GenericEnumValue('CXObjCPropertyAttr_copy', 32L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_nonatomic` = GenericEnumValue('CXObjCPropertyAttr_nonatomic', 64L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_setter` = GenericEnumValue('CXObjCPropertyAttr_setter', 128L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_atomic` = GenericEnumValue('CXObjCPropertyAttr_atomic', 256L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_weak` = GenericEnumValue('CXObjCPropertyAttr_weak', 512L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_strong` = GenericEnumValue('CXObjCPropertyAttr_strong', 1024L, 'CXObjCPropertyAttrKind')
`CXObjCPropertyAttr_unsafe_unretained` = GenericEnumValue('CXObjCPropertyAttr_unsafe_unretained', 2048L, 'CXObjCPropertyAttrKind')

 setAs("character", "CXObjCPropertyAttrKind", function(from) asEnumValue(from, CXObjCPropertyAttrKindValues, "CXObjCPropertyAttrKind", prefix = NA) )
 setAs("integer", "CXObjCPropertyAttrKind", function(from) asEnumValue(from, CXObjCPropertyAttrKindValues, "CXObjCPropertyAttrKind", prefix = NA) )
 setAs("numeric", "CXObjCPropertyAttrKind", function(from) asEnumValue(from, CXObjCPropertyAttrKindValues, "CXObjCPropertyAttrKind", prefix = NA) )


#####################################
setClass("CXObjCDeclQualifierKind", contains = "EnumValue")

CXObjCDeclQualifierKind = CXObjCDeclQualifierKindValues = structure(c(0L, 1L, 2L, 4L, 8L, 16L, 32L), .Names = c('CXObjCDeclQualifier_None', 'CXObjCDeclQualifier_In', 'CXObjCDeclQualifier_Inout', 'CXObjCDeclQualifier_Out', 'CXObjCDeclQualifier_Bycopy', 'CXObjCDeclQualifier_Byref', 'CXObjCDeclQualifier_Oneway'))

`CXObjCDeclQualifier_None` = GenericEnumValue('CXObjCDeclQualifier_None', 0L, 'CXObjCDeclQualifierKind')
`CXObjCDeclQualifier_In` = GenericEnumValue('CXObjCDeclQualifier_In', 1L, 'CXObjCDeclQualifierKind')
`CXObjCDeclQualifier_Inout` = GenericEnumValue('CXObjCDeclQualifier_Inout', 2L, 'CXObjCDeclQualifierKind')
`CXObjCDeclQualifier_Out` = GenericEnumValue('CXObjCDeclQualifier_Out', 4L, 'CXObjCDeclQualifierKind')
`CXObjCDeclQualifier_Bycopy` = GenericEnumValue('CXObjCDeclQualifier_Bycopy', 8L, 'CXObjCDeclQualifierKind')
`CXObjCDeclQualifier_Byref` = GenericEnumValue('CXObjCDeclQualifier_Byref', 16L, 'CXObjCDeclQualifierKind')
`CXObjCDeclQualifier_Oneway` = GenericEnumValue('CXObjCDeclQualifier_Oneway', 32L, 'CXObjCDeclQualifierKind')

 setAs("character", "CXObjCDeclQualifierKind", function(from) asEnumValue(from, CXObjCDeclQualifierKindValues, "CXObjCDeclQualifierKind", prefix = NA) )
 setAs("integer", "CXObjCDeclQualifierKind", function(from) asEnumValue(from, CXObjCDeclQualifierKindValues, "CXObjCDeclQualifierKind", prefix = NA) )
 setAs("numeric", "CXObjCDeclQualifierKind", function(from) asEnumValue(from, CXObjCDeclQualifierKindValues, "CXObjCDeclQualifierKind", prefix = NA) )


#####################################
setClass("CXNameRefFlags", contains = "EnumValue")

CXNameRefFlags = CXNameRefFlagsValues = structure(c(1L, 2L, 4L), .Names = c('CXNameRange_WantQualifier', 'CXNameRange_WantTemplateArgs', 'CXNameRange_WantSinglePiece'))

`CXNameRange_WantQualifier` = GenericEnumValue('CXNameRange_WantQualifier', 1L, 'CXNameRefFlags')
`CXNameRange_WantTemplateArgs` = GenericEnumValue('CXNameRange_WantTemplateArgs', 2L, 'CXNameRefFlags')
`CXNameRange_WantSinglePiece` = GenericEnumValue('CXNameRange_WantSinglePiece', 4L, 'CXNameRefFlags')

 setAs("character", "CXNameRefFlags", function(from) asEnumValue(from, CXNameRefFlagsValues, "CXNameRefFlags", prefix = NA) )
 setAs("integer", "CXNameRefFlags", function(from) asEnumValue(from, CXNameRefFlagsValues, "CXNameRefFlags", prefix = NA) )
 setAs("numeric", "CXNameRefFlags", function(from) asEnumValue(from, CXNameRefFlagsValues, "CXNameRefFlags", prefix = NA) )


#####################################
setClass("CXTokenKind", contains = "EnumValue")

CXTokenKind = CXTokenKindValues = structure(c(0L, 1L, 2L, 3L, 4L), .Names = c('CXToken_Punctuation', 'CXToken_Keyword', 'CXToken_Identifier', 'CXToken_Literal', 'CXToken_Comment'))

`CXToken_Punctuation` = GenericEnumValue('CXToken_Punctuation', 0L, 'CXTokenKind')
`CXToken_Keyword` = GenericEnumValue('CXToken_Keyword', 1L, 'CXTokenKind')
`CXToken_Identifier` = GenericEnumValue('CXToken_Identifier', 2L, 'CXTokenKind')
`CXToken_Literal` = GenericEnumValue('CXToken_Literal', 3L, 'CXTokenKind')
`CXToken_Comment` = GenericEnumValue('CXToken_Comment', 4L, 'CXTokenKind')

 setAs("character", "CXTokenKind", function(from) asEnumValue(from, CXTokenKindValues, "CXTokenKind", prefix = NA) )
 setAs("integer", "CXTokenKind", function(from) asEnumValue(from, CXTokenKindValues, "CXTokenKind", prefix = NA) )
 setAs("numeric", "CXTokenKind", function(from) asEnumValue(from, CXTokenKindValues, "CXTokenKind", prefix = NA) )


#####################################
setClass("CXCompletionChunkKind", contains = "EnumValue")

CXCompletionChunkKind = CXCompletionChunkKindValues = structure(c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 14L, 15L, 16L, 17L, 18L, 19L, 20L), .Names = c('CXCompletionChunk_Optional', 'CXCompletionChunk_TypedText', 'CXCompletionChunk_Text', 'CXCompletionChunk_Placeholder', 'CXCompletionChunk_Informative', 'CXCompletionChunk_CurrentParameter', 'CXCompletionChunk_LeftParen', 'CXCompletionChunk_RightParen', 'CXCompletionChunk_LeftBracket', 'CXCompletionChunk_RightBracket', 'CXCompletionChunk_LeftBrace', 'CXCompletionChunk_RightBrace', 'CXCompletionChunk_LeftAngle', 'CXCompletionChunk_RightAngle', 'CXCompletionChunk_Comma', 'CXCompletionChunk_ResultType', 'CXCompletionChunk_Colon', 'CXCompletionChunk_SemiColon', 'CXCompletionChunk_Equal', 'CXCompletionChunk_HorizontalSpace', 'CXCompletionChunk_VerticalSpace'))

`CXCompletionChunk_Optional` = GenericEnumValue('CXCompletionChunk_Optional', 0L, 'CXCompletionChunkKind')
`CXCompletionChunk_TypedText` = GenericEnumValue('CXCompletionChunk_TypedText', 1L, 'CXCompletionChunkKind')
`CXCompletionChunk_Text` = GenericEnumValue('CXCompletionChunk_Text', 2L, 'CXCompletionChunkKind')
`CXCompletionChunk_Placeholder` = GenericEnumValue('CXCompletionChunk_Placeholder', 3L, 'CXCompletionChunkKind')
`CXCompletionChunk_Informative` = GenericEnumValue('CXCompletionChunk_Informative', 4L, 'CXCompletionChunkKind')
`CXCompletionChunk_CurrentParameter` = GenericEnumValue('CXCompletionChunk_CurrentParameter', 5L, 'CXCompletionChunkKind')
`CXCompletionChunk_LeftParen` = GenericEnumValue('CXCompletionChunk_LeftParen', 6L, 'CXCompletionChunkKind')
`CXCompletionChunk_RightParen` = GenericEnumValue('CXCompletionChunk_RightParen', 7L, 'CXCompletionChunkKind')
`CXCompletionChunk_LeftBracket` = GenericEnumValue('CXCompletionChunk_LeftBracket', 8L, 'CXCompletionChunkKind')
`CXCompletionChunk_RightBracket` = GenericEnumValue('CXCompletionChunk_RightBracket', 9L, 'CXCompletionChunkKind')
`CXCompletionChunk_LeftBrace` = GenericEnumValue('CXCompletionChunk_LeftBrace', 10L, 'CXCompletionChunkKind')
`CXCompletionChunk_RightBrace` = GenericEnumValue('CXCompletionChunk_RightBrace', 11L, 'CXCompletionChunkKind')
`CXCompletionChunk_LeftAngle` = GenericEnumValue('CXCompletionChunk_LeftAngle', 12L, 'CXCompletionChunkKind')
`CXCompletionChunk_RightAngle` = GenericEnumValue('CXCompletionChunk_RightAngle', 13L, 'CXCompletionChunkKind')
`CXCompletionChunk_Comma` = GenericEnumValue('CXCompletionChunk_Comma', 14L, 'CXCompletionChunkKind')
`CXCompletionChunk_ResultType` = GenericEnumValue('CXCompletionChunk_ResultType', 15L, 'CXCompletionChunkKind')
`CXCompletionChunk_Colon` = GenericEnumValue('CXCompletionChunk_Colon', 16L, 'CXCompletionChunkKind')
`CXCompletionChunk_SemiColon` = GenericEnumValue('CXCompletionChunk_SemiColon', 17L, 'CXCompletionChunkKind')
`CXCompletionChunk_Equal` = GenericEnumValue('CXCompletionChunk_Equal', 18L, 'CXCompletionChunkKind')
`CXCompletionChunk_HorizontalSpace` = GenericEnumValue('CXCompletionChunk_HorizontalSpace', 19L, 'CXCompletionChunkKind')
`CXCompletionChunk_VerticalSpace` = GenericEnumValue('CXCompletionChunk_VerticalSpace', 20L, 'CXCompletionChunkKind')

 setAs("character", "CXCompletionChunkKind", function(from) asEnumValue(from, CXCompletionChunkKindValues, "CXCompletionChunkKind", prefix = NA) )
 setAs("integer", "CXCompletionChunkKind", function(from) asEnumValue(from, CXCompletionChunkKindValues, "CXCompletionChunkKind", prefix = NA) )
 setAs("numeric", "CXCompletionChunkKind", function(from) asEnumValue(from, CXCompletionChunkKindValues, "CXCompletionChunkKind", prefix = NA) )


#####################################
setClass("CXCodeComplete_Flags", contains = "EnumValue")

CXCodeComplete_Flags = CXCodeComplete_FlagsValues = structure(c(1L, 2L, 4L), .Names = c('CXCodeComplete_IncludeMacros', 'CXCodeComplete_IncludeCodePatterns', 'CXCodeComplete_IncludeBriefComments'))

`CXCodeComplete_IncludeMacros` = GenericEnumValue('CXCodeComplete_IncludeMacros', 1L, 'CXCodeComplete_Flags')
`CXCodeComplete_IncludeCodePatterns` = GenericEnumValue('CXCodeComplete_IncludeCodePatterns', 2L, 'CXCodeComplete_Flags')
`CXCodeComplete_IncludeBriefComments` = GenericEnumValue('CXCodeComplete_IncludeBriefComments', 4L, 'CXCodeComplete_Flags')

 setAs("character", "CXCodeComplete_Flags", function(from) asEnumValue(from, CXCodeComplete_FlagsValues, "CXCodeComplete_Flags", prefix = NA) )
 setAs("integer", "CXCodeComplete_Flags", function(from) asEnumValue(from, CXCodeComplete_FlagsValues, "CXCodeComplete_Flags", prefix = NA) )
 setAs("numeric", "CXCodeComplete_Flags", function(from) asEnumValue(from, CXCodeComplete_FlagsValues, "CXCodeComplete_Flags", prefix = NA) )


#####################################
setClass("CXCompletionContext", contains = "EnumValue")

CXCompletionContext = CXCompletionContextValues = structure(c(0L, 1L, 2L, 4L, 8L, 16L, 32L, 64L, 128L, 256L, 512L, 1024L, 2048L, 4096L, 8192L, 16384L, 32768L, 65536L, 131072L, 262144L, 524288L, 1048576L, 2097152L, NA), .Names = c('CXCompletionContext_Unexposed', 'CXCompletionContext_AnyType', 'CXCompletionContext_AnyValue', 'CXCompletionContext_ObjCObjectValue', 'CXCompletionContext_ObjCSelectorValue', 'CXCompletionContext_CXXClassTypeValue', 'CXCompletionContext_DotMemberAccess', 'CXCompletionContext_ArrowMemberAccess', 'CXCompletionContext_ObjCPropertyAccess', 'CXCompletionContext_EnumTag', 'CXCompletionContext_UnionTag', 'CXCompletionContext_StructTag', 'CXCompletionContext_ClassTag', 'CXCompletionContext_Namespace', 'CXCompletionContext_NestedNameSpecifier', 'CXCompletionContext_ObjCInterface', 'CXCompletionContext_ObjCProtocol', 'CXCompletionContext_ObjCCategory', 'CXCompletionContext_ObjCInstanceMessage', 'CXCompletionContext_ObjCClassMessage', 'CXCompletionContext_ObjCSelectorName', 'CXCompletionContext_MacroName', 'CXCompletionContext_NaturalLanguage', 'CXCompletionContext_Unknown'))

`CXCompletionContext_Unexposed` = GenericEnumValue('CXCompletionContext_Unexposed', 0L, 'CXCompletionContext')
`CXCompletionContext_AnyType` = GenericEnumValue('CXCompletionContext_AnyType', 1L, 'CXCompletionContext')
`CXCompletionContext_AnyValue` = GenericEnumValue('CXCompletionContext_AnyValue', 2L, 'CXCompletionContext')
`CXCompletionContext_ObjCObjectValue` = GenericEnumValue('CXCompletionContext_ObjCObjectValue', 4L, 'CXCompletionContext')
`CXCompletionContext_ObjCSelectorValue` = GenericEnumValue('CXCompletionContext_ObjCSelectorValue', 8L, 'CXCompletionContext')
`CXCompletionContext_CXXClassTypeValue` = GenericEnumValue('CXCompletionContext_CXXClassTypeValue', 16L, 'CXCompletionContext')
`CXCompletionContext_DotMemberAccess` = GenericEnumValue('CXCompletionContext_DotMemberAccess', 32L, 'CXCompletionContext')
`CXCompletionContext_ArrowMemberAccess` = GenericEnumValue('CXCompletionContext_ArrowMemberAccess', 64L, 'CXCompletionContext')
`CXCompletionContext_ObjCPropertyAccess` = GenericEnumValue('CXCompletionContext_ObjCPropertyAccess', 128L, 'CXCompletionContext')
`CXCompletionContext_EnumTag` = GenericEnumValue('CXCompletionContext_EnumTag', 256L, 'CXCompletionContext')
`CXCompletionContext_UnionTag` = GenericEnumValue('CXCompletionContext_UnionTag', 512L, 'CXCompletionContext')
`CXCompletionContext_StructTag` = GenericEnumValue('CXCompletionContext_StructTag', 1024L, 'CXCompletionContext')
`CXCompletionContext_ClassTag` = GenericEnumValue('CXCompletionContext_ClassTag', 2048L, 'CXCompletionContext')
`CXCompletionContext_Namespace` = GenericEnumValue('CXCompletionContext_Namespace', 4096L, 'CXCompletionContext')
`CXCompletionContext_NestedNameSpecifier` = GenericEnumValue('CXCompletionContext_NestedNameSpecifier', 8192L, 'CXCompletionContext')
`CXCompletionContext_ObjCInterface` = GenericEnumValue('CXCompletionContext_ObjCInterface', 16384L, 'CXCompletionContext')
`CXCompletionContext_ObjCProtocol` = GenericEnumValue('CXCompletionContext_ObjCProtocol', 32768L, 'CXCompletionContext')
`CXCompletionContext_ObjCCategory` = GenericEnumValue('CXCompletionContext_ObjCCategory', 65536L, 'CXCompletionContext')
`CXCompletionContext_ObjCInstanceMessage` = GenericEnumValue('CXCompletionContext_ObjCInstanceMessage', 131072L, 'CXCompletionContext')
`CXCompletionContext_ObjCClassMessage` = GenericEnumValue('CXCompletionContext_ObjCClassMessage', 262144L, 'CXCompletionContext')
`CXCompletionContext_ObjCSelectorName` = GenericEnumValue('CXCompletionContext_ObjCSelectorName', 524288L, 'CXCompletionContext')
`CXCompletionContext_MacroName` = GenericEnumValue('CXCompletionContext_MacroName', 1048576L, 'CXCompletionContext')
`CXCompletionContext_NaturalLanguage` = GenericEnumValue('CXCompletionContext_NaturalLanguage', 2097152L, 'CXCompletionContext')
`CXCompletionContext_Unknown` = GenericEnumValue('CXCompletionContext_Unknown', NA, 'CXCompletionContext')

 setAs("character", "CXCompletionContext", function(from) asEnumValue(from, CXCompletionContextValues, "CXCompletionContext", prefix = NA) )
 setAs("integer", "CXCompletionContext", function(from) asEnumValue(from, CXCompletionContextValues, "CXCompletionContext", prefix = NA) )
 setAs("numeric", "CXCompletionContext", function(from) asEnumValue(from, CXCompletionContextValues, "CXCompletionContext", prefix = NA) )


#####################################
setClass("CXVisitorResult", contains = "EnumValue")

CXVisitorResult = CXVisitorResultValues = structure(c(0L, 1L), .Names = c('CXVisit_Break', 'CXVisit_Continue'))

`CXVisit_Break` = GenericEnumValue('CXVisit_Break', 0L, 'CXVisitorResult')
`CXVisit_Continue` = GenericEnumValue('CXVisit_Continue', 1L, 'CXVisitorResult')

 setAs("character", "CXVisitorResult", function(from) asEnumValue(from, CXVisitorResultValues, "CXVisitorResult", prefix = NA) )
 setAs("integer", "CXVisitorResult", function(from) asEnumValue(from, CXVisitorResultValues, "CXVisitorResult", prefix = NA) )
 setAs("numeric", "CXVisitorResult", function(from) asEnumValue(from, CXVisitorResultValues, "CXVisitorResult", prefix = NA) )


#####################################
setClass("CXResult", contains = "EnumValue")

CXResult = CXResultValues = structure(c(0L, 1L, 2L), .Names = c('CXResult_Success', 'CXResult_Invalid', 'CXResult_VisitBreak'))

`CXResult_Success` = GenericEnumValue('CXResult_Success', 0L, 'CXResult')
`CXResult_Invalid` = GenericEnumValue('CXResult_Invalid', 1L, 'CXResult')
`CXResult_VisitBreak` = GenericEnumValue('CXResult_VisitBreak', 2L, 'CXResult')

 setAs("character", "CXResult", function(from) asEnumValue(from, CXResultValues, "CXResult", prefix = NA) )
 setAs("integer", "CXResult", function(from) asEnumValue(from, CXResultValues, "CXResult", prefix = NA) )
 setAs("numeric", "CXResult", function(from) asEnumValue(from, CXResultValues, "CXResult", prefix = NA) )


#####################################
setClass("CXIdxEntityKind", contains = "EnumValue")

CXIdxEntityKind = CXIdxEntityKindValues = structure(c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 14L, 15L, 16L, 17L, 18L, 19L, 20L, 21L, 22L, 23L, 24L, 25L, 26L), .Names = c('CXIdxEntity_Unexposed', 'CXIdxEntity_Typedef', 'CXIdxEntity_Function', 'CXIdxEntity_Variable', 'CXIdxEntity_Field', 'CXIdxEntity_EnumConstant', 'CXIdxEntity_ObjCClass', 'CXIdxEntity_ObjCProtocol', 'CXIdxEntity_ObjCCategory', 'CXIdxEntity_ObjCInstanceMethod', 'CXIdxEntity_ObjCClassMethod', 'CXIdxEntity_ObjCProperty', 'CXIdxEntity_ObjCIvar', 'CXIdxEntity_Enum', 'CXIdxEntity_Struct', 'CXIdxEntity_Union', 'CXIdxEntity_CXXClass', 'CXIdxEntity_CXXNamespace', 'CXIdxEntity_CXXNamespaceAlias', 'CXIdxEntity_CXXStaticVariable', 'CXIdxEntity_CXXStaticMethod', 'CXIdxEntity_CXXInstanceMethod', 'CXIdxEntity_CXXConstructor', 'CXIdxEntity_CXXDestructor', 'CXIdxEntity_CXXConversionFunction', 'CXIdxEntity_CXXTypeAlias', 'CXIdxEntity_CXXInterface'))

`CXIdxEntity_Unexposed` = GenericEnumValue('CXIdxEntity_Unexposed', 0L, 'CXIdxEntityKind')
`CXIdxEntity_Typedef` = GenericEnumValue('CXIdxEntity_Typedef', 1L, 'CXIdxEntityKind')
`CXIdxEntity_Function` = GenericEnumValue('CXIdxEntity_Function', 2L, 'CXIdxEntityKind')
`CXIdxEntity_Variable` = GenericEnumValue('CXIdxEntity_Variable', 3L, 'CXIdxEntityKind')
`CXIdxEntity_Field` = GenericEnumValue('CXIdxEntity_Field', 4L, 'CXIdxEntityKind')
`CXIdxEntity_EnumConstant` = GenericEnumValue('CXIdxEntity_EnumConstant', 5L, 'CXIdxEntityKind')
`CXIdxEntity_ObjCClass` = GenericEnumValue('CXIdxEntity_ObjCClass', 6L, 'CXIdxEntityKind')
`CXIdxEntity_ObjCProtocol` = GenericEnumValue('CXIdxEntity_ObjCProtocol', 7L, 'CXIdxEntityKind')
`CXIdxEntity_ObjCCategory` = GenericEnumValue('CXIdxEntity_ObjCCategory', 8L, 'CXIdxEntityKind')
`CXIdxEntity_ObjCInstanceMethod` = GenericEnumValue('CXIdxEntity_ObjCInstanceMethod', 9L, 'CXIdxEntityKind')
`CXIdxEntity_ObjCClassMethod` = GenericEnumValue('CXIdxEntity_ObjCClassMethod', 10L, 'CXIdxEntityKind')
`CXIdxEntity_ObjCProperty` = GenericEnumValue('CXIdxEntity_ObjCProperty', 11L, 'CXIdxEntityKind')
`CXIdxEntity_ObjCIvar` = GenericEnumValue('CXIdxEntity_ObjCIvar', 12L, 'CXIdxEntityKind')
`CXIdxEntity_Enum` = GenericEnumValue('CXIdxEntity_Enum', 13L, 'CXIdxEntityKind')
`CXIdxEntity_Struct` = GenericEnumValue('CXIdxEntity_Struct', 14L, 'CXIdxEntityKind')
`CXIdxEntity_Union` = GenericEnumValue('CXIdxEntity_Union', 15L, 'CXIdxEntityKind')
`CXIdxEntity_CXXClass` = GenericEnumValue('CXIdxEntity_CXXClass', 16L, 'CXIdxEntityKind')
`CXIdxEntity_CXXNamespace` = GenericEnumValue('CXIdxEntity_CXXNamespace', 17L, 'CXIdxEntityKind')
`CXIdxEntity_CXXNamespaceAlias` = GenericEnumValue('CXIdxEntity_CXXNamespaceAlias', 18L, 'CXIdxEntityKind')
`CXIdxEntity_CXXStaticVariable` = GenericEnumValue('CXIdxEntity_CXXStaticVariable', 19L, 'CXIdxEntityKind')
`CXIdxEntity_CXXStaticMethod` = GenericEnumValue('CXIdxEntity_CXXStaticMethod', 20L, 'CXIdxEntityKind')
`CXIdxEntity_CXXInstanceMethod` = GenericEnumValue('CXIdxEntity_CXXInstanceMethod', 21L, 'CXIdxEntityKind')
`CXIdxEntity_CXXConstructor` = GenericEnumValue('CXIdxEntity_CXXConstructor', 22L, 'CXIdxEntityKind')
`CXIdxEntity_CXXDestructor` = GenericEnumValue('CXIdxEntity_CXXDestructor', 23L, 'CXIdxEntityKind')
`CXIdxEntity_CXXConversionFunction` = GenericEnumValue('CXIdxEntity_CXXConversionFunction', 24L, 'CXIdxEntityKind')
`CXIdxEntity_CXXTypeAlias` = GenericEnumValue('CXIdxEntity_CXXTypeAlias', 25L, 'CXIdxEntityKind')
`CXIdxEntity_CXXInterface` = GenericEnumValue('CXIdxEntity_CXXInterface', 26L, 'CXIdxEntityKind')

 setAs("character", "CXIdxEntityKind", function(from) asEnumValue(from, CXIdxEntityKindValues, "CXIdxEntityKind", prefix = NA) )
 setAs("integer", "CXIdxEntityKind", function(from) asEnumValue(from, CXIdxEntityKindValues, "CXIdxEntityKind", prefix = NA) )
 setAs("numeric", "CXIdxEntityKind", function(from) asEnumValue(from, CXIdxEntityKindValues, "CXIdxEntityKind", prefix = NA) )


#####################################
setClass("CXIdxEntityLanguage", contains = "EnumValue")

CXIdxEntityLanguage = CXIdxEntityLanguageValues = structure(c(0L, 1L, 2L, 3L), .Names = c('CXIdxEntityLang_None', 'CXIdxEntityLang_C', 'CXIdxEntityLang_ObjC', 'CXIdxEntityLang_CXX'))

`CXIdxEntityLang_None` = GenericEnumValue('CXIdxEntityLang_None', 0L, 'CXIdxEntityLanguage')
`CXIdxEntityLang_C` = GenericEnumValue('CXIdxEntityLang_C', 1L, 'CXIdxEntityLanguage')
`CXIdxEntityLang_ObjC` = GenericEnumValue('CXIdxEntityLang_ObjC', 2L, 'CXIdxEntityLanguage')
`CXIdxEntityLang_CXX` = GenericEnumValue('CXIdxEntityLang_CXX', 3L, 'CXIdxEntityLanguage')

 setAs("character", "CXIdxEntityLanguage", function(from) asEnumValue(from, CXIdxEntityLanguageValues, "CXIdxEntityLanguage", prefix = NA) )
 setAs("integer", "CXIdxEntityLanguage", function(from) asEnumValue(from, CXIdxEntityLanguageValues, "CXIdxEntityLanguage", prefix = NA) )
 setAs("numeric", "CXIdxEntityLanguage", function(from) asEnumValue(from, CXIdxEntityLanguageValues, "CXIdxEntityLanguage", prefix = NA) )


#####################################
setClass("CXIdxEntityCXXTemplateKind", contains = "EnumValue")

CXIdxEntityCXXTemplateKind = CXIdxEntityCXXTemplateKindValues = structure(c(0L, 1L, 2L, 3L), .Names = c('CXIdxEntity_NonTemplate', 'CXIdxEntity_Template', 'CXIdxEntity_TemplatePartialSpecialization', 'CXIdxEntity_TemplateSpecialization'))

`CXIdxEntity_NonTemplate` = GenericEnumValue('CXIdxEntity_NonTemplate', 0L, 'CXIdxEntityCXXTemplateKind')
`CXIdxEntity_Template` = GenericEnumValue('CXIdxEntity_Template', 1L, 'CXIdxEntityCXXTemplateKind')
`CXIdxEntity_TemplatePartialSpecialization` = GenericEnumValue('CXIdxEntity_TemplatePartialSpecialization', 2L, 'CXIdxEntityCXXTemplateKind')
`CXIdxEntity_TemplateSpecialization` = GenericEnumValue('CXIdxEntity_TemplateSpecialization', 3L, 'CXIdxEntityCXXTemplateKind')

 setAs("character", "CXIdxEntityCXXTemplateKind", function(from) asEnumValue(from, CXIdxEntityCXXTemplateKindValues, "CXIdxEntityCXXTemplateKind", prefix = NA) )
 setAs("integer", "CXIdxEntityCXXTemplateKind", function(from) asEnumValue(from, CXIdxEntityCXXTemplateKindValues, "CXIdxEntityCXXTemplateKind", prefix = NA) )
 setAs("numeric", "CXIdxEntityCXXTemplateKind", function(from) asEnumValue(from, CXIdxEntityCXXTemplateKindValues, "CXIdxEntityCXXTemplateKind", prefix = NA) )


#####################################
setClass("CXIdxAttrKind", contains = "EnumValue")

CXIdxAttrKind = CXIdxAttrKindValues = structure(c(0L, 1L, 2L, 3L), .Names = c('CXIdxAttr_Unexposed', 'CXIdxAttr_IBAction', 'CXIdxAttr_IBOutlet', 'CXIdxAttr_IBOutletCollection'))

`CXIdxAttr_Unexposed` = GenericEnumValue('CXIdxAttr_Unexposed', 0L, 'CXIdxAttrKind')
`CXIdxAttr_IBAction` = GenericEnumValue('CXIdxAttr_IBAction', 1L, 'CXIdxAttrKind')
`CXIdxAttr_IBOutlet` = GenericEnumValue('CXIdxAttr_IBOutlet', 2L, 'CXIdxAttrKind')
`CXIdxAttr_IBOutletCollection` = GenericEnumValue('CXIdxAttr_IBOutletCollection', 3L, 'CXIdxAttrKind')

 setAs("character", "CXIdxAttrKind", function(from) asEnumValue(from, CXIdxAttrKindValues, "CXIdxAttrKind", prefix = NA) )
 setAs("integer", "CXIdxAttrKind", function(from) asEnumValue(from, CXIdxAttrKindValues, "CXIdxAttrKind", prefix = NA) )
 setAs("numeric", "CXIdxAttrKind", function(from) asEnumValue(from, CXIdxAttrKindValues, "CXIdxAttrKind", prefix = NA) )


#####################################
setClass("CXIdxDeclInfoFlags", contains = "EnumValue")

CXIdxDeclInfoFlags = CXIdxDeclInfoFlagsValues = structure(c(1L), .Names = c('CXIdxDeclFlag_Skipped'))

`CXIdxDeclFlag_Skipped` = GenericEnumValue('CXIdxDeclFlag_Skipped', 1L, 'CXIdxDeclInfoFlags')

 setAs("character", "CXIdxDeclInfoFlags", function(from) asEnumValue(from, CXIdxDeclInfoFlagsValues, "CXIdxDeclInfoFlags", prefix = NA) )
 setAs("integer", "CXIdxDeclInfoFlags", function(from) asEnumValue(from, CXIdxDeclInfoFlagsValues, "CXIdxDeclInfoFlags", prefix = NA) )
 setAs("numeric", "CXIdxDeclInfoFlags", function(from) asEnumValue(from, CXIdxDeclInfoFlagsValues, "CXIdxDeclInfoFlags", prefix = NA) )


#####################################
setClass("CXIdxObjCContainerKind", contains = "EnumValue")

CXIdxObjCContainerKind = CXIdxObjCContainerKindValues = structure(c(0L, 1L, 2L), .Names = c('CXIdxObjCContainer_ForwardRef', 'CXIdxObjCContainer_Interface', 'CXIdxObjCContainer_Implementation'))

`CXIdxObjCContainer_ForwardRef` = GenericEnumValue('CXIdxObjCContainer_ForwardRef', 0L, 'CXIdxObjCContainerKind')
`CXIdxObjCContainer_Interface` = GenericEnumValue('CXIdxObjCContainer_Interface', 1L, 'CXIdxObjCContainerKind')
`CXIdxObjCContainer_Implementation` = GenericEnumValue('CXIdxObjCContainer_Implementation', 2L, 'CXIdxObjCContainerKind')

 setAs("character", "CXIdxObjCContainerKind", function(from) asEnumValue(from, CXIdxObjCContainerKindValues, "CXIdxObjCContainerKind", prefix = NA) )
 setAs("integer", "CXIdxObjCContainerKind", function(from) asEnumValue(from, CXIdxObjCContainerKindValues, "CXIdxObjCContainerKind", prefix = NA) )
 setAs("numeric", "CXIdxObjCContainerKind", function(from) asEnumValue(from, CXIdxObjCContainerKindValues, "CXIdxObjCContainerKind", prefix = NA) )


#####################################
setClass("CXIdxEntityRefKind", contains = "EnumValue")

CXIdxEntityRefKind = CXIdxEntityRefKindValues = structure(c(1L, 2L), .Names = c('CXIdxEntityRef_Direct', 'CXIdxEntityRef_Implicit'))

`CXIdxEntityRef_Direct` = GenericEnumValue('CXIdxEntityRef_Direct', 1L, 'CXIdxEntityRefKind')
`CXIdxEntityRef_Implicit` = GenericEnumValue('CXIdxEntityRef_Implicit', 2L, 'CXIdxEntityRefKind')

 setAs("character", "CXIdxEntityRefKind", function(from) asEnumValue(from, CXIdxEntityRefKindValues, "CXIdxEntityRefKind", prefix = NA) )
 setAs("integer", "CXIdxEntityRefKind", function(from) asEnumValue(from, CXIdxEntityRefKindValues, "CXIdxEntityRefKind", prefix = NA) )
 setAs("numeric", "CXIdxEntityRefKind", function(from) asEnumValue(from, CXIdxEntityRefKindValues, "CXIdxEntityRefKind", prefix = NA) )


#####################################
setClass("CXIndexOptFlags", contains = "EnumValue")

CXIndexOptFlags = CXIndexOptFlagsValues = structure(c(0L, 1L, 2L, 4L, 8L, 16L), .Names = c('CXIndexOpt_None', 'CXIndexOpt_SuppressRedundantRefs', 'CXIndexOpt_IndexFunctionLocalSymbols', 'CXIndexOpt_IndexImplicitTemplateInstantiations', 'CXIndexOpt_SuppressWarnings', 'CXIndexOpt_SkipParsedBodiesInSession'))

`CXIndexOpt_None` = GenericEnumValue('CXIndexOpt_None', 0L, 'CXIndexOptFlags')
`CXIndexOpt_SuppressRedundantRefs` = GenericEnumValue('CXIndexOpt_SuppressRedundantRefs', 1L, 'CXIndexOptFlags')
`CXIndexOpt_IndexFunctionLocalSymbols` = GenericEnumValue('CXIndexOpt_IndexFunctionLocalSymbols', 2L, 'CXIndexOptFlags')
`CXIndexOpt_IndexImplicitTemplateInstantiations` = GenericEnumValue('CXIndexOpt_IndexImplicitTemplateInstantiations', 4L, 'CXIndexOptFlags')
`CXIndexOpt_SuppressWarnings` = GenericEnumValue('CXIndexOpt_SuppressWarnings', 8L, 'CXIndexOptFlags')
`CXIndexOpt_SkipParsedBodiesInSession` = GenericEnumValue('CXIndexOpt_SkipParsedBodiesInSession', 16L, 'CXIndexOptFlags')

 setAs("character", "CXIndexOptFlags", function(from) asEnumValue(from, CXIndexOptFlagsValues, "CXIndexOptFlags", prefix = NA) )
 setAs("integer", "CXIndexOptFlags", function(from) asEnumValue(from, CXIndexOptFlagsValues, "CXIndexOptFlags", prefix = NA) )
 setAs("numeric", "CXIndexOptFlags", function(from) asEnumValue(from, CXIndexOptFlagsValues, "CXIndexOptFlags", prefix = NA) )


#####################################



}


