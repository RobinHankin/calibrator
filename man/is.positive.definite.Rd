\name{is.positive.definite}
\alias{is.positive.definite}
\title{Is a matrix positive definite?}
\description{
  Returns \code{TRUE} if and only if a matrix is positive definite.
}
\usage{
is.positive.definite(a, ...)
}
\arguments{
  \item{a}{Matrix to be tested}
  \item{...}{Extra arguments passed to \code{eigen()}, such as
    \code{symmetric}.}
}
\details{
  A wrapper for \code{eigen()} (a matrix is positive definite if all its
  eigenvalues are positive).  This function is included for convenience only.
}
\author{Robin K. S. Hankin}
\examples{
is.positive.definite(diag(3),sym=TRUE)
is.positive.definite(diag(6)-0.1)
}
\keyword{array}

