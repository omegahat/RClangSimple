#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXString ( CXString   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXStringPtr_get_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXStringPtr_get_private_flags (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXStringPtr_set_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXStringPtr_set_private_flags (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXString *   coerce_CXString_CXStringPtr ( SEXP r_from,  const CXString * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXString_CXStringPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXStringPtr_CXString ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXString () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXStringPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXStringPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXString (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXTranslationUnitImpl ( struct  CXTranslationUnitImpl   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const struct  CXTranslationUnitImpl *   coerce_CXTranslationUnitImpl_CXTranslationUnitImplPtr ( SEXP r_from,  const struct  CXTranslationUnitImpl * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXTranslationUnitImpl_CXTranslationUnitImplPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXTranslationUnitImplPtr_CXTranslationUnitImpl ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXTranslationUnitImpl () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXTranslationUnitImplPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXTranslationUnitImplPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXTranslationUnitImpl (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXUnsavedFile ( struct  CXUnsavedFile   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXUnsavedFilePtr_get_Filename (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXUnsavedFilePtr_get_Contents (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXUnsavedFilePtr_get_Length (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXUnsavedFilePtr_set_Filename (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXUnsavedFilePtr_set_Contents (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXUnsavedFilePtr_set_Length (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const struct  CXUnsavedFile *   coerce_CXUnsavedFile_CXUnsavedFilePtr ( SEXP r_from,  const struct  CXUnsavedFile * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXUnsavedFile_CXUnsavedFilePtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXUnsavedFilePtr_CXUnsavedFile ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXUnsavedFile () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXUnsavedFilePtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXUnsavedFilePtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXUnsavedFile (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXVersion ( struct  CXVersion   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXVersionPtr_get_Major (SEXP r_obj   ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXVersionPtr_get_Minor (SEXP r_obj   ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXVersionPtr_get_Subminor (SEXP r_obj   ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXVersionPtr_set_Major (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXVersionPtr_set_Minor (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXVersionPtr_set_Subminor (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const struct  CXVersion *   coerce_CXVersion_CXVersionPtr ( SEXP r_from,  const struct  CXVersion * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXVersion_CXVersionPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXVersionPtr_CXVersion ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXVersion () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXVersionPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXVersionPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXVersion (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXFileUniqueID ( CXFileUniqueID   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXFileUniqueIDPtr_get_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXFileUniqueIDPtr_set_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXFileUniqueID *   coerce_CXFileUniqueID_CXFileUniqueIDPtr ( SEXP r_from,  const CXFileUniqueID * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXFileUniqueID_CXFileUniqueIDPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXFileUniqueIDPtr_CXFileUniqueID ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXFileUniqueID () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXFileUniqueIDPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXFileUniqueIDPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXFileUniqueID (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXSourceLocation ( CXSourceLocation   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXSourceLocationPtr_get_ptr_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXSourceLocationPtr_get_int_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXSourceLocationPtr_set_ptr_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXSourceLocationPtr_set_int_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXSourceLocation *   coerce_CXSourceLocation_CXSourceLocationPtr ( SEXP r_from,  const CXSourceLocation * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXSourceLocation_CXSourceLocationPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXSourceLocationPtr_CXSourceLocation ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXSourceLocation () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXSourceLocationPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXSourceLocationPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXSourceLocation (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXSourceRange ( CXSourceRange   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXSourceRangePtr_get_ptr_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXSourceRangePtr_get_begin_int_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXSourceRangePtr_get_end_int_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXSourceRangePtr_set_ptr_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXSourceRangePtr_set_begin_int_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXSourceRangePtr_set_end_int_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXSourceRange *   coerce_CXSourceRange_CXSourceRangePtr ( SEXP r_from,  const CXSourceRange * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXSourceRange_CXSourceRangePtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXSourceRangePtr_CXSourceRange ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXSourceRange () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXSourceRangePtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXSourceRangePtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXSourceRange (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXTUResourceUsageEntry ( struct  CXTUResourceUsageEntry   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTUResourceUsageEntryPtr_get_kind (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTUResourceUsageEntryPtr_get_amount (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTUResourceUsageEntryPtr_set_kind (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTUResourceUsageEntryPtr_set_amount (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const struct  CXTUResourceUsageEntry *   coerce_CXTUResourceUsageEntry_CXTUResourceUsageEntryPtr ( SEXP r_from,  const struct  CXTUResourceUsageEntry * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXTUResourceUsageEntry_CXTUResourceUsageEntryPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXTUResourceUsageEntryPtr_CXTUResourceUsageEntry ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXTUResourceUsageEntry () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXTUResourceUsageEntryPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXTUResourceUsageEntryPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXTUResourceUsageEntry (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXTUResourceUsage ( struct  CXTUResourceUsage   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTUResourceUsagePtr_get_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTUResourceUsagePtr_get_numEntries (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTUResourceUsagePtr_get_entries (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTUResourceUsagePtr_set_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTUResourceUsagePtr_set_numEntries (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTUResourceUsagePtr_set_entries (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const struct  CXTUResourceUsage *   coerce_CXTUResourceUsage_CXTUResourceUsagePtr ( SEXP r_from,  const struct  CXTUResourceUsage * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXTUResourceUsage_CXTUResourceUsagePtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXTUResourceUsagePtr_CXTUResourceUsage ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXTUResourceUsage () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXTUResourceUsagePtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXTUResourceUsagePtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXTUResourceUsage (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXCursor ( CXCursor   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCursorPtr_get_kind (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCursorPtr_get_xdata (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCursorPtr_get_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCursorPtr_set_kind (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCursorPtr_set_xdata (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCursorPtr_set_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXCursor *   coerce_CXCursor_CXCursorPtr ( SEXP r_from,  const CXCursor * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXCursor_CXCursorPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXCursorPtr_CXCursor ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXCursor () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXCursorPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXCursorPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXCursor (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXComment ( CXComment   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCommentPtr_get_ASTNode (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCommentPtr_get_TranslationUnit (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCommentPtr_set_ASTNode (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCommentPtr_set_TranslationUnit (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXComment *   coerce_CXComment_CXCommentPtr ( SEXP r_from,  const CXComment * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXComment_CXCommentPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXCommentPtr_CXComment ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXComment () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXCommentPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXCommentPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXComment (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXPlatformAvailability ( struct  CXPlatformAvailability   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_get_Platform (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_get_Introduced (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_get_Deprecated (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_get_Obsoleted (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_get_Unavailable (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_get_Message (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_set_Platform (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_set_Introduced (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_set_Deprecated (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_set_Obsoleted (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_set_Unavailable (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXPlatformAvailabilityPtr_set_Message (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const struct  CXPlatformAvailability *   coerce_CXPlatformAvailability_CXPlatformAvailabilityPtr ( SEXP r_from,  const struct  CXPlatformAvailability * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXPlatformAvailability_CXPlatformAvailabilityPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXPlatformAvailabilityPtr_CXPlatformAvailability ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXPlatformAvailability () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXPlatformAvailabilityPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXPlatformAvailabilityPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXPlatformAvailability (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXCursorSetImpl ( struct  CXCursorSetImpl   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const struct  CXCursorSetImpl *   coerce_CXCursorSetImpl_CXCursorSetImplPtr ( SEXP r_from,  const struct  CXCursorSetImpl * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXCursorSetImpl_CXCursorSetImplPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXCursorSetImplPtr_CXCursorSetImpl ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXCursorSetImpl () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXCursorSetImplPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXCursorSetImplPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXCursorSetImpl (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXType ( CXType   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTypePtr_get_kind (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTypePtr_get_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTypePtr_set_kind (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTypePtr_set_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXType *   coerce_CXType_CXTypePtr ( SEXP r_from,  const CXType * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXType_CXTypePtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXTypePtr_CXType ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXType () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXTypePtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXTypePtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXType (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXToken ( CXToken   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTokenPtr_get_int_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTokenPtr_get_ptr_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTokenPtr_set_int_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXTokenPtr_set_ptr_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXToken *   coerce_CXToken_CXTokenPtr ( SEXP r_from,  const CXToken * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXToken_CXTokenPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXTokenPtr_CXToken ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXToken () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXTokenPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXTokenPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXToken (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXCompletionResult ( CXCompletionResult   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCompletionResultPtr_get_CursorKind (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCompletionResultPtr_get_CompletionString (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCompletionResultPtr_set_CursorKind (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCompletionResultPtr_set_CompletionString (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXCompletionResult *   coerce_CXCompletionResult_CXCompletionResultPtr ( SEXP r_from,  const CXCompletionResult * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXCompletionResult_CXCompletionResultPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXCompletionResultPtr_CXCompletionResult ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXCompletionResult () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXCompletionResultPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXCompletionResultPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXCompletionResult (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXCodeCompleteResults ( CXCodeCompleteResults   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCodeCompleteResultsPtr_get_Results (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCodeCompleteResultsPtr_get_NumResults (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCodeCompleteResultsPtr_set_Results (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCodeCompleteResultsPtr_set_NumResults (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXCodeCompleteResults *   coerce_CXCodeCompleteResults_CXCodeCompleteResultsPtr ( SEXP r_from,  const CXCodeCompleteResults * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXCodeCompleteResults_CXCodeCompleteResultsPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXCodeCompleteResultsPtr_CXCodeCompleteResults ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXCodeCompleteResults () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXCodeCompleteResultsPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXCodeCompleteResultsPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXCodeCompleteResults (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXCursorAndRangeVisitor ( CXCursorAndRangeVisitor   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCursorAndRangeVisitorPtr_get_context (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCursorAndRangeVisitorPtr_get_visit (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCursorAndRangeVisitorPtr_set_context (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXCursorAndRangeVisitorPtr_set_visit (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXCursorAndRangeVisitor *   coerce_CXCursorAndRangeVisitor_CXCursorAndRangeVisitorPtr ( SEXP r_from,  const CXCursorAndRangeVisitor * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXCursorAndRangeVisitor_CXCursorAndRangeVisitorPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXCursorAndRangeVisitorPtr_CXCursorAndRangeVisitor ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXCursorAndRangeVisitor () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXCursorAndRangeVisitorPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXCursorAndRangeVisitorPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXCursorAndRangeVisitor (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxLoc ( CXIdxLoc   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxLocPtr_get_ptr_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxLocPtr_get_int_data (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxLocPtr_set_ptr_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxLocPtr_set_int_data (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxLoc *   coerce_CXIdxLoc_CXIdxLocPtr ( SEXP r_from,  const CXIdxLoc * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxLoc_CXIdxLocPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxLocPtr_CXIdxLoc ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxLoc () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxLocPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxLocPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxLoc (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxIncludedFileInfo ( CXIdxIncludedFileInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_get_hashLoc (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_get_filename (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_get_file (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_get_isImport (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_get_isAngled (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_get_isModuleImport (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_set_hashLoc (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_set_filename (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_set_file (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_set_isImport (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_set_isAngled (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIncludedFileInfoPtr_set_isModuleImport (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxIncludedFileInfo *   coerce_CXIdxIncludedFileInfo_CXIdxIncludedFileInfoPtr ( SEXP r_from,  const CXIdxIncludedFileInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxIncludedFileInfo_CXIdxIncludedFileInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxIncludedFileInfoPtr_CXIdxIncludedFileInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxIncludedFileInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxIncludedFileInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxIncludedFileInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxIncludedFileInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxImportedASTFileInfo ( CXIdxImportedASTFileInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxImportedASTFileInfoPtr_get_file (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxImportedASTFileInfoPtr_get_module (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxImportedASTFileInfoPtr_get_loc (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxImportedASTFileInfoPtr_get_isImplicit (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxImportedASTFileInfoPtr_set_file (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxImportedASTFileInfoPtr_set_module (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxImportedASTFileInfoPtr_set_loc (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxImportedASTFileInfoPtr_set_isImplicit (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxImportedASTFileInfo *   coerce_CXIdxImportedASTFileInfo_CXIdxImportedASTFileInfoPtr ( SEXP r_from,  const CXIdxImportedASTFileInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxImportedASTFileInfo_CXIdxImportedASTFileInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxImportedASTFileInfoPtr_CXIdxImportedASTFileInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxImportedASTFileInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxImportedASTFileInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxImportedASTFileInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxImportedASTFileInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxDeclInfo ( CXIdxDeclInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_entityInfo (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_cursor (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_loc (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_semanticContainer (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_lexicalContainer (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_isRedeclaration (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_isDefinition (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_isContainer (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_declAsContainer (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_isImplicit (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_attributes (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_numAttributes (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_get_flags (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_entityInfo (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_cursor (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_loc (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_semanticContainer (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_lexicalContainer (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_isRedeclaration (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_isDefinition (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_isContainer (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_declAsContainer (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_isImplicit (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_attributes (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_numAttributes (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxDeclInfoPtr_set_flags (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxDeclInfo *   coerce_CXIdxDeclInfo_CXIdxDeclInfoPtr ( SEXP r_from,  const CXIdxDeclInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxDeclInfo_CXIdxDeclInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxDeclInfoPtr_CXIdxDeclInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxDeclInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxDeclInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxDeclInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxDeclInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxObjCContainerDeclInfo ( CXIdxObjCContainerDeclInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCContainerDeclInfoPtr_get_declInfo (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCContainerDeclInfoPtr_get_kind (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCContainerDeclInfoPtr_set_declInfo (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCContainerDeclInfoPtr_set_kind (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxObjCContainerDeclInfo *   coerce_CXIdxObjCContainerDeclInfo_CXIdxObjCContainerDeclInfoPtr ( SEXP r_from,  const CXIdxObjCContainerDeclInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCContainerDeclInfo_CXIdxObjCContainerDeclInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCContainerDeclInfoPtr_CXIdxObjCContainerDeclInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxObjCContainerDeclInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxObjCContainerDeclInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxObjCContainerDeclInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxObjCContainerDeclInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxObjCInterfaceDeclInfo ( CXIdxObjCInterfaceDeclInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCInterfaceDeclInfoPtr_get_containerInfo (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCInterfaceDeclInfoPtr_get_superInfo (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCInterfaceDeclInfoPtr_get_protocols (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCInterfaceDeclInfoPtr_set_containerInfo (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCInterfaceDeclInfoPtr_set_superInfo (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCInterfaceDeclInfoPtr_set_protocols (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxObjCInterfaceDeclInfo *   coerce_CXIdxObjCInterfaceDeclInfo_CXIdxObjCInterfaceDeclInfoPtr ( SEXP r_from,  const CXIdxObjCInterfaceDeclInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCInterfaceDeclInfo_CXIdxObjCInterfaceDeclInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCInterfaceDeclInfoPtr_CXIdxObjCInterfaceDeclInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxObjCInterfaceDeclInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxObjCInterfaceDeclInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxObjCInterfaceDeclInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxObjCInterfaceDeclInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxObjCCategoryDeclInfo ( CXIdxObjCCategoryDeclInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCCategoryDeclInfoPtr_get_containerInfo (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCCategoryDeclInfoPtr_get_objcClass (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCCategoryDeclInfoPtr_get_classCursor (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCCategoryDeclInfoPtr_get_classLoc (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCCategoryDeclInfoPtr_get_protocols (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCCategoryDeclInfoPtr_set_containerInfo (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCCategoryDeclInfoPtr_set_objcClass (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCCategoryDeclInfoPtr_set_classCursor (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCCategoryDeclInfoPtr_set_classLoc (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCCategoryDeclInfoPtr_set_protocols (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxObjCCategoryDeclInfo *   coerce_CXIdxObjCCategoryDeclInfo_CXIdxObjCCategoryDeclInfoPtr ( SEXP r_from,  const CXIdxObjCCategoryDeclInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCCategoryDeclInfo_CXIdxObjCCategoryDeclInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCCategoryDeclInfoPtr_CXIdxObjCCategoryDeclInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxObjCCategoryDeclInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxObjCCategoryDeclInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxObjCCategoryDeclInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxObjCCategoryDeclInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxObjCProtocolRefListInfo ( CXIdxObjCProtocolRefListInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCProtocolRefListInfoPtr_get_protocols (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCProtocolRefListInfoPtr_get_numProtocols (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCProtocolRefListInfoPtr_set_protocols (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCProtocolRefListInfoPtr_set_numProtocols (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxObjCProtocolRefListInfo *   coerce_CXIdxObjCProtocolRefListInfo_CXIdxObjCProtocolRefListInfoPtr ( SEXP r_from,  const CXIdxObjCProtocolRefListInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCProtocolRefListInfo_CXIdxObjCProtocolRefListInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCProtocolRefListInfoPtr_CXIdxObjCProtocolRefListInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxObjCProtocolRefListInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxObjCProtocolRefListInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxObjCProtocolRefListInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxObjCProtocolRefListInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxBaseClassInfo ( CXIdxBaseClassInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxBaseClassInfoPtr_get_base (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxBaseClassInfoPtr_get_cursor (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxBaseClassInfoPtr_get_loc (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxBaseClassInfoPtr_set_base (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxBaseClassInfoPtr_set_cursor (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxBaseClassInfoPtr_set_loc (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxBaseClassInfo *   coerce_CXIdxBaseClassInfo_CXIdxBaseClassInfoPtr ( SEXP r_from,  const CXIdxBaseClassInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxBaseClassInfo_CXIdxBaseClassInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxBaseClassInfoPtr_CXIdxBaseClassInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxBaseClassInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxBaseClassInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxBaseClassInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxBaseClassInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxEntityInfo ( CXIdxEntityInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_get_kind (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_get_templateKind (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_get_lang (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_get_name (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_get_USR (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_get_cursor (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_get_attributes (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_get_numAttributes (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_set_kind (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_set_templateKind (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_set_lang (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_set_name (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_set_USR (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_set_cursor (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_set_attributes (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityInfoPtr_set_numAttributes (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxEntityInfo *   coerce_CXIdxEntityInfo_CXIdxEntityInfoPtr ( SEXP r_from,  const CXIdxEntityInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxEntityInfo_CXIdxEntityInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxEntityInfoPtr_CXIdxEntityInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxEntityInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxEntityInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxEntityInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxEntityInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxObjCPropertyDeclInfo ( CXIdxObjCPropertyDeclInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCPropertyDeclInfoPtr_get_declInfo (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCPropertyDeclInfoPtr_get_getter (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCPropertyDeclInfoPtr_get_setter (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCPropertyDeclInfoPtr_set_declInfo (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCPropertyDeclInfoPtr_set_getter (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCPropertyDeclInfoPtr_set_setter (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxObjCPropertyDeclInfo *   coerce_CXIdxObjCPropertyDeclInfo_CXIdxObjCPropertyDeclInfoPtr ( SEXP r_from,  const CXIdxObjCPropertyDeclInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCPropertyDeclInfo_CXIdxObjCPropertyDeclInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCPropertyDeclInfoPtr_CXIdxObjCPropertyDeclInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxObjCPropertyDeclInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxObjCPropertyDeclInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxObjCPropertyDeclInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxObjCPropertyDeclInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxIBOutletCollectionAttrInfo ( CXIdxIBOutletCollectionAttrInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIBOutletCollectionAttrInfoPtr_get_attrInfo (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIBOutletCollectionAttrInfoPtr_get_objcClass (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIBOutletCollectionAttrInfoPtr_get_classCursor (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIBOutletCollectionAttrInfoPtr_get_classLoc (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIBOutletCollectionAttrInfoPtr_set_attrInfo (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIBOutletCollectionAttrInfoPtr_set_objcClass (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIBOutletCollectionAttrInfoPtr_set_classCursor (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxIBOutletCollectionAttrInfoPtr_set_classLoc (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxIBOutletCollectionAttrInfo *   coerce_CXIdxIBOutletCollectionAttrInfo_CXIdxIBOutletCollectionAttrInfoPtr ( SEXP r_from,  const CXIdxIBOutletCollectionAttrInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxIBOutletCollectionAttrInfo_CXIdxIBOutletCollectionAttrInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxIBOutletCollectionAttrInfoPtr_CXIdxIBOutletCollectionAttrInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxIBOutletCollectionAttrInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxIBOutletCollectionAttrInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxIBOutletCollectionAttrInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxIBOutletCollectionAttrInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxObjCProtocolRefInfo ( CXIdxObjCProtocolRefInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCProtocolRefInfoPtr_get_protocol (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCProtocolRefInfoPtr_get_cursor (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCProtocolRefInfoPtr_get_loc (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCProtocolRefInfoPtr_set_protocol (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCProtocolRefInfoPtr_set_cursor (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxObjCProtocolRefInfoPtr_set_loc (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxObjCProtocolRefInfo *   coerce_CXIdxObjCProtocolRefInfo_CXIdxObjCProtocolRefInfoPtr ( SEXP r_from,  const CXIdxObjCProtocolRefInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCProtocolRefInfo_CXIdxObjCProtocolRefInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxObjCProtocolRefInfoPtr_CXIdxObjCProtocolRefInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxObjCProtocolRefInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxObjCProtocolRefInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxObjCProtocolRefInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxObjCProtocolRefInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxAttrInfo ( CXIdxAttrInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxAttrInfoPtr_get_kind (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxAttrInfoPtr_get_cursor (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxAttrInfoPtr_get_loc (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxAttrInfoPtr_set_kind (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxAttrInfoPtr_set_cursor (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxAttrInfoPtr_set_loc (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxAttrInfo *   coerce_CXIdxAttrInfo_CXIdxAttrInfoPtr ( SEXP r_from,  const CXIdxAttrInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxAttrInfo_CXIdxAttrInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxAttrInfoPtr_CXIdxAttrInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxAttrInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxAttrInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxAttrInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxAttrInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxContainerInfo ( CXIdxContainerInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxContainerInfoPtr_get_cursor (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxContainerInfoPtr_set_cursor (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxContainerInfo *   coerce_CXIdxContainerInfo_CXIdxContainerInfoPtr ( SEXP r_from,  const CXIdxContainerInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxContainerInfo_CXIdxContainerInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxContainerInfoPtr_CXIdxContainerInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxContainerInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxContainerInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxContainerInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxContainerInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxCXXClassDeclInfo ( CXIdxCXXClassDeclInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxCXXClassDeclInfoPtr_get_declInfo (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxCXXClassDeclInfoPtr_get_bases (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxCXXClassDeclInfoPtr_get_numBases (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxCXXClassDeclInfoPtr_set_declInfo (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxCXXClassDeclInfoPtr_set_bases (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxCXXClassDeclInfoPtr_set_numBases (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxCXXClassDeclInfo *   coerce_CXIdxCXXClassDeclInfo_CXIdxCXXClassDeclInfoPtr ( SEXP r_from,  const CXIdxCXXClassDeclInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxCXXClassDeclInfo_CXIdxCXXClassDeclInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxCXXClassDeclInfoPtr_CXIdxCXXClassDeclInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxCXXClassDeclInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxCXXClassDeclInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxCXXClassDeclInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxCXXClassDeclInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_copyStruct_CXIdxEntityRefInfo ( CXIdxEntityRefInfo   *value) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_get_kind (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_get_cursor (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_get_loc (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_get_referencedEntity (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_get_parentEntity (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_get_container (SEXP r_obj  , SEXP r_copy ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_set_kind (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_set_cursor (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_set_loc (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_set_referencedEntity (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_set_parentEntity (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_CXIdxEntityRefInfoPtr_set_container (SEXP r_obj , SEXP r_value  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 const CXIdxEntityRefInfo *   coerce_CXIdxEntityRefInfo_CXIdxEntityRefInfoPtr ( SEXP r_from,  const CXIdxEntityRefInfo * ans  ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxEntityRefInfo_CXIdxEntityRefInfoPtr  ( SEXP r_from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_coerce_CXIdxEntityRefInfoPtr_CXIdxEntityRefInfo ( SEXP from ) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_new_CXIdxEntityRefInfo () ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 void R_free_CXIdxEntityRefInfoPtr_finalizer (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_free_CXIdxEntityRefInfoPtr (SEXP val) ; 
#ifdef __cplusplus 
 extern "C" 
 #endif 
 SEXP R_duplicate_CXIdxEntityRefInfo (SEXP r_value, SEXP r_copy, SEXP r_alloc) ; 
