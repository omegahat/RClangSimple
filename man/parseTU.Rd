\name{parseTU}
\alias{parseTU}
\alias{createIndex}
\alias{createTU}
\alias{saveTranslationUnit}
\alias{getFile}
\alias{defaultSaveOptions}
\alias{defaultReparseOptions}
\alias{isFileMultipleIncludeGuarded}

\alias{CXIndex-class}
\alias{CXTranslationUnit-class}

\alias{visitTU}
\alias{visitCursor}
\alias{visitChildren}
\alias{simpleVisitor}

\title{Parse a C/C++ source file \& traverse the parse tree}
\description{
  These collection of functions are related to both parsing
  C or C++ source code and then iterating over the
  resulting parse tree and extracting information
  about the contents.
}
\usage{
parseTU(src, visitor = simpleVisitor, idx = createIndex(),
          tu = createTU(src, idx = idx, ...), ..., clone = FALSE)
createTU(src, includes = character(), idx = createIndex(verbose = verbose), args = character(),
           verbose = getOption("ShowParserDiagnostics", TRUE), options = 0)
saveTranslationUnit(TU, FileName, options = 0)
getFile(tu, file_name)
defaultReparseOptions(TU)
defaultSaveOptions(TU)
isFileMultipleIncludeGuarded(tu, file)
}

\arguments{
  \item{src,FileName}{the fully-qualified name of the source code file}
  \item{visitor}{a function that is called when iterating over the parse
  tree. This must return one of the CXChildVisit enumeration values}
  \item{idx}{a \code{CXIndex} object used to create the translation
    unit. This is rarely specified.}
  \item{includes}{a character vector specifying the paths to directories
  in which the parser can look for \code{\#include}'d header files}
  \item{args}{a character vector of flags or arguments for the
  parser. These can include pre-processor definitions, e.g
  \code{-DHAVE_CONFIG_H},  and also arguments that clang understands,
  e.g. \code{-fparse-all-comments} and \code{-ferror-limit=1000}.
  The arguments need to be separate elements of the vector and should
  not be combined into a single string.
  The possible arguments are described in the clang user manual.
  }
  \item{verbose}{used when creating the index and controls whether
  diagnostic messages are written to the console.}
  \item{file}{a \code{CXFile} object representing a file}
  \item{tu,TU}{a translation unit object. This is rarely specified by the caller.}
  \item{\dots}{additional parameters passed to \code{createTU}.}
  \item{clone}{a logical value controlling whether to clone the
    \code{CXCursor} objects passed in each call to the \code{visitor}
    function.}
  \item{options}{options for saving the translation unit. This is a
  collection of values fromthe CXSaveTranslationUnit_Flags object, but
  this is should always be 0 at present}
  \item{file_name}{the name of the file for which we want a CXFile object}

}
%\details{}
\value{
  An integer value indicating whether the parsing was successful (0)
  or not (non-zero).
}
\references{
 libclang \url{http://clang.llvm.org/doxygen/group__CINDEX.html}
}
\author{Duncan Temple Lang}

\seealso{
  \code{\link{visitTU}}
  \code{\link{createIndex}}
}
\examples{
col = genFunctionCollector()
parseTU(system.file("exampleCode", "register.c", package = "RCIndex"),
         col$update)

names(col$funcs())

}
\keyword{programming}
\keyword{interface} 

