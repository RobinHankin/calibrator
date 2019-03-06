\name{p.eqn4.supp}
\alias{p.eqn4.supp}
\alias{p.equationn4.supp}
\title{Apostiori probability of psi1}
\description{
  Gives the probability of \eqn{\psi_1}{psi1}, given observations.
  Equation 4 of the supplement
}
\usage{
p.eqn4.supp(D1, y, H1, include.prior=TRUE, lognormally.distributed, return.log, phi)
}
\arguments{
  \item{D1}{Matrix of code run points}
  \item{y}{Vector of code outputs}
  \item{H1}{Regression function}
  \item{include.prior}{Boolean with default \code{TRUE} meaning to
    return the likelihood multiplied by the aprior probability and \code{FALSE}
    meaning to return the likelihood without the prior.}
  \item{lognormally.distributed}{Boolean; see \code{?prob.theta} for
    details}
  \item{return.log}{Boolean, with default \code{FALSE} meaning to return
    the probability and \code{TRUE} meaning to return the logarithm of
    the probability}
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
\seealso{\code{\link{W1}}}
\examples{
data(toys)
p.eqn4.supp(D1=D1.toy, y=y.toy , H1=H1.toy, lognormally.distributed=TRUE,
phi=phi.toy)
}
\keyword{array}
