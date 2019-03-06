\name{D2.fun}
\alias{D2.fun}
\title{Augments observation points with parameters}
\description{
Augments observation points with parameters; will recycle if necessary
}
\usage{
D2.fun(D2, theta)
}
\arguments{
  \item{D2}{Observation points}
  \item{theta}{Parameters}
}
\references{
M. C. Kennedy and A. O'Hagan 2001. \dQuote{Bayesian
calibration of computer models}.  Journal of the Royal Statistical
Society B, 63(3) pp425-464

M. C. Kennedy and A. O'Hagan 2001.  \dQuote{Supplementary details on
Bayesian calibration of computer models}, Internal report, University
    of Sheffield.  Available at
    \url{http://www.tonyohagan.co.uk/academic/ps/calsup.ps}

R. K. S. Hankin 2005. \dQuote{Introducing BACCO, an R bundle for
Bayesian analysis of computer code output}, Journal of Statistical
Software, 14(16)
}
\author{Robin K. S. Hankin}
\seealso{
  \code{\link{D1.toy}},
  \code{\link{theta.toy}}
}
\examples{
data(toys)
D2.fun(D2=D2.toy, theta=theta.toy)
D2.fun(D2=t(x.toy), theta=theta.toy)
D2.fun(D2=D2.toy[1,,drop=FALSE], theta=theta.toy)
}
\keyword{array}
 
