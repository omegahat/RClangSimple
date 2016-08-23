if(all(clangVersionNum(libclangVersion_Install ) == c( 3 ,  5 ))) {

CXCallingConv = structure(c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L), .Names = c('CXCallingConv_Default', 'CXCallingConv_C', 'CXCallingConv_X86StdCall', 'CXCallingConv_X86FastCall', 'CXCallingConv_X86ThisCall', 'CXCallingConv_X86Pascal', 'CXCallingConv_AAPCS', 'CXCallingConv_AAPCS_VFP', 'CXCallingConv_PnaclCall', 'CXCallingConv_IntelOclBicc', 'CXCallingConv_Invalid', 'CXCallingConv_Unexposed'))

CXCallingConv_Default = 0L
CXCallingConv_C = 1L
CXCallingConv_X86StdCall = 2L
CXCallingConv_X86FastCall = 3L
CXCallingConv_X86ThisCall = 4L
CXCallingConv_X86Pascal = 5L
CXCallingConv_AAPCS = 6L
CXCallingConv_AAPCS_VFP = 7L
CXCallingConv_PnaclCall = 8L
CXCallingConv_IntelOclBicc = 9L
CXCallingConv_Invalid = 10L
CXCallingConv_Unexposed = 11L



CXChildVisitResult = structure(0:2, .Names = c("CXChildVisit_Break", "CXChildVisit_Continue", 
"CXChildVisit_Recurse"))



`CXChildVisit_Break` = 0L
 `CXChildVisit_Continue` = 1L
 `CXChildVisit_Recurse` = 2L


CXDiagnostic = structure(c(1L, 2L, 4L), .Names = c("CXDiagnostic_DisplaySourceLocation", 
"CXDiagnostic_DisplayColumn", "CXDiagnostic_DisplaySourceRanges"
))



`CXDiagnostic_DisplaySourceLocation` = 1
 `CXDiagnostic_DisplayColumn` = 2
 `CXDiagnostic_DisplaySourceRanges` = 4



setClass("CXGlobalOptFlags", contains = "BitwiseValue")
 setAs("character", "CXGlobalOptFlags", function(from) asBitwiseValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = c('CXGlobalOpt_', 'CXGlobalOpt_ThreadBackgroundPriorityFor')) )
 setAs("integer", "CXGlobalOptFlags", function(from) asBitwiseValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = c('CXGlobalOpt_', 'CXGlobalOpt_ThreadBackgroundPriorityFor')) )
 setAs("numeric", "CXGlobalOptFlags", function(from) asBitwiseValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = c('CXGlobalOpt_', 'CXGlobalOpt_ThreadBackgroundPriorityFor')) )



CXGlobalOptFlagsValues = structure(c(0L, 1L, 2L, 1L), .Names = c('CXGlobalOpt_None', 'CXGlobalOpt_ThreadBackgroundPriorityForIndexing', 'CXGlobalOpt_ThreadBackgroundPriorityForEditing', 'CXGlobalOpt_ThreadBackgroundPriorityForAll'))

CXGlobalOpt_None = BitwiseValue(0L, '0', class = 'CXGlobalOptFlags')
CXGlobalOpt_ThreadBackgroundPriorityForIndexing = BitwiseValue(1L, '1', class = 'CXGlobalOptFlags')
CXGlobalOpt_ThreadBackgroundPriorityForEditing = BitwiseValue(2L, '2', class = 'CXGlobalOptFlags')
CXGlobalOpt_ThreadBackgroundPriorityForAll = BitwiseValue(1L, '1', class = 'CXGlobalOptFlags')


CXLanguageKind =structure(0:3, .Names = c("CXLanguage_Invalid", "CXLanguage_C", 
"CXLanguage_ObjC", "CXLanguage_CPlusPlus"))



`CXLanguage_Invalid` = 0
 `CXLanguage_C` = 1
 `CXLanguage_ObjC` = 2
 `CXLanguage_CPlusPlus` = 3


CXLinkageKind =structure(0:4, .Names = c("CXLinkage_Invalid", "CXLinkage_NoLinkage", 
"CXLinkage_Internal", "CXLinkage_UniqueExternal", "CXLinkage_External"
))



`CXLinkage_Invalid` = 0
 `CXLinkage_NoLinkage` = 1
 `CXLinkage_Internal` = 2
 `CXLinkage_UniqueExternal` = 3
 `CXLinkage_External` = 4


CXTokenKind =structure(0:4, .Names = c("CXToken_Punctuation", "CXToken_Keyword", 
"CXToken_Identifier", "CXToken_Literal", "CXToken_Comment"))


`CXToken_Punctuation` = 0
 `CXToken_Keyword` = 1
 `CXToken_Identifier` = 2
 `CXToken_Literal` = 3
 `CXToken_Comment` = 4





setClass("CXTranslationUnit_Flags", contains = "BitwiseValue")
setAs("character", "CXTranslationUnit_Flags", function(from) asBitwiseValue(from, CXTranslationUnit_FlagsValues, "CXTranslationUnit_Flags", prefix = 'CXTranslationUnit_') )
setAs("integer", "CXTranslationUnit_Flags", function(from) asBitwiseValue(from, CXTranslationUnit_FlagsValues, "CXTranslationUnit_Flags", prefix = 'CXTranslationUnit_') )

CXTranslationUnit_FlagsValues = structure(c(0L, 1L, 2L, 4L, 8L, 16L, 32L, 64L, 128L), .Names = c('CXTranslationUnit_None', 'CXTranslationUnit_DetailedPreprocessingRecord', 'CXTranslationUnit_Incomplete', 'CXTranslationUnit_PrecompiledPreamble', 'CXTranslationUnit_CacheCompletionResults', 'CXTranslationUnit_ForSerialization', 'CXTranslationUnit_CXXChainedPCH', 'CXTranslationUnit_SkipFunctionBodies', 'CXTranslationUnit_IncludeBriefCommentsInCodeCompletion'))

CXTranslationUnit_None = BitwiseValue(0L, '0', class = 'CXTranslationUnit_Flags')
CXTranslationUnit_DetailedPreprocessingRecord = BitwiseValue(1L, '1', class = 'CXTranslationUnit_Flags')
CXTranslationUnit_Incomplete = BitwiseValue(2L, '2', class = 'CXTranslationUnit_Flags')
CXTranslationUnit_PrecompiledPreamble = BitwiseValue(4L, '4', class = 'CXTranslationUnit_Flags')
CXTranslationUnit_CacheCompletionResults = BitwiseValue(8L, '8', class = 'CXTranslationUnit_Flags')
CXTranslationUnit_ForSerialization = BitwiseValue(16L, '16', class = 'CXTranslationUnit_Flags')
CXTranslationUnit_CXXChainedPCH = BitwiseValue(32L, '32', class = 'CXTranslationUnit_Flags')
CXTranslationUnit_SkipFunctionBodies = BitwiseValue(64L, '64', class = 'CXTranslationUnit_Flags')
CXTranslationUnit_IncludeBriefCommentsInCodeCompletion = BitwiseValue(128L, '128', class = 'CXTranslationUnit_Flags')



CXTypeKind = structure(c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 14L, 15L, 16L, 17L, 18L, 19L, 20L, 21L, 22L, 23L, 24L, 25L, 26L, 27L, 28L, 29L, 2L, 29L, 100L, 101L, 102L, 103L, 104L, 105L, 106L, 107L, 108L, 109L, 110L, 111L, 112L, 113L, 114L, 115L, 116L, 117L), .Names = c('CXType_Invalid', 'CXType_Unexposed', 'CXType_Void', 'CXType_Bool', 'CXType_Char_U', 'CXType_UChar', 'CXType_Char16', 'CXType_Char32', 'CXType_UShort', 'CXType_UInt', 'CXType_ULong', 'CXType_ULongLong', 'CXType_UInt128', 'CXType_Char_S', 'CXType_SChar', 'CXType_WChar', 'CXType_Short', 'CXType_Int', 'CXType_Long', 'CXType_LongLong', 'CXType_Int128', 'CXType_Float', 'CXType_Double', 'CXType_LongDouble', 'CXType_NullPtr', 'CXType_Overload', 'CXType_Dependent', 'CXType_ObjCId', 'CXType_ObjCClass', 'CXType_ObjCSel', 'CXType_FirstBuiltin', 'CXType_LastBuiltin', 'CXType_Complex', 'CXType_Pointer', 'CXType_BlockPointer', 'CXType_LValueReference', 'CXType_RValueReference', 'CXType_Record', 'CXType_Enum', 'CXType_Typedef', 'CXType_ObjCInterface', 'CXType_ObjCObjectPointer', 'CXType_FunctionNoProto', 'CXType_FunctionProto', 'CXType_ConstantArray', 'CXType_Vector', 'CXType_IncompleteArray', 'CXType_VariableArray', 'CXType_DependentSizedArray', 'CXType_MemberPointer'))

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



CX_CXXAccessSpecifier =structure(0:3, .Names = c("CX_CXXInvalidAccessSpecifier", "CX_CXXPublic", 
"CX_CXXProtected", "CX_CXXPrivate"))



`CX_CXXInvalidAccessSpecifier` = 0
 `CX_CXXPublic` = 1
 `CX_CXXProtected` = 2
 `CX_CXXPrivate` = 3



} else
    cat("Skipping enums for 3.4\n")

