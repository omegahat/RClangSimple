\name{CXCursorKind}
\alias{CXCursorKind}
\alias{CXCursor_BlockExpr}
 \alias{CXCursor_CallExpr}
 \alias{CXCursor_ClassDecl}
 \alias{CXCursor_ClassTemplate}
 \alias{CXCursor_ClassTemplatePartialSpecialization}
 \alias{CXCursor_Constructor}
 \alias{CXCursor_ConversionFunction}
 \alias{CXCursor_CXXBaseSpecifier}
 \alias{CXCursor_CXXMethod}
 \alias{CXCursor_DeclRefExpr}
 \alias{CXCursor_Destructor}
 \alias{CXCursor_EnumConstantDecl}
 \alias{CXCursor_EnumDecl}
 \alias{CXCursor_FieldDecl}
 \alias{CXCursor_FirstAttr}
 \alias{CXCursor_FirstDecl}
 \alias{CXCursor_FirstExpr}
 \alias{CXCursor_FirstInvalid}
 \alias{CXCursor_FirstPreprocessing}
 \alias{CXCursor_FirstRef}
 \alias{CXCursor_FirstStmt}
 \alias{CXCursor_FunctionDecl}
 \alias{CXCursor_FunctionTemplate}
 \alias{CXCursor_IBActionAttr}
 \alias{CXCursor_IBOutletAttr}
 \alias{CXCursor_IBOutletCollectionAttr}
 \alias{CXCursor_InvalidCode}
 \alias{CXCursor_InvalidFile}
 \alias{CXCursor_LastAttr}
 \alias{CXCursor_LastDecl}
 \alias{CXCursor_LastExpr}
 \alias{CXCursor_LastInvalid}
 \alias{CXCursor_LastPreprocessing}
 \alias{CXCursor_LastRef}
 \alias{CXCursor_LastStmt}
 \alias{CXCursor_LinkageSpec}
 \alias{CXCursor_MacroDefinition}
 \alias{CXCursor_MacroInstantiation}
 \alias{CXCursor_MemberRefExpr}
 \alias{CXCursor_Namespace}
 \alias{CXCursor_NamespaceAlias}
 \alias{CXCursor_NamespaceRef}
 \alias{CXCursor_NoDeclFound}
 \alias{CXCursor_NonTypeTemplateParameter}
 \alias{CXCursor_NotImplemented}
 \alias{CXCursor_ObjCCategoryDecl}
 \alias{CXCursor_ObjCCategoryImplDecl}
 \alias{CXCursor_ObjCClassMethodDecl}
 \alias{CXCursor_ObjCClassRef}
 \alias{CXCursor_ObjCImplementationDecl}
 \alias{CXCursor_ObjCInstanceMethodDecl}
 \alias{CXCursor_ObjCInterfaceDecl}
 \alias{CXCursor_ObjCIvarDecl}
 \alias{CXCursor_ObjCMessageExpr}
 \alias{CXCursor_ObjCPropertyDecl}
 \alias{CXCursor_ObjCProtocolDecl}
 \alias{CXCursor_ObjCProtocolRef}
 \alias{CXCursor_ObjCSuperClassRef}
 \alias{CXCursor_ParmDecl}
 \alias{CXCursor_PreprocessingDirective}
 \alias{CXCursor_StructDecl}
 \alias{CXCursor_TemplateRef}
 \alias{CXCursor_TemplateTemplateParameter}
 \alias{CXCursor_TemplateTypeParameter}
 \alias{CXCursor_TranslationUnit}
 \alias{CXCursor_TypedefDecl}
 \alias{CXCursor_TypeRef}
 \alias{CXCursor_UnexposedAttr}
 \alias{CXCursor_UnexposedDecl}
 \alias{CXCursor_UnexposedExpr}
 \alias{CXCursor_UnexposedStmt}
 \alias{CXCursor_UnionDecl}
 \alias{CXCursor_UsingDeclaration}
 \alias{CXCursor_UsingDirective}
 \alias{CXCursor_VarDecl}
 \alias{CXCursorKind-class}
 
\docType{data}
\title{Enumerations for different types of cursors/nodes in C parser tree}
\description{
  These are enumeration values identifying the types of the different
  cursors.
  One uses \code{cursor$kind} to get the cursor type of a particular
  cursor and then compare that value to any of these
  values to determine if the cursor is of that type.
}
\usage{CXCursorKind}
\format{
  The format is:
 Named int [1:3] 1 2 4
 - attr(*, "names")= chr [1:3] "CXDiagnostic_DisplaySourceLocation" "CXDiagnostic_DisplayColumn" "CXDiagnostic_DisplaySourceRanges"
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
CXCursorKind
## maybe str(CXCursorKind) ; plot(CXCursorKind) ...
}
\keyword{datasets}
