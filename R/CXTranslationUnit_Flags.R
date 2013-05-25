setClass("CXTranslationUnit_Flags", contains = "BitwiseValue")

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

 setAs("character", "CXTranslationUnit_Flags", function(from) asBitwiseValue(from, CXTranslationUnit_FlagsValues, "CXTranslationUnit_Flags", prefix = 'CXTranslationUnit_') )
 setAs("integer", "CXTranslationUnit_Flags", function(from) asBitwiseValue(from, CXTranslationUnit_FlagsValues, "CXTranslationUnit_Flags", prefix = 'CXTranslationUnit_') )
