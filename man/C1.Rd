\name{C1}
\alias{C1}
\title{Matrix of distances from D1 to D2}
\description{
Returns a matrix of distances from the code run points to the
augmented observation points.  A wrapper for \code{c1.fun()}.
}
\usage{
C1(D1, D2,  theta, phi)
}
\arguments{
  \item{D1}{D1}
  \item{D2}{D2}
  \item{theta}{Parameters}
  \item{phi}{Hyperparameters}
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
\seealso{\code{\link{t.fun}}}
\examples{
data(toys)
C1(D1=D1.toy, D2=D2.toy, theta=theta.toy, phi=phi.toy)
}
\keyword{array}
