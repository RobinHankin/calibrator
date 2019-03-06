\name{H.fun}
\alias{H.fun}
\title{H function}
\description{
H.  See front page of KOHsupp.
}
\usage{
H.fun(theta, D1, D2, H1, H2, phi)
}
\arguments{
  \item{theta}{parameters}
  \item{D1}{matrix of code run points}
  \item{D2}{matrix of observation points}
  \item{H1}{Regressor function for D1}
  \item{H2}{Regressor function for D2}
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
\examples{
data(toys)
H.fun(theta=theta.toy, D1=D1.toy, D2=D2.toy, H1=H1.toy,
       H2=H2.toy, phi=phi.toy)

H.fun(theta=theta.toy, D1=D1.toy[1,,drop=FALSE], D2=D2.toy,
       H1=H1.toy, H2=H2.toy, phi=phi.toy)

H.fun(theta=theta.toy, D1=D1.toy[1,,drop=FALSE],
       D2=D2.toy[1,,drop=FALSE],
       H1=H1.toy, H2=H2.toy, phi=phi.toy)
}
\keyword{array}
