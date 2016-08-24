Type_getSizeOf <- getSizeOf <-
function( T )
{
.Call('R_clang_Type_getSizeOf', as(T, 'CXType'))
}

getArraySize <-
function( T )
{
.Call('R_clang_getArraySize', as(T, 'CXType'))
}

getNumElements <-
function( T )
{
.Call('R_clang_getNumElements', as(T, 'CXType'))
}

getArrayElementType <-
function( T )
{
.Call('R_clang_getArrayElementType', as(T, 'CXType'))
}


hashCursor <-
function( arg1 )
{
.Call('R_clang_hashCursor', as(arg1, 'CXCursor'))
}

CXXMethod_isStatic <-
function( C )
{
.Call('R_clang_CXXMethod_isStatic', as(C, 'CXCursor'))
}


CXXMethod_isVirtual <-
function( C )
{
.Call('R_clang_CXXMethod_isVirtual', as(C, 'CXCursor'))
}


CXXMethod_isPureVirtual <-
function( C )
{
.Call('R_clang_CXXMethod_isPureVirtual', as(C, 'CXCursor'))
}

CXXMethod_isConst <-
function( C )
{
.Call('R_clang_CXXMethod_isConst', as(C, 'CXCursor'))
}


getTokenKind <-
function( arg1 )
{
.Call('R_clang_getTokenKind', as(arg1, 'CXToken'))
}


getModule <-
function( C )
{
.Call('R_clang_Cursor_getModule', as(C, 'CXCursor'))
}


isDynamicCall <-
function( C )
{
  .Call('R_clang_Cursor_isDynamicCall', as(C, 'CXCursor'))
}

isCursorDefinition <-
function( arg1 )
{
.Call('R_clang_isCursorDefinition', as(arg1, 'CXCursor'))
}

getCanonicalCursor <-
function( arg1 )
{
.Call('R_clang_getCanonicalCursor', as(arg1, 'CXCursor'))
}


getNumOverloadedDecls <-
function( cursor )
{
.Call('R_clang_getNumOverloadedDecls', as(cursor, 'CXCursor'))
}





Cursor_isNull <-
function( cursor )
{
.Call('R_clang_Cursor_isNull', as(cursor, 'CXCursor'))
}


Cursor_getNumArguments <-
function( C )
{
.Call('R_clang_Cursor_getNumArguments', as(C, 'CXCursor'))
}


Cursor_getArgument <-
function( C, i )
{
.Call('R_clang_Cursor_getArgument', as(C, 'CXCursor'), as(i, 'numeric'))
}


Cursor_isBitField <-
function( C )
{
.Call('R_clang_Cursor_isBitField', as(C, 'CXCursor'))
}




Cursor_getReceiverType <- getReceiverType <-
function( C )
{
.Call('R_clang_Cursor_getReceiverType', as(C, 'CXCursor'))
}


Cursor_getRawCommentText <- getRawCommentText <-
function( C )
{
.Call('R_clang_Cursor_getRawCommentText', as(C, 'CXCursor'))
}


getBriefCommentText <- Cursor_getBriefCommentText <-
function( C )
{
.Call('R_clang_Cursor_getBriefCommentText', as(C, 'CXCursor'))
}



Module_getParent <-
function( Module  )
{
.Call('R_clang_Module_getParent', as(Module, 'CXModule'))
}


Module_getParent <-
function( Module  )
{
.Call('R_clang_Module_getParent', as(Module, 'CXModule'))
}


Module_getName <-
function( Module  )
{
.Call('R_clang_Module_getName', as(Module, 'CXModule'))
}


Module_getFullName <-
function( Module  )
{
.Call('R_clang_Module_getFullName', as(Module, 'CXModule'))
}


Module_getNumTopLevelHeaders <-
function( arg1 , Module  )
{
.Call('R_clang_Module_getNumTopLevelHeaders', as(arg1, 'CXTranslationUnit'), as(Module, 'CXModule'))
}


Module_getTopLevelHeader <-
function( arg1 , Module , Index  )
{
.Call('R_clang_Module_getTopLevelHeader', as(arg1, 'CXTranslationUnit'), as(Module, 'CXModule'), as(Index, 'numeric'))
}


Module_getParent <-
function( Module  )
{
.Call('R_clang_Module_getParent', as(Module, 'CXModule'))
}


Module_getName <-
function( Module  )
{
.Call('R_clang_Module_getName', as(Module, 'CXModule'))
}


Module_getFullName <-
function( Module  )
{
.Call('R_clang_Module_getFullName', as(Module, 'CXModule'))
}


Module_getNumTopLevelHeaders <-
function( arg1 , Module  )
{
.Call('R_clang_Module_getNumTopLevelHeaders', as(arg1, 'CXTranslationUnit'), as(Module, 'CXModule'))
}


Module_getTopLevelHeader <-
function( arg1 , Module , Index  )
{
.Call('R_clang_Module_getTopLevelHeader', as(arg1, 'CXTranslationUnit'), as(Module, 'CXModule'), as(Index, 'numeric'))
}


equalTypes <-
function( A , B  )
{
.Call('R_clang_equalTypes', as(A, 'CXType'), as(B, 'CXType'))
}


isPODType <-
function( T  )
{
.Call('R_clang_isPODType', as(T, 'CXType'))
}



Cursor_isDynamicCall <-
function( C  )
{
.Call('R_clang_Cursor_isDynamicCall', as(C, 'CXCursor'))
}







isVolatileQualifiedType <-
function( T  )
{
.Call('R_clang_isVolatileQualifiedType', as(T, 'CXType'))
}


isRestrictQualifiedType <-
function( T  )
{
.Call('R_clang_isRestrictQualifiedType', as(T, 'CXType'))
}


isInvalid <-
function( arg1  )
{
.Call('R_clang_isInvalid', as(arg1, 'CXCursorKind'))
}






isReference <-
function( arg1  )
{
.Call('R_clang_isReference', as(arg1, 'CXCursorKind'))
}





isAttribute <-
function( arg1  )
{
.Call('R_clang_isAttribute', as(arg1, 'CXCursorKind'))
}




isPreprocessing <-
function( arg1  )
{
.Call('R_clang_isPreprocessing', as(arg1, 'CXCursorKind'))
}




isConstQualifiedType <-
function( T  )
{
.Call('R_clang_isConstQualifiedType', as(T, 'CXType'))
}


isFunctionTypeVariadic <-
function( T  )
{
.Call('R_clang_isFunctionTypeVariadic', as(T, 'CXType'))
}






getFileTime <-
function( SFile  )
{
  as.POSIXct(.Call('R_clang_getFileTime', as(SFile, 'CXFile')))
}


getFile <-
function( tu , file_name  )
{
.Call('R_clang_getFile', as(tu, 'CXTranslationUnit'), as(file_name, 'character'))
}


getCursorSemanticParent <-
function( cursor  )
{
.Call('R_clang_getCursorSemanticParent', as(cursor, 'CXCursor'))
}


getCursorLexicalParent <-
function( cursor  )
{
.Call('R_clang_getCursorLexicalParent', as(cursor, 'CXCursor'))
}


CXCursorSet_insert <-
function( cset , cursor  )
{
.Call('R_clang_CXCursorSet_insert', as(cset, 'CXCursorSet'), as(cursor, 'CXCursor'))
}


CXCursorSet_contains <-
function( cset , cursor  )
{
.Call('R_clang_CXCursorSet_contains', as(cset, 'CXCursorSet'), as(cursor, 'CXCursor'))
}


isInSystemHeader <- Location_isInSystemHeader <-
function( location  )
{
.Call('R_clang_Location_isInSystemHeader', as(location, 'CXSourceLocation'))
}


getTranslationUnitSpelling <-
function( CTUnit  )
{
.Call('R_clang_getTranslationUnitSpelling', as(CTUnit, 'CXTranslationUnit'))
}


saveTranslationUnit <-
function( TU , FileName , options = 0 )
{
.Call('R_clang_saveTranslationUnit', as(TU, 'CXTranslationUnit'), as(FileName, 'character'), as(options, 'numeric'))
}


defaultReparseOptions <-
function( TU  )
{
.Call('R_clang_defaultReparseOptions', as(TU, 'CXTranslationUnit'))
}


getCursorAvailability <-
function( cursor  )
{
.Call('R_clang_getCursorAvailability', as(cursor, 'CXCursor'))
}


getCursorUSR <-
function( arg1  )
{
.Call('R_clang_getCursorUSR', as(arg1, 'CXCursor'))
}


isFileMultipleIncludeGuarded <-
function( tu , file  )
{
.Call('R_clang_isFileMultipleIncludeGuarded', as(tu, 'CXTranslationUnit'), as(file, 'CXFile'))
}


getCursorReferenced <-
function( arg1  )
{
.Call('R_clang_getCursorReferenced', as(arg1, 'CXCursor'))
}


getDiagnosticSetFromTU <-
function( Unit  )
{
.Call('R_clang_getDiagnosticSetFromTU', as(Unit, 'CXTranslationUnit'))
}


getDiagnostic <-
function( Unit , Index  )
{
  # 
.Call('R_clang_getDiagnostic', as(Unit, 'CXTranslationUnit'), as(Index, 'numeric') - 1)
}

getDiagnosticInSet <-
function( diags , Index  )
{
  # 
.Call('R_clang_getDiagnosticInsSt', as(diags, 'CXDiagnosticSet'), as(Index, 'numeric') - 1)
}

clang_getNumDiagnosticsInSet <-
function( Diags )
{
.Call('R_clang_getNumDiagnosticsInSet', as(Diags, 'CXDiagnosticSet'))
}

clang_getDiagnosticNumRanges <-
function( arg1 )
{
.Call('R_clang_getDiagnosticNumRanges', as(arg1, 'CXDiagnostic'))
} 


getNumDiagnostics <-
function( Unit  )
{
.Call('R_clang_getNumDiagnostics', as(Unit, 'CXTranslationUnit'))
}


defaultDiagnosticDisplayOptions <-
function(  )
{
.Call('R_clang_defaultDiagnosticDisplayOptions')
}


getDiagnosticSpelling <-
function( arg1  )
{
.Call('R_clang_getDiagnosticSpelling', as(arg1, 'CXDiagnostic'))
}


getDiagnosticLocation <-
function( arg1  )
{
.Call('R_clang_getDiagnosticLocation', as(arg1, 'CXDiagnostic'))
}


getDiagnosticSeverity <-
function( arg1  )
{
.Call('R_clang_getDiagnosticSeverity', as(arg1, 'CXDiagnostic'))
}


formatDiagnostic <-
function( Diagnostic , Options  )
{
.Call('R_clang_formatDiagnostic', as(Diagnostic, 'CXDiagnostic'), as(Options, 'numeric'))
}


disposeIndex <-
function( index )
{
.Call('R_clang_disposeIndex', as(index, 'CXIndex'))
}

toggleCrashRecovery <-
function( isEnabled )
{
.Call('R_clang_toggleCrashRecovery', as(isEnabled, 'numeric'))
}


getFunctionTypeCallingConv <-
function( T )
{
.Call('R_clang_getFunctionTypeCallingConv', as(T, 'CXType'))
} 


CXIndex_getGlobalOptions <-
function( arg1 )
{
 as(.Call('R_clang_CXIndex_getGlobalOptions', as(arg1, 'CXIndex')), "CXGlobalOptFlags")  # manually coerced.
}

CXIndex_setGlobalOptions <-
function( arg1, options )
{
.Call('R_clang_CXIndex_setGlobalOptions', as(arg1, 'CXIndex'), as.numeric(as(options, 'CXGlobalOptFlags')))  # changed manually from numeric.
}

getTemplateCursorKind <-
function( C )
{
.Call('R_clang_getTemplateCursorKind', as(C, 'CXCursor'))
} 

enableStackTraces <-
function(  )
{
.Call('R_clang_enableStackTraces')
} 


getNumArguments <-
function( C )
{
   .Call('R_clang_Cursor_getNumArguments', as(C, 'CXCursor'))
} 

defaultSaveOptions <-
function( TU )
{
.Call('R_clang_defaultSaveOptions', as(TU, 'CXTranslationUnit'))
}


getEnumConstantDeclValue <-
function( C )
{
.Call('R_clang_getEnumConstantDeclValue', as(C, 'CXCursor'))
}

getFieldDeclBitWidth <-
function( C )
{
.Call('R_clang_getFieldDeclBitWidth', as(C, 'CXCursor'))
} 

getSpecializedCursorTemplate <-
function( C )
{
.Call('R_clang_getSpecializedCursorTemplate', as(C, 'CXCursor'))
} 


getElementType <-
function( T )
{
.Call('R_clang_getElementType', as(T, 'CXType'))
} 


getNumOverloadedDecls <-
function( cursor )
{
.Call('R_clang_getNumOverloadedDecls', as(cursor, 'CXCursor'))
}

getOverloadedDecl <-
function( cursor, index )
{
.Call('R_clang_getOverloadedDecl', as(cursor, 'CXCursor'), as(index, 'numeric'))
}

getEnumDeclIntegerType <-
function( C )
{
.Call('R_clang_getEnumDeclIntegerType', as(C, 'CXCursor'))
} 



getTypedefDeclUnderlyingType <-
function( C )
{
.Call('R_clang_getTypedefDeclUnderlyingType', as(C, 'CXCursor'))
} 

equalRanges <-
function( range1, range2 )
{
.Call('R_clang_equalRanges', as(range1, 'CXSourceRange'), as(range2, 'CXSourceRange'))
}

equalLocations <-
function( loc1, loc2 )
{
.Call('R_clang_equalLocations', as(loc1, 'CXSourceLocation'), as(loc2, 'CXSourceLocation'))
}

equalCursors <-
function( arg1, arg2 )
{
.Call('R_clang_equalCursors', as(arg1, 'CXCursor'), as(arg2, 'CXCursor'))
}


getCursorLocation <-
function( arg1 )
{
.Call('R_clang_getCursorLocation', as(arg1, 'CXCursor'))
}

getRange <-
function( begin, end )
{
.Call('R_clang_getRange', as(begin, 'CXSourceLocation'), as(end, 'CXSourceLocation'))
} 


getParsedComment <- Cursor_getParsedComment <-
function( C )
{
.Call('R_clang_Cursor_getParsedComment', as(C, 'CXCursor'))
} 


Comment_getChild <-
function( Comment, ChildIdx )
{
.Call('R_clang_Comment_getChild', as(Comment, 'CXComment'), as(ChildIdx, 'numeric'))
}


Comment_getNumChildren <-
function( Comment )
{
.Call('R_clang_Comment_getNumChildren', as(Comment, 'CXComment'))
}

Comment_getKind <-
function( Comment )
{
.Call('R_clang_Comment_getKind', as(Comment, 'CXComment'))
}

Comment_isWhitespace <-
function( Comment )
{
.Call('R_clang_Comment_isWhitespace', as(Comment, 'CXComment'))
} 


getIncludedFile <-
function( cursor )
{
.Call('R_clang_getIncludedFile', as(cursor, 'CXCursor'))
} 


getNullCursor <-
function(  )
{
.Call('R_clang_getNullCursor')
}

getNullLocation <-
function(  )
{
.Call('R_clang_getNullLocation')
}


Type_getOffsetOf <- getOffsetOf <-
function( T, S )
{
.Call('R_clang_Type_getOffsetOf', as(T, 'CXType'), as(S, 'character'))
}


Type_getAlignOf <- getAlignOf  <-
function( T )
{
.Call('R_clang_Type_getAlignOf', as(T, 'CXType'))
}


getCursorDefinition <-
function( arg1 )
{
.Call('R_clang_getCursorDefinition', as(arg1, 'CXCursor'))
}
