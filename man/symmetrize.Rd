\name{symmetrize}
\alias{symmetrize}
\title{Symmetrize an upper triangular matrix}
\description{
  Symmetrize an upper triangular matrix by copying the upper triangular
  elements into the lower triangular places
}
\usage{
symmetrize(a)
}
\arguments{
  \item{a}{Upper triangular matrix to be symmetrized}
}
\details{
  Also works for lower triangular matrices
}
\author{Robin K. S. Hankin}
\examples{
jj <- matrix(rnorm(50),10,5)
X <- crossprod(jj,jj)    # X has a Wishart distribution (and in
                         # particular is positive definite)

chol(X)
symmetrize(chol(X))
}
\keyword{array}
