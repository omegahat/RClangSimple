getSizeOf <-
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




Type_getAlignOf <-
function( T )
{
.Call('R_clang_Type_getAlignOf', as(T, 'CXType'))
}




Type_getOffsetOf <-
function( T, S )
{
.Call('R_clang_Type_getOffsetOf', as(T, 'CXType'), as(S, 'character'))
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




Cursor_getReceiverType <-
function( C )
{
.Call('R_clang_Cursor_getReceiverType', as(C, 'CXCursor'))
}


Cursor_getRawCommentText <-
function( C )
{
.Call('R_clang_Cursor_getRawCommentText', as(C, 'CXCursor'))
}


Cursor_getBriefCommentText <-
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


Location_isInSystemHeader <-
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
function( TU , FileName , options  )
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
