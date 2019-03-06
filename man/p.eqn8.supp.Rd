\name{p.eqn8.supp}
\alias{p.eqn8.supp}
\alias{p.eqn8.supp.vector}
\title{A postiori probability of hyperparameters}
\description{
  Function to determine the a-postiori probability of hyperparameters
  \eqn{\rho}{rho}, \eqn{\lambda}{lambda} and \eqn{\psi_2}{psi2},
  given observations and \eqn{\psi_1}{psi1}.
}
\usage{
p.eqn8.supp(theta, D1, D2, H1, H2, d, include.prior=FALSE,
lognormally.distributed=FALSE, return.log=FALSE, phi)
p.eqn8.supp.vector(theta, D1, D2, H1, H2, d, include.prior=FALSE,
lognormally.distributed=FALSE, return.log=FALSE, phi)
}
\arguments{
  \item{theta}{Parameters}
  \item{D1}{Matrix of code run points}
  \item{D2}{Matrix of observation points}
  \item{H1}{Regression function for D1}
  \item{H2}{Regression function for D2}
  \item{d}{Vector of code output values and observations}
  \item{include.prior}{Boolean, with \code{TRUE}
    meaning to include the prior PDF for \eqn{\theta}{theta} and default
    \code{FALSE} meaning  return the likelihood, multiplied by an
    undetermined constant}
  \item{lognormally.distributed}{Boolean, with \code{TRUE} meaning to
    assume prior is lognormal (see \code{prob.theta()} for more info)}
  \item{return.log}{Boolean, with default \code{FALSE} meaning to return
    the probability; \code{TRUE} means to return the (natural) logarithm
    of the answer}
  \item{phi}{Hyperparameters}
}
\details{
  The user should always use \code{p.eqn8.supp()}, which is a wrapper
  for \code{p.eqn8.supp.vector()}.  The forms differ in their treatment
  of \eqn{\theta}{theta}.  In the former, \eqn{\theta}{theta} must be a
  vector; in the latter, \eqn{\theta}{theta} may be a matrix, in which
  case \code{p.eqn8.supp.vector()} is applied to the rows
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
\seealso{\code{\link{W2}},\code{\link{stage1}}}
\examples{
data(toys)
p.eqn8.supp(theta=theta.toy, D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy,
d=d.toy, phi=phi.toy)

## Now try using the true hyperparameters, and data directly drawn from
## the appropriate multivariate distn:

phi.true <- phi.true.toy(phi=phi.toy)
jj <- create.new.toy.datasets(D1.toy , D2.toy)
d.toy <- jj$d.toy
p.eqn8.supp(theta=theta.toy, D1=D1.toy, D2=D2.toy, H1=H1.toy,
     H2=H2.toy, d=d.toy, phi=phi.true)


## Now try p.eqn8.supp() with a vector of possible thetas:
p.eqn8.supp(theta=sample.theta(n=11,phi=phi.true), D1=D1.toy,
     D2=D2.toy, H1=H1.toy, H2=H2.toy,  d=d.toy, phi=phi.true)

}
\keyword{array}
