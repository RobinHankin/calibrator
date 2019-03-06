\name{V1}
\alias{V1}
\title{Distance matrix}
\description{
Gives the distance matrix between rows of D1 and D1 (or, if supplied,
another matrix)
}
\usage{
V1(D1,  other = NULL, phi)
}
\arguments{
  \item{D1}{Matrix of code run points}
  \item{other}{Second matrix to compute distances to.  If \code{NULL},
    use the first supplied matrix}
  \item{phi}{Hyperparameters}
}
\value{
  Returns a matrix
}
\references{
  \itemize{
    \item
    M. C. Kennedy and A. O'Hagan 2001. \emph{Bayesian
      calibration of computer models}.  Journal of the Royal Statistical
    Society B, 63(3) pp425-464
    \item
    M. C. Kennedy and A. O'Hagan 2001.  \emph{Supplementary details on
      Bayesian calibration of computer models}, Internal report, University
    of Sheffield.  Available at
    \url{http://www.tonyohagan.co.uk/academic/ps/calsup.ps}
    \item
    R. K. S. Hankin 2005. \emph{Introducing BACCO, an R bundle for
      Bayesian analysis of computer code output}, Journal of Statistical
    Software, 14(16)
  }
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{V2}}}
\examples{
data(toys)
V1(D1=D1.toy,  other=NULL,   phi=phi.toy)
V1(D1=D1.toy[1,,drop=FALSE], other=NULL, phi=phi.toy)

V1(D1=D1.toy,  other=D1.toy[1:3,],   phi=phi.toy)

V1(D1=D1.toy,other=D1.fun(x.star=x.vec,t.vec=theta.toy),phi=phi.toy)

}
\keyword{array}
