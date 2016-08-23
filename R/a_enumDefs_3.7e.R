if(all(clangVersionNum(libclangVersion_Install) == c( 3 ,  7 ))) {

`CXError_Success` = 0L
`CXError_Failure` = 1L
`CXError_Crashed` = 2L
`CXError_InvalidArguments` = 3L
`CXError_ASTReadError` = 4L



 `CXErrorCode`  = structure(0:4, .Names = c("CXError_Success", "CXError_Failure", 
"CXError_Crashed", "CXError_InvalidArguments", "CXError_ASTReadError"
))


##########################

`CXAvailability_Available` = 0L
`CXAvailability_Deprecated` = 1L
`CXAvailability_NotAvailable` = 2L
`CXAvailability_NotAccessible` = 3L



 `CXAvailabilityKind`  = structure(0:3, .Names = c("CXAvailability_Available", "CXAvailability_Deprecated", 
"CXAvailability_NotAvailable", "CXAvailability_NotAccessible"
))


##########################

`CXGlobalOpt_None` = 0L
`CXGlobalOpt_ThreadBackgroundPriorityForIndexing` = 1L
`CXGlobalOpt_ThreadBackgroundPriorityForEditing` = 2L
`CXGlobalOpt_ThreadBackgroundPriorityForAll` = 3L



 `CXGlobalOptFlags`  = structure(c(0, 1, 2, 3), .Names = c("CXGlobalOpt_None", "CXGlobalOpt_ThreadBackgroundPriorityForIndexing", 
"CXGlobalOpt_ThreadBackgroundPriorityForEditing", "CXGlobalOpt_ThreadBackgroundPriorityForAll"
))


##########################

`CXDiagnostic_Ignored` = 0L
`CXDiagnostic_Note` = 1L
`CXDiagnostic_Warning` = 2L
`CXDiagnostic_Error` = 3L
`CXDiagnostic_Fatal` = 4L



 `CXDiagnosticSeverity`  = structure(0:4, .Names = c("CXDiagnostic_Ignored", "CXDiagnostic_Note", 
"CXDiagnostic_Warning", "CXDiagnostic_Error", "CXDiagnostic_Fatal"
))


##########################

`CXLoadDiag_None` = 0L
`CXLoadDiag_Unknown` = 1L
`CXLoadDiag_CannotLoad` = 2L
`CXLoadDiag_InvalidFile` = 3L



 `CXLoadDiag_Error`  = structure(0:3, .Names = c("CXLoadDiag_None", "CXLoadDiag_Unknown", 
"CXLoadDiag_CannotLoad", "CXLoadDiag_InvalidFile"))


##########################

`CXDiagnostic_DisplaySourceLocation` = 1L
`CXDiagnostic_DisplayColumn` = 2L
`CXDiagnostic_DisplaySourceRanges` = 4L
`CXDiagnostic_DisplayOption` = 8L
`CXDiagnostic_DisplayCategoryId` = 16L
`CXDiagnostic_DisplayCategoryName` = 32L



 `CXDiagnosticDisplayOptions`  = structure(c(1L, 2L, 4L, 8L, 16L, 32L), .Names = c("CXDiagnostic_DisplaySourceLocation", 
"CXDiagnostic_DisplayColumn", "CXDiagnostic_DisplaySourceRanges", 
"CXDiagnostic_DisplayOption", "CXDiagnostic_DisplayCategoryId", 
"CXDiagnostic_DisplayCategoryName"))


##########################

`CXTranslationUnit_None` = 0L
`CXTranslationUnit_DetailedPreprocessingRecord` = 1L
`CXTranslationUnit_Incomplete` = 2L
`CXTranslationUnit_PrecompiledPreamble` = 4L
`CXTranslationUnit_CacheCompletionResults` = 8L
`CXTranslationUnit_ForSerialization` = 16L
`CXTranslationUnit_CXXChainedPCH` = 32L
`CXTranslationUnit_SkipFunctionBodies` = 64L
`CXTranslationUnit_IncludeBriefCommentsInCodeCompletion` = 128L



 `CXTranslationUnit_Flags`  = structure(c(0L, 1L, 2L, 4L, 8L, 16L, 32L, 64L, 128L), .Names = c("CXTranslationUnit_None", 
"CXTranslationUnit_DetailedPreprocessingRecord", "CXTranslationUnit_Incomplete", 
"CXTranslationUnit_PrecompiledPreamble", "CXTranslationUnit_CacheCompletionResults", 
"CXTranslationUnit_ForSerialization", "CXTranslationUnit_CXXChainedPCH", 
"CXTranslationUnit_SkipFunctionBodies", "CXTranslationUnit_IncludeBriefCommentsInCodeCompletion"
))


##########################

`CXSaveTranslationUnit_None` = 0L



 `CXSaveTranslationUnit_Flags`  = structure(0L, .Names = "CXSaveTranslationUnit_None")


##########################

`CXSaveError_None` = 0L
`CXSaveError_Unknown` = 1L
`CXSaveError_TranslationErrors` = 2L
`CXSaveError_InvalidTU` = 3L



 `CXSaveError`  = structure(0:3, .Names = c("CXSaveError_None", "CXSaveError_Unknown", 
"CXSaveError_TranslationErrors", "CXSaveError_InvalidTU"))


##########################

`CXReparse_None` = 0L



 `CXReparse_Flags`  = structure(0L, .Names = "CXReparse_None")


##########################

`CXTUResourceUsage_AST` = 1L
`CXTUResourceUsage_Identifiers` = 2L
`CXTUResourceUsage_Selectors` = 3L
`CXTUResourceUsage_GlobalCompletionResults` = 4L
`CXTUResourceUsage_SourceManagerContentCache` = 5L
`CXTUResourceUsage_AST_SideTables` = 6L
`CXTUResourceUsage_SourceManager_Membuffer_Malloc` = 7L
`CXTUResourceUsage_SourceManager_Membuffer_MMap` = 8L
`CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc` = 9L
`CXTUResourceUsage_ExternalASTSource_Membuffer_MMap` = 10L
`CXTUResourceUsage_Preprocessor` = 11L
`CXTUResourceUsage_PreprocessingRecord` = 12L
`CXTUResourceUsage_SourceManager_DataStructures` = 13L
`CXTUResourceUsage_Preprocessor_HeaderSearch` = 14L
`CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN` = 1L
`CXTUResourceUsage_MEMORY_IN_BYTES_END` = 14L
`CXTUResourceUsage_First` = 1L
`CXTUResourceUsage_Last` = 14L



 `CXTUResourceUsageKind`  = structure(c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 
13L, 14L, 1L, 14L, 1L, 14L), .Names = c("CXTUResourceUsage_AST", 
"CXTUResourceUsage_Identifiers", "CXTUResourceUsage_Selectors", 
"CXTUResourceUsage_GlobalCompletionResults", "CXTUResourceUsage_SourceManagerContentCache", 
"CXTUResourceUsage_AST_SideTables", "CXTUResourceUsage_SourceManager_Membuffer_Malloc", 
"CXTUResourceUsage_SourceManager_Membuffer_MMap", "CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc", 
"CXTUResourceUsage_ExternalASTSource_Membuffer_MMap", "CXTUResourceUsage_Preprocessor", 
"CXTUResourceUsage_PreprocessingRecord", "CXTUResourceUsage_SourceManager_DataStructures", 
"CXTUResourceUsage_Preprocessor_HeaderSearch", "CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN", 
"CXTUResourceUsage_MEMORY_IN_BYTES_END", "CXTUResourceUsage_First", 
"CXTUResourceUsage_Last"))


##########################

`CXCursor_UnexposedDecl` = 1L
`CXCursor_StructDecl` = 2L
`CXCursor_UnionDecl` = 3L
`CXCursor_ClassDecl` = 4L
`CXCursor_EnumDecl` = 5L
`CXCursor_FieldDecl` = 6L
`CXCursor_EnumConstantDecl` = 7L
`CXCursor_FunctionDecl` = 8L
`CXCursor_VarDecl` = 9L
`CXCursor_ParmDecl` = 10L
`CXCursor_ObjCInterfaceDecl` = 11L
`CXCursor_ObjCCategoryDecl` = 12L
`CXCursor_ObjCProtocolDecl` = 13L
`CXCursor_ObjCPropertyDecl` = 14L
`CXCursor_ObjCIvarDecl` = 15L
`CXCursor_ObjCInstanceMethodDecl` = 16L
`CXCursor_ObjCClassMethodDecl` = 17L
`CXCursor_ObjCImplementationDecl` = 18L
`CXCursor_ObjCCategoryImplDecl` = 19L
`CXCursor_TypedefDecl` = 20L
`CXCursor_CXXMethod` = 21L
`CXCursor_Namespace` = 22L
`CXCursor_LinkageSpec` = 23L
`CXCursor_Constructor` = 24L
`CXCursor_Destructor` = 25L
`CXCursor_ConversionFunction` = 26L
`CXCursor_TemplateTypeParameter` = 27L
`CXCursor_NonTypeTemplateParameter` = 28L
`CXCursor_TemplateTemplateParameter` = 29L
`CXCursor_FunctionTemplate` = 30L
`CXCursor_ClassTemplate` = 31L
`CXCursor_ClassTemplatePartialSpecialization` = 32L
`CXCursor_NamespaceAlias` = 33L
`CXCursor_UsingDirective` = 34L
`CXCursor_UsingDeclaration` = 35L
`CXCursor_TypeAliasDecl` = 36L
`CXCursor_ObjCSynthesizeDecl` = 37L
`CXCursor_ObjCDynamicDecl` = 38L
`CXCursor_CXXAccessSpecifier` = 39L
`CXCursor_FirstDecl` = 1L
`CXCursor_LastDecl` = 39L
`CXCursor_FirstRef` = 40L
`CXCursor_ObjCSuperClassRef` = 40L
`CXCursor_ObjCProtocolRef` = 41L
`CXCursor_ObjCClassRef` = 42L
`CXCursor_TypeRef` = 43L
`CXCursor_CXXBaseSpecifier` = 44L
`CXCursor_TemplateRef` = 45L
`CXCursor_NamespaceRef` = 46L
`CXCursor_MemberRef` = 47L
`CXCursor_LabelRef` = 48L
`CXCursor_OverloadedDeclRef` = 49L
`CXCursor_VariableRef` = 50L
`CXCursor_LastRef` = 50L
`CXCursor_FirstInvalid` = 70L
`CXCursor_InvalidFile` = 70L
`CXCursor_NoDeclFound` = 71L
`CXCursor_NotImplemented` = 72L
`CXCursor_InvalidCode` = 73L
`CXCursor_LastInvalid` = 73L
`CXCursor_FirstExpr` = 100L
`CXCursor_UnexposedExpr` = 100L
`CXCursor_DeclRefExpr` = 101L
`CXCursor_MemberRefExpr` = 102L
`CXCursor_CallExpr` = 103L
`CXCursor_ObjCMessageExpr` = 104L
`CXCursor_BlockExpr` = 105L
`CXCursor_IntegerLiteral` = 106L
`CXCursor_FloatingLiteral` = 107L
`CXCursor_ImaginaryLiteral` = 108L
`CXCursor_StringLiteral` = 109L
`CXCursor_CharacterLiteral` = 110L
`CXCursor_ParenExpr` = 111L
`CXCursor_UnaryOperator` = 112L
`CXCursor_ArraySubscriptExpr` = 113L
`CXCursor_BinaryOperator` = 114L
`CXCursor_CompoundAssignOperator` = 115L
`CXCursor_ConditionalOperator` = 116L
`CXCursor_CStyleCastExpr` = 117L
`CXCursor_CompoundLiteralExpr` = 118L
`CXCursor_InitListExpr` = 119L
`CXCursor_AddrLabelExpr` = 120L
`CXCursor_StmtExpr` = 121L
`CXCursor_GenericSelectionExpr` = 122L
`CXCursor_GNUNullExpr` = 123L
`CXCursor_CXXStaticCastExpr` = 124L
`CXCursor_CXXDynamicCastExpr` = 125L
`CXCursor_CXXReinterpretCastExpr` = 126L
`CXCursor_CXXConstCastExpr` = 127L
`CXCursor_CXXFunctionalCastExpr` = 128L
`CXCursor_CXXTypeidExpr` = 129L
`CXCursor_CXXBoolLiteralExpr` = 130L
`CXCursor_CXXNullPtrLiteralExpr` = 131L
`CXCursor_CXXThisExpr` = 132L
`CXCursor_CXXThrowExpr` = 133L
`CXCursor_CXXNewExpr` = 134L
`CXCursor_CXXDeleteExpr` = 135L
`CXCursor_UnaryExpr` = 136L
`CXCursor_ObjCStringLiteral` = 137L
`CXCursor_ObjCEncodeExpr` = 138L
`CXCursor_ObjCSelectorExpr` = 139L
`CXCursor_ObjCProtocolExpr` = 140L
`CXCursor_ObjCBridgedCastExpr` = 141L
`CXCursor_PackExpansionExpr` = 142L
`CXCursor_SizeOfPackExpr` = 143L
`CXCursor_LambdaExpr` = 144L
`CXCursor_ObjCBoolLiteralExpr` = 145L
`CXCursor_ObjCSelfExpr` = 146L
`CXCursor_LastExpr` = 146L
`CXCursor_FirstStmt` = 200L
`CXCursor_UnexposedStmt` = 200L
`CXCursor_LabelStmt` = 201L
`CXCursor_CompoundStmt` = 202L
`CXCursor_CaseStmt` = 203L
`CXCursor_DefaultStmt` = 204L
`CXCursor_IfStmt` = 205L
`CXCursor_SwitchStmt` = 206L
`CXCursor_WhileStmt` = 207L
`CXCursor_DoStmt` = 208L
`CXCursor_ForStmt` = 209L
`CXCursor_GotoStmt` = 210L
`CXCursor_IndirectGotoStmt` = 211L
`CXCursor_ContinueStmt` = 212L
`CXCursor_BreakStmt` = 213L
`CXCursor_ReturnStmt` = 214L
`CXCursor_GCCAsmStmt` = 215L
`CXCursor_AsmStmt` = 215L
`CXCursor_ObjCAtTryStmt` = 216L
`CXCursor_ObjCAtCatchStmt` = 217L
`CXCursor_ObjCAtFinallyStmt` = 218L
`CXCursor_ObjCAtThrowStmt` = 219L
`CXCursor_ObjCAtSynchronizedStmt` = 220L
`CXCursor_ObjCAutoreleasePoolStmt` = 221L
`CXCursor_ObjCForCollectionStmt` = 222L
`CXCursor_CXXCatchStmt` = 223L
`CXCursor_CXXTryStmt` = 224L
`CXCursor_CXXForRangeStmt` = 225L
`CXCursor_SEHTryStmt` = 226L
`CXCursor_SEHExceptStmt` = 227L
`CXCursor_SEHFinallyStmt` = 228L
`CXCursor_MSAsmStmt` = 229L
`CXCursor_NullStmt` = 230L
`CXCursor_DeclStmt` = 231L
`CXCursor_OMPParallelDirective` = 232L
`CXCursor_OMPSimdDirective` = 233L
`CXCursor_OMPForDirective` = 234L
`CXCursor_OMPSectionsDirective` = 235L
`CXCursor_OMPSectionDirective` = 236L
`CXCursor_OMPSingleDirective` = 237L
`CXCursor_OMPParallelForDirective` = 238L
`CXCursor_OMPParallelSectionsDirective` = 239L
`CXCursor_OMPTaskDirective` = 240L
`CXCursor_OMPMasterDirective` = 241L
`CXCursor_OMPCriticalDirective` = 242L
`CXCursor_OMPTaskyieldDirective` = 243L
`CXCursor_OMPBarrierDirective` = 244L
`CXCursor_OMPTaskwaitDirective` = 245L
`CXCursor_OMPFlushDirective` = 246L
`CXCursor_SEHLeaveStmt` = 247L
`CXCursor_OMPOrderedDirective` = 248L
`CXCursor_OMPAtomicDirective` = 249L
`CXCursor_OMPForSimdDirective` = 250L
`CXCursor_OMPParallelForSimdDirective` = 251L
`CXCursor_OMPTargetDirective` = 252L
`CXCursor_OMPTeamsDirective` = 253L
`CXCursor_OMPTaskgroupDirective` = 254L
`CXCursor_OMPCancellationPointDirective` = 255L
`CXCursor_OMPCancelDirective` = 256L
`CXCursor_LastStmt` = 256L
`CXCursor_TranslationUnit` = 300L
`CXCursor_FirstAttr` = 400L
`CXCursor_UnexposedAttr` = 400L
`CXCursor_IBActionAttr` = 401L
`CXCursor_IBOutletAttr` = 402L
`CXCursor_IBOutletCollectionAttr` = 403L
`CXCursor_CXXFinalAttr` = 404L
`CXCursor_CXXOverrideAttr` = 405L
`CXCursor_AnnotateAttr` = 406L
`CXCursor_AsmLabelAttr` = 407L
`CXCursor_PackedAttr` = 408L
`CXCursor_PureAttr` = 409L
`CXCursor_ConstAttr` = 410L
`CXCursor_NoDuplicateAttr` = 411L
`CXCursor_CUDAConstantAttr` = 412L
`CXCursor_CUDADeviceAttr` = 413L
`CXCursor_CUDAGlobalAttr` = 414L
`CXCursor_CUDAHostAttr` = 415L
`CXCursor_CUDASharedAttr` = 416L
`CXCursor_LastAttr` = 416L
`CXCursor_PreprocessingDirective` = 500L
`CXCursor_MacroDefinition` = 501L
`CXCursor_MacroExpansion` = 502L
`CXCursor_MacroInstantiation` = 502L
`CXCursor_InclusionDirective` = 503L
`CXCursor_FirstPreprocessing` = 500L
`CXCursor_LastPreprocessing` = 503L
`CXCursor_ModuleImportDecl` = 600L
`CXCursor_FirstExtraDecl` = 600L
`CXCursor_LastExtraDecl` = 600L
`CXCursor_OverloadCandidate` = 700L



 `CXCursorKind`  = structure(c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 
13L, 14L, 15L, 16L, 17L, 18L, 19L, 20L, 21L, 22L, 23L, 24L, 25L, 
26L, 27L, 28L, 29L, 30L, 31L, 32L, 33L, 34L, 35L, 36L, 37L, 38L, 
39L, 1L, 39L, 40L, 40L, 41L, 42L, 43L, 44L, 45L, 46L, 47L, 48L, 
49L, 50L, 50L, 70L, 70L, 71L, 72L, 73L, 73L, 100L, 100L, 101L, 
102L, 103L, 104L, 105L, 106L, 107L, 108L, 109L, 110L, 111L, 112L, 
113L, 114L, 115L, 116L, 117L, 118L, 119L, 120L, 121L, 122L, 123L, 
124L, 125L, 126L, 127L, 128L, 129L, 130L, 131L, 132L, 133L, 134L, 
135L, 136L, 137L, 138L, 139L, 140L, 141L, 142L, 143L, 144L, 145L, 
146L, 146L, 200L, 200L, 201L, 202L, 203L, 204L, 205L, 206L, 207L, 
208L, 209L, 210L, 211L, 212L, 213L, 214L, 215L, 215L, 216L, 217L, 
218L, 219L, 220L, 221L, 222L, 223L, 224L, 225L, 226L, 227L, 228L, 
229L, 230L, 231L, 232L, 233L, 234L, 235L, 236L, 237L, 238L, 239L, 
240L, 241L, 242L, 243L, 244L, 245L, 246L, 247L, 248L, 249L, 250L, 
251L, 252L, 253L, 254L, 255L, 256L, 256L, 300L, 400L, 400L, 401L, 
402L, 403L, 404L, 405L, 406L, 407L, 408L, 409L, 410L, 411L, 412L, 
413L, 414L, 415L, 416L, 416L, 500L, 501L, 502L, 502L, 503L, 500L, 
503L, 600L, 600L, 600L, 700L), .Names = c("CXCursor_UnexposedDecl", 
"CXCursor_StructDecl", "CXCursor_UnionDecl", "CXCursor_ClassDecl", 
"CXCursor_EnumDecl", "CXCursor_FieldDecl", "CXCursor_EnumConstantDecl", 
"CXCursor_FunctionDecl", "CXCursor_VarDecl", "CXCursor_ParmDecl", 
"CXCursor_ObjCInterfaceDecl", "CXCursor_ObjCCategoryDecl", "CXCursor_ObjCProtocolDecl", 
"CXCursor_ObjCPropertyDecl", "CXCursor_ObjCIvarDecl", "CXCursor_ObjCInstanceMethodDecl", 
"CXCursor_ObjCClassMethodDecl", "CXCursor_ObjCImplementationDecl", 
"CXCursor_ObjCCategoryImplDecl", "CXCursor_TypedefDecl", "CXCursor_CXXMethod", 
"CXCursor_Namespace", "CXCursor_LinkageSpec", "CXCursor_Constructor", 
"CXCursor_Destructor", "CXCursor_ConversionFunction", "CXCursor_TemplateTypeParameter", 
"CXCursor_NonTypeTemplateParameter", "CXCursor_TemplateTemplateParameter", 
"CXCursor_FunctionTemplate", "CXCursor_ClassTemplate", "CXCursor_ClassTemplatePartialSpecialization", 
"CXCursor_NamespaceAlias", "CXCursor_UsingDirective", "CXCursor_UsingDeclaration", 
"CXCursor_TypeAliasDecl", "CXCursor_ObjCSynthesizeDecl", "CXCursor_ObjCDynamicDecl", 
"CXCursor_CXXAccessSpecifier", "CXCursor_FirstDecl", "CXCursor_LastDecl", 
"CXCursor_FirstRef", "CXCursor_ObjCSuperClassRef", "CXCursor_ObjCProtocolRef", 
"CXCursor_ObjCClassRef", "CXCursor_TypeRef", "CXCursor_CXXBaseSpecifier", 
"CXCursor_TemplateRef", "CXCursor_NamespaceRef", "CXCursor_MemberRef", 
"CXCursor_LabelRef", "CXCursor_OverloadedDeclRef", "CXCursor_VariableRef", 
"CXCursor_LastRef", "CXCursor_FirstInvalid", "CXCursor_InvalidFile", 
"CXCursor_NoDeclFound", "CXCursor_NotImplemented", "CXCursor_InvalidCode", 
"CXCursor_LastInvalid", "CXCursor_FirstExpr", "CXCursor_UnexposedExpr", 
"CXCursor_DeclRefExpr", "CXCursor_MemberRefExpr", "CXCursor_CallExpr", 
"CXCursor_ObjCMessageExpr", "CXCursor_BlockExpr", "CXCursor_IntegerLiteral", 
"CXCursor_FloatingLiteral", "CXCursor_ImaginaryLiteral", "CXCursor_StringLiteral", 
"CXCursor_CharacterLiteral", "CXCursor_ParenExpr", "CXCursor_UnaryOperator", 
"CXCursor_ArraySubscriptExpr", "CXCursor_BinaryOperator", "CXCursor_CompoundAssignOperator", 
"CXCursor_ConditionalOperator", "CXCursor_CStyleCastExpr", "CXCursor_CompoundLiteralExpr", 
"CXCursor_InitListExpr", "CXCursor_AddrLabelExpr", "CXCursor_StmtExpr", 
"CXCursor_GenericSelectionExpr", "CXCursor_GNUNullExpr", "CXCursor_CXXStaticCastExpr", 
"CXCursor_CXXDynamicCastExpr", "CXCursor_CXXReinterpretCastExpr", 
"CXCursor_CXXConstCastExpr", "CXCursor_CXXFunctionalCastExpr", 
"CXCursor_CXXTypeidExpr", "CXCursor_CXXBoolLiteralExpr", "CXCursor_CXXNullPtrLiteralExpr", 
"CXCursor_CXXThisExpr", "CXCursor_CXXThrowExpr", "CXCursor_CXXNewExpr", 
"CXCursor_CXXDeleteExpr", "CXCursor_UnaryExpr", "CXCursor_ObjCStringLiteral", 
"CXCursor_ObjCEncodeExpr", "CXCursor_ObjCSelectorExpr", "CXCursor_ObjCProtocolExpr", 
"CXCursor_ObjCBridgedCastExpr", "CXCursor_PackExpansionExpr", 
"CXCursor_SizeOfPackExpr", "CXCursor_LambdaExpr", "CXCursor_ObjCBoolLiteralExpr", 
"CXCursor_ObjCSelfExpr", "CXCursor_LastExpr", "CXCursor_FirstStmt", 
"CXCursor_UnexposedStmt", "CXCursor_LabelStmt", "CXCursor_CompoundStmt", 
"CXCursor_CaseStmt", "CXCursor_DefaultStmt", "CXCursor_IfStmt", 
"CXCursor_SwitchStmt", "CXCursor_WhileStmt", "CXCursor_DoStmt", 
"CXCursor_ForStmt", "CXCursor_GotoStmt", "CXCursor_IndirectGotoStmt", 
"CXCursor_ContinueStmt", "CXCursor_BreakStmt", "CXCursor_ReturnStmt", 
"CXCursor_GCCAsmStmt", "CXCursor_AsmStmt", "CXCursor_ObjCAtTryStmt", 
"CXCursor_ObjCAtCatchStmt", "CXCursor_ObjCAtFinallyStmt", "CXCursor_ObjCAtThrowStmt", 
"CXCursor_ObjCAtSynchronizedStmt", "CXCursor_ObjCAutoreleasePoolStmt", 
"CXCursor_ObjCForCollectionStmt", "CXCursor_CXXCatchStmt", "CXCursor_CXXTryStmt", 
"CXCursor_CXXForRangeStmt", "CXCursor_SEHTryStmt", "CXCursor_SEHExceptStmt", 
"CXCursor_SEHFinallyStmt", "CXCursor_MSAsmStmt", "CXCursor_NullStmt", 
"CXCursor_DeclStmt", "CXCursor_OMPParallelDirective", "CXCursor_OMPSimdDirective", 
"CXCursor_OMPForDirective", "CXCursor_OMPSectionsDirective", 
"CXCursor_OMPSectionDirective", "CXCursor_OMPSingleDirective", 
"CXCursor_OMPParallelForDirective", "CXCursor_OMPParallelSectionsDirective", 
"CXCursor_OMPTaskDirective", "CXCursor_OMPMasterDirective", "CXCursor_OMPCriticalDirective", 
"CXCursor_OMPTaskyieldDirective", "CXCursor_OMPBarrierDirective", 
"CXCursor_OMPTaskwaitDirective", "CXCursor_OMPFlushDirective", 
"CXCursor_SEHLeaveStmt", "CXCursor_OMPOrderedDirective", "CXCursor_OMPAtomicDirective", 
"CXCursor_OMPForSimdDirective", "CXCursor_OMPParallelForSimdDirective", 
"CXCursor_OMPTargetDirective", "CXCursor_OMPTeamsDirective", 
"CXCursor_OMPTaskgroupDirective", "CXCursor_OMPCancellationPointDirective", 
"CXCursor_OMPCancelDirective", "CXCursor_LastStmt", "CXCursor_TranslationUnit", 
"CXCursor_FirstAttr", "CXCursor_UnexposedAttr", "CXCursor_IBActionAttr", 
"CXCursor_IBOutletAttr", "CXCursor_IBOutletCollectionAttr", "CXCursor_CXXFinalAttr", 
"CXCursor_CXXOverrideAttr", "CXCursor_AnnotateAttr", "CXCursor_AsmLabelAttr", 
"CXCursor_PackedAttr", "CXCursor_PureAttr", "CXCursor_ConstAttr", 
"CXCursor_NoDuplicateAttr", "CXCursor_CUDAConstantAttr", "CXCursor_CUDADeviceAttr", 
"CXCursor_CUDAGlobalAttr", "CXCursor_CUDAHostAttr", "CXCursor_CUDASharedAttr", 
"CXCursor_LastAttr", "CXCursor_PreprocessingDirective", "CXCursor_MacroDefinition", 
"CXCursor_MacroExpansion", "CXCursor_MacroInstantiation", "CXCursor_InclusionDirective", 
"CXCursor_FirstPreprocessing", "CXCursor_LastPreprocessing", 
"CXCursor_ModuleImportDecl", "CXCursor_FirstExtraDecl", "CXCursor_LastExtraDecl", 
"CXCursor_OverloadCandidate"))


##########################

`CXLinkage_Invalid` = 0L
`CXLinkage_NoLinkage` = 1L
`CXLinkage_Internal` = 2L
`CXLinkage_UniqueExternal` = 3L
`CXLinkage_External` = 4L



 `CXLinkageKind`  = structure(0:4, .Names = c("CXLinkage_Invalid", "CXLinkage_NoLinkage", 
"CXLinkage_Internal", "CXLinkage_UniqueExternal", "CXLinkage_External"
))


##########################

`CXLanguage_Invalid` = 0L
`CXLanguage_C` = 1L
`CXLanguage_ObjC` = 2L
`CXLanguage_CPlusPlus` = 3L



 `CXLanguageKind`  = structure(0:3, .Names = c("CXLanguage_Invalid", "CXLanguage_C", 
"CXLanguage_ObjC", "CXLanguage_CPlusPlus"))


##########################

`CXType_Invalid` = 0L
`CXType_Unexposed` = 1L
`CXType_Void` = 2L
`CXType_Bool` = 3L
`CXType_Char_U` = 4L
`CXType_UChar` = 5L
`CXType_Char16` = 6L
`CXType_Char32` = 7L
`CXType_UShort` = 8L
`CXType_UInt` = 9L
`CXType_ULong` = 10L
`CXType_ULongLong` = 11L
`CXType_UInt128` = 12L
`CXType_Char_S` = 13L
`CXType_SChar` = 14L
`CXType_WChar` = 15L
`CXType_Short` = 16L
`CXType_Int` = 17L
`CXType_Long` = 18L
`CXType_LongLong` = 19L
`CXType_Int128` = 20L
`CXType_Float` = 21L
`CXType_Double` = 22L
`CXType_LongDouble` = 23L
`CXType_NullPtr` = 24L
`CXType_Overload` = 25L
`CXType_Dependent` = 26L
`CXType_ObjCId` = 27L
`CXType_ObjCClass` = 28L
`CXType_ObjCSel` = 29L
`CXType_FirstBuiltin` = 2L
`CXType_LastBuiltin` = 29L
`CXType_Complex` = 100L
`CXType_Pointer` = 101L
`CXType_BlockPointer` = 102L
`CXType_LValueReference` = 103L
`CXType_RValueReference` = 104L
`CXType_Record` = 105L
`CXType_Enum` = 106L
`CXType_Typedef` = 107L
`CXType_ObjCInterface` = 108L
`CXType_ObjCObjectPointer` = 109L
`CXType_FunctionNoProto` = 110L
`CXType_FunctionProto` = 111L
`CXType_ConstantArray` = 112L
`CXType_Vector` = 113L
`CXType_IncompleteArray` = 114L
`CXType_VariableArray` = 115L
`CXType_DependentSizedArray` = 116L
`CXType_MemberPointer` = 117L



 `CXTypeKind`  = structure(c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 
12L, 13L, 14L, 15L, 16L, 17L, 18L, 19L, 20L, 21L, 22L, 23L, 24L, 
25L, 26L, 27L, 28L, 29L, 2L, 29L, 100L, 101L, 102L, 103L, 104L, 
105L, 106L, 107L, 108L, 109L, 110L, 111L, 112L, 113L, 114L, 115L, 
116L, 117L), .Names = c("CXType_Invalid", "CXType_Unexposed", 
"CXType_Void", "CXType_Bool", "CXType_Char_U", "CXType_UChar", 
"CXType_Char16", "CXType_Char32", "CXType_UShort", "CXType_UInt", 
"CXType_ULong", "CXType_ULongLong", "CXType_UInt128", "CXType_Char_S", 
"CXType_SChar", "CXType_WChar", "CXType_Short", "CXType_Int", 
"CXType_Long", "CXType_LongLong", "CXType_Int128", "CXType_Float", 
"CXType_Double", "CXType_LongDouble", "CXType_NullPtr", "CXType_Overload", 
"CXType_Dependent", "CXType_ObjCId", "CXType_ObjCClass", "CXType_ObjCSel", 
"CXType_FirstBuiltin", "CXType_LastBuiltin", "CXType_Complex", 
"CXType_Pointer", "CXType_BlockPointer", "CXType_LValueReference", 
"CXType_RValueReference", "CXType_Record", "CXType_Enum", "CXType_Typedef", 
"CXType_ObjCInterface", "CXType_ObjCObjectPointer", "CXType_FunctionNoProto", 
"CXType_FunctionProto", "CXType_ConstantArray", "CXType_Vector", 
"CXType_IncompleteArray", "CXType_VariableArray", "CXType_DependentSizedArray", 
"CXType_MemberPointer"))


##########################

`CXCallingConv_Default` = 0L
`CXCallingConv_C` = 1L
`CXCallingConv_X86StdCall` = 2L
`CXCallingConv_X86FastCall` = 3L
`CXCallingConv_X86ThisCall` = 4L
`CXCallingConv_X86Pascal` = 5L
`CXCallingConv_AAPCS` = 6L
`CXCallingConv_AAPCS_VFP` = 7L
`CXCallingConv_IntelOclBicc` = 9L
`CXCallingConv_X86_64Win64` = 10L
`CXCallingConv_X86_64SysV` = 11L
`CXCallingConv_X86VectorCall` = 12L
`CXCallingConv_Invalid` = 100L
`CXCallingConv_Unexposed` = 200L



 `CXCallingConv`  = structure(c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 9L, 10L, 11L, 12L, 
100L, 200L), .Names = c("CXCallingConv_Default", "CXCallingConv_C", 
"CXCallingConv_X86StdCall", "CXCallingConv_X86FastCall", "CXCallingConv_X86ThisCall", 
"CXCallingConv_X86Pascal", "CXCallingConv_AAPCS", "CXCallingConv_AAPCS_VFP", 
"CXCallingConv_IntelOclBicc", "CXCallingConv_X86_64Win64", "CXCallingConv_X86_64SysV", 
"CXCallingConv_X86VectorCall", "CXCallingConv_Invalid", "CXCallingConv_Unexposed"
))


##########################

`CXTemplateArgumentKind_Null` = 0L
`CXTemplateArgumentKind_Type` = 1L
`CXTemplateArgumentKind_Declaration` = 2L
`CXTemplateArgumentKind_NullPtr` = 3L
`CXTemplateArgumentKind_Integral` = 4L
`CXTemplateArgumentKind_Template` = 5L
`CXTemplateArgumentKind_TemplateExpansion` = 6L
`CXTemplateArgumentKind_Expression` = 7L
`CXTemplateArgumentKind_Pack` = 8L
`CXTemplateArgumentKind_Invalid` = 9L



 `CXTemplateArgumentKind`  = structure(0:9, .Names = c("CXTemplateArgumentKind_Null", "CXTemplateArgumentKind_Type", 
"CXTemplateArgumentKind_Declaration", "CXTemplateArgumentKind_NullPtr", 
"CXTemplateArgumentKind_Integral", "CXTemplateArgumentKind_Template", 
"CXTemplateArgumentKind_TemplateExpansion", "CXTemplateArgumentKind_Expression", 
"CXTemplateArgumentKind_Pack", "CXTemplateArgumentKind_Invalid"
))


##########################

`CXTypeLayoutError_Invalid` = -1L
`CXTypeLayoutError_Incomplete` = -2L
`CXTypeLayoutError_Dependent` = -3L
`CXTypeLayoutError_NotConstantSize` = -4L
`CXTypeLayoutError_InvalidFieldName` = -5L



 `CXTypeLayoutError`  = structure(c(-1L, -2L, -3L, -4L, -5L), .Names = c("CXTypeLayoutError_Invalid", 
"CXTypeLayoutError_Incomplete", "CXTypeLayoutError_Dependent", 
"CXTypeLayoutError_NotConstantSize", "CXTypeLayoutError_InvalidFieldName"
))


##########################

`CXRefQualifier_None` = 0L
`CXRefQualifier_LValue` = 1L
`CXRefQualifier_RValue` = 2L



 `CXRefQualifierKind`  = structure(0:2, .Names = c("CXRefQualifier_None", "CXRefQualifier_LValue", 
"CXRefQualifier_RValue"))


##########################

`CX_CXXInvalidAccessSpecifier` = 0L
`CX_CXXPublic` = 1L
`CX_CXXProtected` = 2L
`CX_CXXPrivate` = 3L



 `CX_CXXAccessSpecifier`  = structure(0:3, .Names = c("CX_CXXInvalidAccessSpecifier", "CX_CXXPublic", 
"CX_CXXProtected", "CX_CXXPrivate"))


##########################

`CX_SC_Invalid` = 0L
`CX_SC_None` = 1L
`CX_SC_Extern` = 2L
`CX_SC_Static` = 3L
`CX_SC_PrivateExtern` = 4L
`CX_SC_OpenCLWorkGroupLocal` = 5L
`CX_SC_Auto` = 6L
`CX_SC_Register` = 7L



 `CX_StorageClass`  = structure(0:7, .Names = c("CX_SC_Invalid", "CX_SC_None", "CX_SC_Extern", 
"CX_SC_Static", "CX_SC_PrivateExtern", "CX_SC_OpenCLWorkGroupLocal", 
"CX_SC_Auto", "CX_SC_Register"))


##########################

`CXChildVisit_Break` = 0L
`CXChildVisit_Continue` = 1L
`CXChildVisit_Recurse` = 2L



 `CXChildVisitResult`  = structure(0:2, .Names = c("CXChildVisit_Break", "CXChildVisit_Continue", 
"CXChildVisit_Recurse"))


##########################

`CXObjCPropertyAttr_noattr` = 0L
`CXObjCPropertyAttr_readonly` = 1L
`CXObjCPropertyAttr_getter` = 2L
`CXObjCPropertyAttr_assign` = 4L
`CXObjCPropertyAttr_readwrite` = 8L
`CXObjCPropertyAttr_retain` = 16L
`CXObjCPropertyAttr_copy` = 32L
`CXObjCPropertyAttr_nonatomic` = 64L
`CXObjCPropertyAttr_setter` = 128L
`CXObjCPropertyAttr_atomic` = 256L
`CXObjCPropertyAttr_weak` = 512L
`CXObjCPropertyAttr_strong` = 1024L
`CXObjCPropertyAttr_unsafe_unretained` = 2048L



 `CXObjCPropertyAttrKind`  = structure(c(0L, 1L, 2L, 4L, 8L, 16L, 32L, 64L, 128L, 256L, 512L, 
1024L, 2048L), .Names = c("CXObjCPropertyAttr_noattr", "CXObjCPropertyAttr_readonly", 
"CXObjCPropertyAttr_getter", "CXObjCPropertyAttr_assign", "CXObjCPropertyAttr_readwrite", 
"CXObjCPropertyAttr_retain", "CXObjCPropertyAttr_copy", "CXObjCPropertyAttr_nonatomic", 
"CXObjCPropertyAttr_setter", "CXObjCPropertyAttr_atomic", "CXObjCPropertyAttr_weak", 
"CXObjCPropertyAttr_strong", "CXObjCPropertyAttr_unsafe_unretained"
))


##########################

`CXObjCDeclQualifier_None` = 0L
`CXObjCDeclQualifier_In` = 1L
`CXObjCDeclQualifier_Inout` = 2L
`CXObjCDeclQualifier_Out` = 4L
`CXObjCDeclQualifier_Bycopy` = 8L
`CXObjCDeclQualifier_Byref` = 16L
`CXObjCDeclQualifier_Oneway` = 32L



 `CXObjCDeclQualifierKind`  = structure(c(0L, 1L, 2L, 4L, 8L, 16L, 32L), .Names = c("CXObjCDeclQualifier_None", 
"CXObjCDeclQualifier_In", "CXObjCDeclQualifier_Inout", "CXObjCDeclQualifier_Out", 
"CXObjCDeclQualifier_Bycopy", "CXObjCDeclQualifier_Byref", "CXObjCDeclQualifier_Oneway"
))


##########################

`CXNameRange_WantQualifier` = 1L
`CXNameRange_WantTemplateArgs` = 2L
`CXNameRange_WantSinglePiece` = 4L



 `CXNameRefFlags`  = structure(c(1L, 2L, 4L), .Names = c("CXNameRange_WantQualifier", 
"CXNameRange_WantTemplateArgs", "CXNameRange_WantSinglePiece"
))


##########################

`CXToken_Punctuation` = 0L
`CXToken_Keyword` = 1L
`CXToken_Identifier` = 2L
`CXToken_Literal` = 3L
`CXToken_Comment` = 4L



 `CXTokenKind`  = structure(0:4, .Names = c("CXToken_Punctuation", "CXToken_Keyword", 
"CXToken_Identifier", "CXToken_Literal", "CXToken_Comment"))


##########################

`CXCompletionChunk_Optional` = 0L
`CXCompletionChunk_TypedText` = 1L
`CXCompletionChunk_Text` = 2L
`CXCompletionChunk_Placeholder` = 3L
`CXCompletionChunk_Informative` = 4L
`CXCompletionChunk_CurrentParameter` = 5L
`CXCompletionChunk_LeftParen` = 6L
`CXCompletionChunk_RightParen` = 7L
`CXCompletionChunk_LeftBracket` = 8L
`CXCompletionChunk_RightBracket` = 9L
`CXCompletionChunk_LeftBrace` = 10L
`CXCompletionChunk_RightBrace` = 11L
`CXCompletionChunk_LeftAngle` = 12L
`CXCompletionChunk_RightAngle` = 13L
`CXCompletionChunk_Comma` = 14L
`CXCompletionChunk_ResultType` = 15L
`CXCompletionChunk_Colon` = 16L
`CXCompletionChunk_SemiColon` = 17L
`CXCompletionChunk_Equal` = 18L
`CXCompletionChunk_HorizontalSpace` = 19L
`CXCompletionChunk_VerticalSpace` = 20L



 `CXCompletionChunkKind`  = structure(0:20, .Names = c("CXCompletionChunk_Optional", "CXCompletionChunk_TypedText", 
"CXCompletionChunk_Text", "CXCompletionChunk_Placeholder", "CXCompletionChunk_Informative", 
"CXCompletionChunk_CurrentParameter", "CXCompletionChunk_LeftParen", 
"CXCompletionChunk_RightParen", "CXCompletionChunk_LeftBracket", 
"CXCompletionChunk_RightBracket", "CXCompletionChunk_LeftBrace", 
"CXCompletionChunk_RightBrace", "CXCompletionChunk_LeftAngle", 
"CXCompletionChunk_RightAngle", "CXCompletionChunk_Comma", "CXCompletionChunk_ResultType", 
"CXCompletionChunk_Colon", "CXCompletionChunk_SemiColon", "CXCompletionChunk_Equal", 
"CXCompletionChunk_HorizontalSpace", "CXCompletionChunk_VerticalSpace"
))


##########################

`CXCodeComplete_IncludeMacros` = 1L
`CXCodeComplete_IncludeCodePatterns` = 2L
`CXCodeComplete_IncludeBriefComments` = 4L



 `CXCodeComplete_Flags`  = structure(c(1L, 2L, 4L), .Names = c("CXCodeComplete_IncludeMacros", 
"CXCodeComplete_IncludeCodePatterns", "CXCodeComplete_IncludeBriefComments"
))


##########################

`CXCompletionContext_Unexposed` = 0L
`CXCompletionContext_AnyType` = 1L
`CXCompletionContext_AnyValue` = 2L
`CXCompletionContext_ObjCObjectValue` = 4L
`CXCompletionContext_ObjCSelectorValue` = 8L
`CXCompletionContext_CXXClassTypeValue` = 16L
`CXCompletionContext_DotMemberAccess` = 32L
`CXCompletionContext_ArrowMemberAccess` = 64L
`CXCompletionContext_ObjCPropertyAccess` = 128L
`CXCompletionContext_EnumTag` = 256L
`CXCompletionContext_UnionTag` = 512L
`CXCompletionContext_StructTag` = 1024L
`CXCompletionContext_ClassTag` = 2048L
`CXCompletionContext_Namespace` = 4096L
`CXCompletionContext_NestedNameSpecifier` = 8192L
`CXCompletionContext_ObjCInterface` = 16384L
`CXCompletionContext_ObjCProtocol` = 32768L
`CXCompletionContext_ObjCCategory` = 65536L
`CXCompletionContext_ObjCInstanceMessage` = 131072L
`CXCompletionContext_ObjCClassMessage` = 262144L
`CXCompletionContext_ObjCSelectorName` = 524288L
`CXCompletionContext_MacroName` = 1048576L
`CXCompletionContext_NaturalLanguage` = 2097152L
`CXCompletionContext_Unknown` = NA



 `CXCompletionContext`  = structure(c(0L, 1L, 2L, 4L, 8L, 16L, 32L, 64L, 128L, 256L, 512L, 
1024L, 2048L, 4096L, 8192L, 16384L, 32768L, 65536L, 131072L, 
262144L, 524288L, 1048576L, 2097152L, NA), .Names = c("CXCompletionContext_Unexposed", 
"CXCompletionContext_AnyType", "CXCompletionContext_AnyValue", 
"CXCompletionContext_ObjCObjectValue", "CXCompletionContext_ObjCSelectorValue", 
"CXCompletionContext_CXXClassTypeValue", "CXCompletionContext_DotMemberAccess", 
"CXCompletionContext_ArrowMemberAccess", "CXCompletionContext_ObjCPropertyAccess", 
"CXCompletionContext_EnumTag", "CXCompletionContext_UnionTag", 
"CXCompletionContext_StructTag", "CXCompletionContext_ClassTag", 
"CXCompletionContext_Namespace", "CXCompletionContext_NestedNameSpecifier", 
"CXCompletionContext_ObjCInterface", "CXCompletionContext_ObjCProtocol", 
"CXCompletionContext_ObjCCategory", "CXCompletionContext_ObjCInstanceMessage", 
"CXCompletionContext_ObjCClassMessage", "CXCompletionContext_ObjCSelectorName", 
"CXCompletionContext_MacroName", "CXCompletionContext_NaturalLanguage", 
"CXCompletionContext_Unknown"))


##########################

`CXVisit_Break` = 0L
`CXVisit_Continue` = 1L



 `CXVisitorResult`  = structure(0:1, .Names = c("CXVisit_Break", "CXVisit_Continue"
))


##########################

`CXResult_Success` = 0L
`CXResult_Invalid` = 1L
`CXResult_VisitBreak` = 2L



 `CXResult`  = structure(0:2, .Names = c("CXResult_Success", "CXResult_Invalid", 
"CXResult_VisitBreak"))


##########################

`CXIdxEntity_Unexposed` = 0L
`CXIdxEntity_Typedef` = 1L
`CXIdxEntity_Function` = 2L
`CXIdxEntity_Variable` = 3L
`CXIdxEntity_Field` = 4L
`CXIdxEntity_EnumConstant` = 5L
`CXIdxEntity_ObjCClass` = 6L
`CXIdxEntity_ObjCProtocol` = 7L
`CXIdxEntity_ObjCCategory` = 8L
`CXIdxEntity_ObjCInstanceMethod` = 9L
`CXIdxEntity_ObjCClassMethod` = 10L
`CXIdxEntity_ObjCProperty` = 11L
`CXIdxEntity_ObjCIvar` = 12L
`CXIdxEntity_Enum` = 13L
`CXIdxEntity_Struct` = 14L
`CXIdxEntity_Union` = 15L
`CXIdxEntity_CXXClass` = 16L
`CXIdxEntity_CXXNamespace` = 17L
`CXIdxEntity_CXXNamespaceAlias` = 18L
`CXIdxEntity_CXXStaticVariable` = 19L
`CXIdxEntity_CXXStaticMethod` = 20L
`CXIdxEntity_CXXInstanceMethod` = 21L
`CXIdxEntity_CXXConstructor` = 22L
`CXIdxEntity_CXXDestructor` = 23L
`CXIdxEntity_CXXConversionFunction` = 24L
`CXIdxEntity_CXXTypeAlias` = 25L
`CXIdxEntity_CXXInterface` = 26L



 `CXIdxEntityKind`  = structure(0:26, .Names = c("CXIdxEntity_Unexposed", "CXIdxEntity_Typedef", 
"CXIdxEntity_Function", "CXIdxEntity_Variable", "CXIdxEntity_Field", 
"CXIdxEntity_EnumConstant", "CXIdxEntity_ObjCClass", "CXIdxEntity_ObjCProtocol", 
"CXIdxEntity_ObjCCategory", "CXIdxEntity_ObjCInstanceMethod", 
"CXIdxEntity_ObjCClassMethod", "CXIdxEntity_ObjCProperty", "CXIdxEntity_ObjCIvar", 
"CXIdxEntity_Enum", "CXIdxEntity_Struct", "CXIdxEntity_Union", 
"CXIdxEntity_CXXClass", "CXIdxEntity_CXXNamespace", "CXIdxEntity_CXXNamespaceAlias", 
"CXIdxEntity_CXXStaticVariable", "CXIdxEntity_CXXStaticMethod", 
"CXIdxEntity_CXXInstanceMethod", "CXIdxEntity_CXXConstructor", 
"CXIdxEntity_CXXDestructor", "CXIdxEntity_CXXConversionFunction", 
"CXIdxEntity_CXXTypeAlias", "CXIdxEntity_CXXInterface"))


##########################

`CXIdxEntityLang_None` = 0L
`CXIdxEntityLang_C` = 1L
`CXIdxEntityLang_ObjC` = 2L
`CXIdxEntityLang_CXX` = 3L



 `CXIdxEntityLanguage`  = structure(0:3, .Names = c("CXIdxEntityLang_None", "CXIdxEntityLang_C", 
"CXIdxEntityLang_ObjC", "CXIdxEntityLang_CXX"))


##########################

`CXIdxEntity_NonTemplate` = 0L
`CXIdxEntity_Template` = 1L
`CXIdxEntity_TemplatePartialSpecialization` = 2L
`CXIdxEntity_TemplateSpecialization` = 3L



 `CXIdxEntityCXXTemplateKind`  = structure(0:3, .Names = c("CXIdxEntity_NonTemplate", "CXIdxEntity_Template", 
"CXIdxEntity_TemplatePartialSpecialization", "CXIdxEntity_TemplateSpecialization"
))


##########################

`CXIdxAttr_Unexposed` = 0L
`CXIdxAttr_IBAction` = 1L
`CXIdxAttr_IBOutlet` = 2L
`CXIdxAttr_IBOutletCollection` = 3L



 `CXIdxAttrKind`  = structure(0:3, .Names = c("CXIdxAttr_Unexposed", "CXIdxAttr_IBAction", 
"CXIdxAttr_IBOutlet", "CXIdxAttr_IBOutletCollection"))


##########################

`CXIdxDeclFlag_Skipped` = 1L



 `CXIdxDeclInfoFlags`  = structure(1L, .Names = "CXIdxDeclFlag_Skipped")


##########################

`CXIdxObjCContainer_ForwardRef` = 0L
`CXIdxObjCContainer_Interface` = 1L
`CXIdxObjCContainer_Implementation` = 2L



 `CXIdxObjCContainerKind`  = structure(0:2, .Names = c("CXIdxObjCContainer_ForwardRef", "CXIdxObjCContainer_Interface", 
"CXIdxObjCContainer_Implementation"))


##########################

`CXIdxEntityRef_Direct` = 1L
`CXIdxEntityRef_Implicit` = 2L



 `CXIdxEntityRefKind`  = structure(1:2, .Names = c("CXIdxEntityRef_Direct", "CXIdxEntityRef_Implicit"
))


##########################

`CXIndexOpt_None` = 0L
`CXIndexOpt_SuppressRedundantRefs` = 1L
`CXIndexOpt_IndexFunctionLocalSymbols` = 2L
`CXIndexOpt_IndexImplicitTemplateInstantiations` = 4L
`CXIndexOpt_SuppressWarnings` = 8L
`CXIndexOpt_SkipParsedBodiesInSession` = 16L



 `CXIndexOptFlags`  = structure(c(0L, 1L, 2L, 4L, 8L, 16L), .Names = c("CXIndexOpt_None", 
"CXIndexOpt_SuppressRedundantRefs", "CXIndexOpt_IndexFunctionLocalSymbols", 
"CXIndexOpt_IndexImplicitTemplateInstantiations", "CXIndexOpt_SuppressWarnings", 
"CXIndexOpt_SkipParsedBodiesInSession"))


##########################




} else
    cat("Skipping enums for 3.7\n")

