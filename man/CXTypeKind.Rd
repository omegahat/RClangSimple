\name{CXTypeKind}
\alias{CXTypeKind}
\alias{CXType_BlockPointer}
\alias{CXType_ConstantArray}
\alias{CXType_Bool}
 \alias{CXType_Char_S}
 \alias{CXType_Char_U}
 \alias{CXType_Char16}
 \alias{CXType_Char32}
 \alias{CXType_Complex}
 \alias{CXType_Dependent}
 \alias{CXType_Double}
 \alias{CXType_Enum}
 \alias{CXType_FirstBuiltin}
 \alias{CXType_Float}
 \alias{CXType_FunctionNoProto}
 \alias{CXType_FunctionProto}
 \alias{CXType_Int}
 \alias{CXType_Int128}
 \alias{CXType_Invalid}
 \alias{CXType_LastBuiltin}
 \alias{CXType_Long}
 \alias{CXType_LongDouble}
 \alias{CXType_LongLong}
 \alias{CXType_LValueReference}
 \alias{CXType_NullPtr}
 \alias{CXType_ObjCClass}
 \alias{CXType_ObjCId}
 \alias{CXType_ObjCInterface}
 \alias{CXType_ObjCObjectPointer}
 \alias{CXType_ObjCSel}
 \alias{CXType_Overload}
 \alias{CXType_Pointer}
 \alias{CXType_Record}
 \alias{CXType_RValueReference}
 \alias{CXType_SChar}
 \alias{CXType_Short}
 \alias{CXType_Typedef}
 \alias{CXType_UChar}
 \alias{CXType_UInt}
 \alias{CXType_UInt128}
 \alias{CXType_ULong}
 \alias{CXType_ULongLong}
 \alias{CXType_Unexposed}
 \alias{CXType_UShort}
 \alias{CXType_Void}
 \alias{CXType_WChar}

 
\docType{data}
\title{Enumerated values for different data types in C/C++ parser}
\description{
  These variables provide information about the different data types
  represented by cursors in a parse tree.
  These are enumerated constants that can be used to compare
  the type of a CXType to known types.
}
\usage{CXTypeKind}
\format{
  The format is:
 Named int [1:44] 0 1 2 3 4 5 6 7 8 9 ...
 - attr(*, "names")= chr [1:44] "CXType_Invalid" "CXType_Unexposed" "CXType_Void" "CXType_Bool" ...
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
CXTypeKind
## maybe str(CXTypeKind) ; plot(CXTypeKind) ...
}
\keyword{datasets}
