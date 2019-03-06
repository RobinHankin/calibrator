\name{Vd}
\alias{Vd}
\title{Variance matrix for d}
\description{
Variance matrix for d, as per the bottom of page 1 of the supplement
}
\usage{
Vd(D1, D2, theta, phi)
}
\arguments{
  \item{D1}{matrix of code run points}
  \item{D2}{matrix of observation points}
  \item{theta}{Parameters}
  \item{phi}{hyperparameters}
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
\seealso{\code{\link{H.fun}},\code{\link{V1}},\code{\link{V2}},\code{\link{C1}}}
\examples{
data(toys)
Vd(D1=D1.toy, D2=D2.toy, theta=theta.toy, phi=phi.toy)
}
\keyword{array}
