setClass("CXGlobalOptFlags", contains = "BitwiseValue")
 setAs("character", "CXGlobalOptFlags", function(from) asBitwiseValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = c('CXGlobalOpt_', 'CXGlobalOpt_ThreadBackgroundPriorityFor')) )
 setAs("integer", "CXGlobalOptFlags", function(from) asBitwiseValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = c('CXGlobalOpt_', 'CXGlobalOpt_ThreadBackgroundPriorityFor')) )
 setAs("numeric", "CXGlobalOptFlags", function(from) asBitwiseValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = c('CXGlobalOpt_', 'CXGlobalOpt_ThreadBackgroundPriorityFor')) )



setClass("CXTranslationUnit_Flags", contains = "BitwiseValue")
 setAs("character", "CXTranslationUnit_Flags", function(from) asBitwiseValue(from, CXTranslationUnit_FlagsValues, "CXTranslationUnit_Flags", prefix = 'CXTranslationUnit_') )
 setAs("integer", "CXTranslationUnit_Flags", function(from) asBitwiseValue(from, CXTranslationUnit_FlagsValues, "CXTranslationUnit_Flags", prefix = 'CXTranslationUnit_') )

