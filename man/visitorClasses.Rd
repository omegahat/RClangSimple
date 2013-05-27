\name{visitorClasses}
\alias{S4CursorVisitor-class}
\alias{RefCursorVisitor-class}

\title{Classes for representing a visitor function and a way to retrieve
  its results}
\description{
  These two classes provide a simple means to identify a
  visitor function along with a way to retrieve the results.
  The \code{S4CursorVisitor} is an S4 class with two slots - update and result
  which store the visitor function and the function to retrieve the
  result.
  It is expected that these are generated as a closure with a shared environment.
  The \code{RefCursorVisitor} class is a reference class that one can extend
  (via \code{\link[methods]{setRefClass}} and its \code{contains}
  parameter)
  and implement its update and result methods.

  The purpose of these classes is that one can pass an object of either
  of these classes to \code{visitTU} and it can extract and use the
  visitor function and then call the result function and return that
  value in one step. This is merely syntactic sugar and convenience for
  avoiding creating the visitor, passing the update function to
  \code{visitTU} and then explicitly calling the resut method.
  It allows one to turn three expressions into a single
  
}
\keyword{programming}