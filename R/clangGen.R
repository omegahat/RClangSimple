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
