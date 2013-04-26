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
