\name{blockdiag}
\alias{blockdiag}
\title{Assembles matrices blockwise into a block diagonal matrix}
\description{
Assembles matrices blockwise into a block diagonal matrix with optional
padding value
}
\usage{
blockdiag(m1, m2, p.tr = 0, p.ll = 0)
}
\arguments{
  \item{m1}{Upper left matrix}
  \item{m2}{Lower right matrix}
  \item{p.tr}{Padding value for top right quadrant.  Defaults to zero.}
  \item{p.ll}{Padding value for lower left quadrant.  Defaults to zero.}
}
\author{Robin K. S. Hankin}
\note{The function documented here is a subset of \code{adiag} of
  package \pkg{magic}
  }
\examples{
data(toys)
blockdiag(D1.toy,D2.toy)
}
\keyword{array}
