\name{betahat.fun.koh}
\alias{betahat.fun.koh}
\alias{betahat.fun.koh.vector}
\title{Expectation of beta, given theta, phi and d}
\description{
Determines the mean of \eqn{\beta}{beta}, given parameters \eqn{\theta}{theta},
hyperparameters \eqn{\phi}{phi}, and the vector of code outputs and observations
\eqn{d}{d}.  It is named so as to avoid conflict with 
function \code{betahat.fun} of package \pkg{emulator}.
}
\usage{
betahat.fun.koh(D1, D2, H1, H2, theta, d, phi)
betahat.fun.koh.vector(D1, D2, H1, H2, theta, d, phi)
}
\arguments{
  \item{D1}{Matrix whose rows are observation points and parameter
    values at which the code has been run}
  \item{D2}{Matrix whose rows are the observation points}
  \item{H1}{Regression function for D1}
  \item{H2}{Regression function for D2}
  \item{theta}{Parameters}
  \item{d}{Vector of code outputs and observations}
  \item{phi}{Hyperparameters}
}
\details{
  This function is defined between equations 2 and 3 of the
  supplement.  It is used in functions \code{Ez.eqn9.supp()} and
  \code{p.eqn8.supp()}.

  The user should always use \code{betahat.fun.koh()}, which is a
  wrapper for \code{betahat.fun.koh.vector()}.  The forms differ in
  their treatment of \eqn{\theta}{theta}.  In the former,
  \eqn{\theta}{theta} must be a vector; in the latter,
  \eqn{\theta}{theta} may be a matrix, in which case
  \code{betahat.fun.koh.vector()} is applied to the rows.

  In \code{betahat.fun.koh()}, the rownames are assigned by a kludgy
  call to \code{H.fun()},  which itself uses a kludge to determine
  colnames. 
  
  The function returns
  \deqn{
    \hat{\mathbf\beta} (\theta)=
    {\mathbf W}(\theta)^T {\mathbf H}(\theta)^T {\mathbf
      V}_d(\theta)^{-1}{\mathbf d}.
  }{
    betahat(theta)=W(theta) H(theta)^T inv(Vd(theta)) d.
  }
}
\references{
  M. C. Kennedy and A. O'Hagan 2001. \emph{Bayesian
    calibration of computer models}.  Journal of the Royal Statistical
  Society B, 63(3) pp425-464
  
  M. C. Kennedy and A. O'Hagan 2001.  \emph{Supplementary details on
    Bayesian calibration of computer models}, Internal report, University
    of Sheffield.  Available at
    \url{http://www.tonyohagan.co.uk/academic/ps/calsup.ps}
  
  R. K. S. Hankin 2005. \emph{Introducing BACCO, an R bundle for
    Bayesian analysis of computer code output}, Journal of Statistical
  Software, 14(16)
}
\author{Robin K. S. Hankin}
\examples{
data(toys)
betahat.fun.koh(theta=theta.toy, d=d.toy, D1=D1.toy, D2=D2.toy,
      H1=H1.toy, H2=H2.toy, phi=phi.toy)

betahat.fun.koh.vector(theta=theta.toy, d=d.toy, D1=D1.toy,
      D2=D2.toy, H1=H1.toy, H2=H2.toy, phi=phi.toy)
## should be identical

jj.theta <- rbind(theta.toy,theta.toy+1,theta.toy+2,theta.toy*0)
betahat.fun.koh(theta=jj.theta, d=d.toy, D1=D1.toy, D2=D2.toy,
     H1=H1.toy, H2=H2.toy, phi=phi.toy)

## Now try with true hyperparameters:
phi.true <- phi.true.toy(phi=phi.toy)

## And magically create the REAL parameters:
theta.REAL <- create.new.toy.datasets(export=TRUE)$REAL.PARAMS
jj.theta <- rbind(jj.theta, theta.REAL)

## Generate some data:
jj <- create.new.toy.datasets(D1.toy , D2.toy)
d.toy <- jj$d.toy


## And finally, observe that the estimated values for beta are pretty
## close to the real values (which omniscient beings can extract using
## reality() and computer.model()):

betahat.fun.koh(theta=jj.theta, d=d.toy, D1=D1.toy, D2=D2.toy,
       H1=H1.toy, H2=H2.toy, phi=phi.true)

## [
##  that is, compare the last column of the above with
##  c(computer.model(ex=T)$REAL.COEFFS, reality(ex=T)$REAL.BETA2)
## ]


}
\keyword{array}
