\name{V2}
\alias{V2}
\title{distance between observation points}
\description{
  distance between observation points
}
\usage{
V2(x, other = NULL,  phi)
}
\arguments{
  \item{x}{Matrix whose rows are observation points}
  \item{other}{Second matrix; if \code{NULL}, use x}
  \item{phi}{Hyperparameters}
}
\details{
  This function returns the variance matrix of observations of the real
  process \eqn{z} at points
  \eqn{D_2=\left\{x_1,\ldots,x_n\right\}}{D2={x_1,...,x_n}}.

  It appears in the lower right corner of the variance matrix on the
  bottom of page 1 of the supplement, calculated by function
  \code{Vd()}. 

  It is also used in functions \code{Cov.eqn9.supp()} and
  \code{V.fun()}.
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
\seealso{\code{\link{V1}}}
\examples{
data(toys)
V2(D2.toy,other=NULL, phi=phi.toy)
V2(D2.toy,x.vec,phi=phi.toy)
}
\keyword{array}
