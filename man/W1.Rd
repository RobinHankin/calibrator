\name{W1}
\alias{W1}
\title{Variance matrix for beta1hat}
\description{
returns the variance-covariance matrix for the estimate of beta1hat
}
\usage{
W1(D1, H1, det=FALSE, phi)
}
\arguments{
  \item{D1}{matrix of code points}
  \item{H1}{Basis function generator}
  \item{phi}{Hyperparameters}
  \item{det}{Boolean, with default \code{FALSE} meaning to return the
    matrix, and \code{TRUE} meaning to return its determinant only}
}
\details{
  If only the determinant is required, setting argument \code{det} to
  \code{TRUE} is faster than using \code{det(W1(...,det=FALSE))}, as the
  former avoids an unnecessary use of \code{solve()}.
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
\seealso{\code{\link{beta1hat.fun}}}
\examples{
data(toys)
W1(D1=D1.toy, H1=H1.toy,  phi=phi.toy)
}
\keyword{array}
