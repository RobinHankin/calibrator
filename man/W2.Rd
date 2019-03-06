\name{W2}
\alias{W2}
\title{variance matrix for beta2}
\description{
  Variance matrix for beta2 as per page 4 of the supplement
}
\usage{
W2(D2, H2, V, det=FALSE)
}
\arguments{
  \item{D2}{matrix of observation points}
  \item{H2}{regression function}
  \item{V}{Overall covariance matrix}
  \item{det}{Boolean, with default \code{FALSE} meaning to return the
    matrix, and \code{TRUE} meaning to return its determinant only}
}
\details{
  If only the determinant is required, setting argument \code{det} to
  \code{TRUE} is faster than using \code{det(W2(...,det=FALSE))}, as the
  former avoids an unnecessary use of \code{solve()}
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
\seealso{\code{\link{V.fun}}}
\examples{
data(toys)
W2(D2=D2.toy, H2=H2.toy, V=V.toy) 
}
\keyword{array}
