#include "RClang.h"

    SEXP Renum_convert_CXLanguageKind ( enum CXLanguageKind  val)
    {
    const char *elName = NULL;
    SEXP klass, ans;
    switch(val) {
        case CXLanguage_Invalid:
       elName = "CXLanguage_Invalid";
     break;
        case CXLanguage_C:
       elName = "CXLanguage_C";
     break;
        case CXLanguage_ObjC:
       elName = "CXLanguage_ObjC";
     break;
        case CXLanguage_CPlusPlus:
       elName = "CXLanguage_CPlusPlus";
     break;
        default:
    	elName = "?";
    	}


    #if defined(USE_S4_ENUMS)
    
    SEXP tmp
    PROTECT(klass = MAKE_CLASS("CXLanguageKind"));
    PROTECT(ans = NEW(klass));
    PROTECT(tmp = ScalarInteger(val));
    SET_NAMES(tmp, mkString(elName));
    ans = SET_SLOT(ans, Rf_install(".Data"), tmp);
    UNPROTECT(3);
    
    #else
    
    PROTECT(ans = ScalarInteger(val));
    SET_NAMES(ans, mkString(elName));
    PROTECT(klass = NEW_CHARACTER(2));
    SET_STRING_ELT(klass, 0, mkChar("CXLanguageKind"));
    SET_STRING_ELT(klass, 1, mkChar("EnumValue"));
    SET_CLASS(ans, klass);
    UNPROTECT(2);
    
    #endif
    
    return(ans);
    
}



SEXP
Renum_convert_CXTokenKind(CXTokenKind val)
{
const char *elName;
switch(val) {
   case CXToken_Punctuation:
	elName = "CXToken_Punctuation";
	break;
   case CXToken_Keyword:
	elName = "CXToken_Keyword";
	break;
   case CXToken_Identifier:
	elName = "CXToken_Identifier";
	break;
   case CXToken_Literal:
	elName = "CXToken_Literal";
	break;
   case CXToken_Comment:
	elName = "CXToken_Comment";
	break;
   default:
	elName = "?";
}
return(R_makeEnumValue(val, elName, "CXTokenKind"));
}


SEXP
Renum_convert_CXAvailabilityKind(enum CXAvailabilityKind val)
{
const char *elName;
switch(val) {
   case CXAvailability_Available:
	elName = "CXAvailability_Available";
	break;
   case CXAvailability_Deprecated:
	elName = "CXAvailability_Deprecated";
	break;
   case CXAvailability_NotAvailable:
	elName = "CXAvailability_NotAvailable";
	break;
   case CXAvailability_NotAccessible:
	elName = "CXAvailability_NotAccessible";
	break;
   default:
	elName = "?";
}
return(R_makeEnumValue(val, elName, "CXAvailabilityKind"));
}



SEXP
Renum_convert_CXDiagnosticSeverity(enum CXDiagnosticSeverity val)
{
const char *elName;
switch(val) {
   case CXDiagnostic_Ignored:
	elName = "CXDiagnostic_Ignored";
	break;
   case CXDiagnostic_Note:
	elName = "CXDiagnostic_Note";
	break;
   case CXDiagnostic_Warning:
	elName = "CXDiagnostic_Warning";
	break;
   case CXDiagnostic_Error:
	elName = "CXDiagnostic_Error";
	break;
   case CXDiagnostic_Fatal:
	elName = "CXDiagnostic_Fatal";
	break;
   default:
	elName = "?";
}
return(R_makeEnumValue(val, elName, "CXDiagnosticSeverity"));
}


SEXP
Renum_convert_CXCallingConv(enum CXCallingConv val)
{
const char *elName;
switch(val) {
   case CXCallingConv_Default:
	elName = "CXCallingConv_Default";
	break;
   case CXCallingConv_C:
	elName = "CXCallingConv_C";
	break;
   case CXCallingConv_X86StdCall:
	elName = "CXCallingConv_X86StdCall";
	break;
   case CXCallingConv_X86FastCall:
	elName = "CXCallingConv_X86FastCall";
	break;
   case CXCallingConv_X86ThisCall:
	elName = "CXCallingConv_X86ThisCall";
	break;
   case CXCallingConv_X86Pascal:
	elName = "CXCallingConv_X86Pascal";
	break;
   case CXCallingConv_AAPCS:
	elName = "CXCallingConv_AAPCS";
	break;
   case CXCallingConv_AAPCS_VFP:
	elName = "CXCallingConv_AAPCS_VFP";
	break;
   case CXCallingConv_PnaclCall:
	elName = "CXCallingConv_PnaclCall";
	break;
   case CXCallingConv_IntelOclBicc:
	elName = "CXCallingConv_IntelOclBicc";
	break;
   case CXCallingConv_Invalid:
	elName = "CXCallingConv_Invalid";
	break;
   case CXCallingConv_Unexposed:
	elName = "CXCallingConv_Unexposed";
	break;
   default:
	elName = "?";
}
return(R_makeEnumValue(val, elName, "CXCallingConv"));
}


SEXP
Renum_convert_CXCursorKind(enum CXCursorKind val)
{
const char *elName;
switch(val) {
   case CXCursor_UnexposedDecl:
	elName = "CXCursor_UnexposedDecl";
	break;
   case CXCursor_StructDecl:
	elName = "CXCursor_StructDecl";
	break;
   case CXCursor_UnionDecl:
	elName = "CXCursor_UnionDecl";
	break;
   case CXCursor_ClassDecl:
	elName = "CXCursor_ClassDecl";
	break;
   case CXCursor_EnumDecl:
	elName = "CXCursor_EnumDecl";
	break;
   case CXCursor_FieldDecl:
	elName = "CXCursor_FieldDecl";
	break;
   case CXCursor_EnumConstantDecl:
	elName = "CXCursor_EnumConstantDecl";
	break;
   case CXCursor_FunctionDecl:
	elName = "CXCursor_FunctionDecl";
	break;
   case CXCursor_VarDecl:
	elName = "CXCursor_VarDecl";
	break;
   case CXCursor_ParmDecl:
	elName = "CXCursor_ParmDecl";
	break;
   case CXCursor_ObjCInterfaceDecl:
	elName = "CXCursor_ObjCInterfaceDecl";
	break;
   case CXCursor_ObjCCategoryDecl:
	elName = "CXCursor_ObjCCategoryDecl";
	break;
   case CXCursor_ObjCProtocolDecl:
	elName = "CXCursor_ObjCProtocolDecl";
	break;
   case CXCursor_ObjCPropertyDecl:
	elName = "CXCursor_ObjCPropertyDecl";
	break;
   case CXCursor_ObjCIvarDecl:
	elName = "CXCursor_ObjCIvarDecl";
	break;
   case CXCursor_ObjCInstanceMethodDecl:
	elName = "CXCursor_ObjCInstanceMethodDecl";
	break;
   case CXCursor_ObjCClassMethodDecl:
	elName = "CXCursor_ObjCClassMethodDecl";
	break;
   case CXCursor_ObjCImplementationDecl:
	elName = "CXCursor_ObjCImplementationDecl";
	break;
   case CXCursor_ObjCCategoryImplDecl:
	elName = "CXCursor_ObjCCategoryImplDecl";
	break;
   case CXCursor_TypedefDecl:
	elName = "CXCursor_TypedefDecl";
	break;
   case CXCursor_CXXMethod:
	elName = "CXCursor_CXXMethod";
	break;
   case CXCursor_Namespace:
	elName = "CXCursor_Namespace";
	break;
   case CXCursor_LinkageSpec:
	elName = "CXCursor_LinkageSpec";
	break;
   case CXCursor_Constructor:
	elName = "CXCursor_Constructor";
	break;
   case CXCursor_Destructor:
	elName = "CXCursor_Destructor";
	break;
   case CXCursor_ConversionFunction:
	elName = "CXCursor_ConversionFunction";
	break;
   case CXCursor_TemplateTypeParameter:
	elName = "CXCursor_TemplateTypeParameter";
	break;
   case CXCursor_NonTypeTemplateParameter:
	elName = "CXCursor_NonTypeTemplateParameter";
	break;
   case CXCursor_TemplateTemplateParameter:
	elName = "CXCursor_TemplateTemplateParameter";
	break;
   case CXCursor_FunctionTemplate:
	elName = "CXCursor_FunctionTemplate";
	break;
   case CXCursor_ClassTemplate:
	elName = "CXCursor_ClassTemplate";
	break;
   case CXCursor_ClassTemplatePartialSpecialization:
	elName = "CXCursor_ClassTemplatePartialSpecialization";
	break;
   case CXCursor_NamespaceAlias:
	elName = "CXCursor_NamespaceAlias";
	break;
   case CXCursor_UsingDirective:
	elName = "CXCursor_UsingDirective";
	break;
   case CXCursor_UsingDeclaration:
	elName = "CXCursor_UsingDeclaration";
	break;
   case CXCursor_TypeAliasDecl:
	elName = "CXCursor_TypeAliasDecl";
	break;
   case CXCursor_ObjCSynthesizeDecl:
	elName = "CXCursor_ObjCSynthesizeDecl";
	break;
   case CXCursor_ObjCDynamicDecl:
	elName = "CXCursor_ObjCDynamicDecl";
	break;
   case CXCursor_CXXAccessSpecifier:
	elName = "CXCursor_CXXAccessSpecifier";
	break;
   case CXCursor_FirstRef:
	elName = "CXCursor_FirstRef";
	break;
   case CXCursor_ObjCProtocolRef:
	elName = "CXCursor_ObjCProtocolRef";
	break;
   case CXCursor_ObjCClassRef:
	elName = "CXCursor_ObjCClassRef";
	break;
   case CXCursor_TypeRef:
	elName = "CXCursor_TypeRef";
	break;
   case CXCursor_CXXBaseSpecifier:
	elName = "CXCursor_CXXBaseSpecifier";
	break;
   case CXCursor_TemplateRef:
	elName = "CXCursor_TemplateRef";
	break;
   case CXCursor_NamespaceRef:
	elName = "CXCursor_NamespaceRef";
	break;
   case CXCursor_MemberRef:
	elName = "CXCursor_MemberRef";
	break;
   case CXCursor_LabelRef:
	elName = "CXCursor_LabelRef";
	break;
   case CXCursor_OverloadedDeclRef:
	elName = "CXCursor_OverloadedDeclRef";
	break;
   case CXCursor_VariableRef:
	elName = "CXCursor_VariableRef";
	break;
   case CXCursor_FirstInvalid:
	elName = "CXCursor_FirstInvalid";
	break;
   case CXCursor_NoDeclFound:
	elName = "CXCursor_NoDeclFound";
	break;
   case CXCursor_NotImplemented:
	elName = "CXCursor_NotImplemented";
	break;
   case CXCursor_InvalidCode:
	elName = "CXCursor_InvalidCode";
	break;
   case CXCursor_FirstExpr:
	elName = "CXCursor_FirstExpr";
	break;
   case CXCursor_DeclRefExpr:
	elName = "CXCursor_DeclRefExpr";
	break;
   case CXCursor_MemberRefExpr:
	elName = "CXCursor_MemberRefExpr";
	break;
   case CXCursor_CallExpr:
	elName = "CXCursor_CallExpr";
	break;
   case CXCursor_ObjCMessageExpr:
	elName = "CXCursor_ObjCMessageExpr";
	break;
   case CXCursor_BlockExpr:
	elName = "CXCursor_BlockExpr";
	break;
   case CXCursor_IntegerLiteral:
	elName = "CXCursor_IntegerLiteral";
	break;
   case CXCursor_FloatingLiteral:
	elName = "CXCursor_FloatingLiteral";
	break;
   case CXCursor_ImaginaryLiteral:
	elName = "CXCursor_ImaginaryLiteral";
	break;
   case CXCursor_StringLiteral:
	elName = "CXCursor_StringLiteral";
	break;
   case CXCursor_CharacterLiteral:
	elName = "CXCursor_CharacterLiteral";
	break;
   case CXCursor_ParenExpr:
	elName = "CXCursor_ParenExpr";
	break;
   case CXCursor_UnaryOperator:
	elName = "CXCursor_UnaryOperator";
	break;
   case CXCursor_ArraySubscriptExpr:
	elName = "CXCursor_ArraySubscriptExpr";
	break;
   case CXCursor_BinaryOperator:
	elName = "CXCursor_BinaryOperator";
	break;
   case CXCursor_CompoundAssignOperator:
	elName = "CXCursor_CompoundAssignOperator";
	break;
   case CXCursor_ConditionalOperator:
	elName = "CXCursor_ConditionalOperator";
	break;
   case CXCursor_CStyleCastExpr:
	elName = "CXCursor_CStyleCastExpr";
	break;
   case CXCursor_CompoundLiteralExpr:
	elName = "CXCursor_CompoundLiteralExpr";
	break;
   case CXCursor_InitListExpr:
	elName = "CXCursor_InitListExpr";
	break;
   case CXCursor_AddrLabelExpr:
	elName = "CXCursor_AddrLabelExpr";
	break;
   case CXCursor_StmtExpr:
	elName = "CXCursor_StmtExpr";
	break;
   case CXCursor_GenericSelectionExpr:
	elName = "CXCursor_GenericSelectionExpr";
	break;
   case CXCursor_GNUNullExpr:
	elName = "CXCursor_GNUNullExpr";
	break;
   case CXCursor_CXXStaticCastExpr:
	elName = "CXCursor_CXXStaticCastExpr";
	break;
   case CXCursor_CXXDynamicCastExpr:
	elName = "CXCursor_CXXDynamicCastExpr";
	break;
   case CXCursor_CXXReinterpretCastExpr:
	elName = "CXCursor_CXXReinterpretCastExpr";
	break;
   case CXCursor_CXXConstCastExpr:
	elName = "CXCursor_CXXConstCastExpr";
	break;
   case CXCursor_CXXFunctionalCastExpr:
	elName = "CXCursor_CXXFunctionalCastExpr";
	break;
   case CXCursor_CXXTypeidExpr:
	elName = "CXCursor_CXXTypeidExpr";
	break;
   case CXCursor_CXXBoolLiteralExpr:
	elName = "CXCursor_CXXBoolLiteralExpr";
	break;
   case CXCursor_CXXNullPtrLiteralExpr:
	elName = "CXCursor_CXXNullPtrLiteralExpr";
	break;
   case CXCursor_CXXThisExpr:
	elName = "CXCursor_CXXThisExpr";
	break;
   case CXCursor_CXXThrowExpr:
	elName = "CXCursor_CXXThrowExpr";
	break;
   case CXCursor_CXXNewExpr:
	elName = "CXCursor_CXXNewExpr";
	break;
   case CXCursor_CXXDeleteExpr:
	elName = "CXCursor_CXXDeleteExpr";
	break;
   case CXCursor_UnaryExpr:
	elName = "CXCursor_UnaryExpr";
	break;
   case CXCursor_ObjCStringLiteral:
	elName = "CXCursor_ObjCStringLiteral";
	break;
   case CXCursor_ObjCEncodeExpr:
	elName = "CXCursor_ObjCEncodeExpr";
	break;
   case CXCursor_ObjCSelectorExpr:
	elName = "CXCursor_ObjCSelectorExpr";
	break;
   case CXCursor_ObjCProtocolExpr:
	elName = "CXCursor_ObjCProtocolExpr";
	break;
   case CXCursor_ObjCBridgedCastExpr:
	elName = "CXCursor_ObjCBridgedCastExpr";
	break;
   case CXCursor_PackExpansionExpr:
	elName = "CXCursor_PackExpansionExpr";
	break;
   case CXCursor_SizeOfPackExpr:
	elName = "CXCursor_SizeOfPackExpr";
	break;
   case CXCursor_LambdaExpr:
	elName = "CXCursor_LambdaExpr";
	break;
   case CXCursor_ObjCBoolLiteralExpr:
	elName = "CXCursor_ObjCBoolLiteralExpr";
	break;
   case CXCursor_FirstStmt:
	elName = "CXCursor_FirstStmt";
	break;
   case CXCursor_LabelStmt:
	elName = "CXCursor_LabelStmt";
	break;
   case CXCursor_CompoundStmt:
	elName = "CXCursor_CompoundStmt";
	break;
   case CXCursor_CaseStmt:
	elName = "CXCursor_CaseStmt";
	break;
   case CXCursor_DefaultStmt:
	elName = "CXCursor_DefaultStmt";
	break;
   case CXCursor_IfStmt:
	elName = "CXCursor_IfStmt";
	break;
   case CXCursor_SwitchStmt:
	elName = "CXCursor_SwitchStmt";
	break;
   case CXCursor_WhileStmt:
	elName = "CXCursor_WhileStmt";
	break;
   case CXCursor_DoStmt:
	elName = "CXCursor_DoStmt";
	break;
   case CXCursor_ForStmt:
	elName = "CXCursor_ForStmt";
	break;
   case CXCursor_GotoStmt:
	elName = "CXCursor_GotoStmt";
	break;
   case CXCursor_IndirectGotoStmt:
	elName = "CXCursor_IndirectGotoStmt";
	break;
   case CXCursor_ContinueStmt:
	elName = "CXCursor_ContinueStmt";
	break;
   case CXCursor_BreakStmt:
	elName = "CXCursor_BreakStmt";
	break;
   case CXCursor_ReturnStmt:
	elName = "CXCursor_ReturnStmt";
	break;
   case CXCursor_GCCAsmStmt:
	elName = "CXCursor_GCCAsmStmt";
	break;
   case CXCursor_ObjCAtTryStmt:
	elName = "CXCursor_ObjCAtTryStmt";
	break;
   case CXCursor_ObjCAtCatchStmt:
	elName = "CXCursor_ObjCAtCatchStmt";
	break;
   case CXCursor_ObjCAtFinallyStmt:
	elName = "CXCursor_ObjCAtFinallyStmt";
	break;
   case CXCursor_ObjCAtThrowStmt:
	elName = "CXCursor_ObjCAtThrowStmt";
	break;
   case CXCursor_ObjCAtSynchronizedStmt:
	elName = "CXCursor_ObjCAtSynchronizedStmt";
	break;
   case CXCursor_ObjCAutoreleasePoolStmt:
	elName = "CXCursor_ObjCAutoreleasePoolStmt";
	break;
   case CXCursor_ObjCForCollectionStmt:
	elName = "CXCursor_ObjCForCollectionStmt";
	break;
   case CXCursor_CXXCatchStmt:
	elName = "CXCursor_CXXCatchStmt";
	break;
   case CXCursor_CXXTryStmt:
	elName = "CXCursor_CXXTryStmt";
	break;
   case CXCursor_CXXForRangeStmt:
	elName = "CXCursor_CXXForRangeStmt";
	break;
   case CXCursor_SEHTryStmt:
	elName = "CXCursor_SEHTryStmt";
	break;
   case CXCursor_SEHExceptStmt:
	elName = "CXCursor_SEHExceptStmt";
	break;
   case CXCursor_SEHFinallyStmt:
	elName = "CXCursor_SEHFinallyStmt";
	break;
   case CXCursor_MSAsmStmt:
	elName = "CXCursor_MSAsmStmt";
	break;
   case CXCursor_NullStmt:
	elName = "CXCursor_NullStmt";
	break;
   case CXCursor_DeclStmt:
	elName = "CXCursor_DeclStmt";
	break;
   case CXCursor_TranslationUnit:
	elName = "CXCursor_TranslationUnit";
	break;
   case CXCursor_FirstAttr:
	elName = "CXCursor_FirstAttr";
	break;
   case CXCursor_IBActionAttr:
	elName = "CXCursor_IBActionAttr";
	break;
   case CXCursor_IBOutletAttr:
	elName = "CXCursor_IBOutletAttr";
	break;
   case CXCursor_IBOutletCollectionAttr:
	elName = "CXCursor_IBOutletCollectionAttr";
	break;
   case CXCursor_CXXFinalAttr:
	elName = "CXCursor_CXXFinalAttr";
	break;
   case CXCursor_CXXOverrideAttr:
	elName = "CXCursor_CXXOverrideAttr";
	break;
   case CXCursor_AnnotateAttr:
	elName = "CXCursor_AnnotateAttr";
	break;
   case CXCursor_AsmLabelAttr:
	elName = "CXCursor_AsmLabelAttr";
	break;
   case CXCursor_PreprocessingDirective:
	elName = "CXCursor_PreprocessingDirective";
	break;
   case CXCursor_MacroDefinition:
	elName = "CXCursor_MacroDefinition";
	break;
   case CXCursor_MacroExpansion:
	elName = "CXCursor_MacroExpansion";
	break;
   case CXCursor_InclusionDirective:
	elName = "CXCursor_InclusionDirective";
	break;
   case CXCursor_ModuleImportDecl:
	elName = "CXCursor_ModuleImportDecl";
	break;
   default:
	elName = "?";
}
return(R_makeEnumValue(val, elName, "CXCursorKind"));
}



SEXP
Renum_convert_CXCommentKind(enum CXCommentKind val)
{
const char *elName;
switch(val) {
   case CXComment_Null:
	elName = "CXComment_Null";
	break;
   case CXComment_Text:
	elName = "CXComment_Text";
	break;
   case CXComment_InlineCommand:
	elName = "CXComment_InlineCommand";
	break;
   case CXComment_HTMLStartTag:
	elName = "CXComment_HTMLStartTag";
	break;
   case CXComment_HTMLEndTag:
	elName = "CXComment_HTMLEndTag";
	break;
   case CXComment_Paragraph:
	elName = "CXComment_Paragraph";
	break;
   case CXComment_BlockCommand:
	elName = "CXComment_BlockCommand";
	break;
   case CXComment_ParamCommand:
	elName = "CXComment_ParamCommand";
	break;
   case CXComment_TParamCommand:
	elName = "CXComment_TParamCommand";
	break;
   case CXComment_VerbatimBlockCommand:
	elName = "CXComment_VerbatimBlockCommand";
	break;
   case CXComment_VerbatimBlockLine:
	elName = "CXComment_VerbatimBlockLine";
	break;
   case CXComment_VerbatimLine:
	elName = "CXComment_VerbatimLine";
	break;
   case CXComment_FullComment:
	elName = "CXComment_FullComment";
	break;
   default:
	elName = "?";
}
return(R_makeEnumValue(val, elName, "CXCommentKind"));
}
