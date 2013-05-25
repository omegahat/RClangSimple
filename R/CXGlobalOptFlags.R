setClass("CXGlobalOptFlags", contains = "BitwiseValue")

CXGlobalOptFlagsValues = structure(c(0L, 1L, 2L, 1L), .Names = c('CXGlobalOpt_None', 'CXGlobalOpt_ThreadBackgroundPriorityForIndexing', 'CXGlobalOpt_ThreadBackgroundPriorityForEditing', 'CXGlobalOpt_ThreadBackgroundPriorityForAll'))

CXGlobalOpt_None = BitwiseValue(0L, '0', class = 'CXGlobalOptFlags')
CXGlobalOpt_ThreadBackgroundPriorityForIndexing = BitwiseValue(1L, '1', class = 'CXGlobalOptFlags')
CXGlobalOpt_ThreadBackgroundPriorityForEditing = BitwiseValue(2L, '2', class = 'CXGlobalOptFlags')
CXGlobalOpt_ThreadBackgroundPriorityForAll = BitwiseValue(1L, '1', class = 'CXGlobalOptFlags')

 setAs("character", "CXGlobalOptFlags", function(from) asBitwiseValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = c('CXGlobalOpt_', 'CXGlobalOpt_ThreadBackgroundPriorityFor')) )
 setAs("integer", "CXGlobalOptFlags", function(from) asBitwiseValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = c('CXGlobalOpt_', 'CXGlobalOpt_ThreadBackgroundPriorityFor')) )
 setAs("numeric", "CXGlobalOptFlags", function(from) asBitwiseValue(from, CXGlobalOptFlagsValues, "CXGlobalOptFlags", prefix = c('CXGlobalOpt_', 'CXGlobalOpt_ThreadBackgroundPriorityFor')) )
