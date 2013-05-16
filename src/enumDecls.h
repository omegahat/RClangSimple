#ifdef __cplusplus 
 extern "C" 
#endif 
 SEXP Renum_convert_CXLanguageKind ( enum CXLanguageKind  val) ; 

 SEXP Renum_convert_CXResult ( CXResult  val) ; 


#define EDECL(type) \
 extern SEXP Renum_convert_ ## type ( enum type  val );

EDECL(CXLoadDiag_Error)
EDECL(CXDiagnosticSeverity)
EDECL(CXCursorKind)
EDECL(CXLinkageKind)
EDECL(CXAvailabilityKind)
EDECL(CXCallingConv)
EDECL(CX_CXXAccessSpecifier)
EDECL(CXCommentKind)
EDECL(CXCommentInlineCommandRenderKind)
EDECL(CXCommentParamPassDirection)
EDECL(CXTokenKind)
EDECL(CXCompletionChunkKind)


