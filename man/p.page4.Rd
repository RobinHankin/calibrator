\name{p.page4}
\alias{p.page4}
\title{A postiori probability of hyperparameters}
\description{
  Function to determine a postiori probability of hyperparameters
  \eqn{\rho}{rho}, \eqn{\lambda}{lambda} and \eqn{\psi_2}{psi2},
  given observations and \eqn{\psi_1}{psi1}.
}
\usage{
p.page4(D1, D2, H1, H2, V, y, z, E.theta, Edash.theta, extractor, include.prior=FALSE,
lognormally.distributed=FALSE, return.log=FALSE, phi)
}

\arguments{
  \item{D1}{Matrix of code run points}
  \item{D2}{Matrix of observation points}
  \item{H1}{Basis function (vectorized)}
  \item{H2}{Regression function for D2}
  \item{V}{Covariance matrix; default value of \code{NULL} results in
  the function evaluating it (but this takes a long time, so supply
  \code{V} if known)}
  \item{y}{Vector of code outputs}
  \item{z}{Vector of observation values}
  \item{E.theta}{Expectation over theta}
  \item{Edash.theta}{Expectation over theta WRT \eqn{E'}}
  \item{extractor}{Function to extract independent variables and
  parameters from D1}
  \item{include.prior}{Boolean, with \code{TRUE}
    meaning to include the prior PDF for \eqn{\theta}{theta} and default
    value of \code{FALSE} meaning to return the likelihood multiplied by an
    undetermined constant}
  \item{lognormally.distributed}{Boolean with \code{TRUE} meaning to assume
    lognormality.  See \code{prob.psi1} for details}
  \item{return.log}{Boolean, with default \code{FALSE} meaning to return
  the probability, and \code{TRUE} meaning to return the (natural)
  logarithm of the probability (which is useful when considering very
  small probabilities)}
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
\seealso{\code{\link{W2}}}
\examples{
data(toys)

p.page4(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, V=NULL, y=y.toy,
z=z.toy,E.theta=E.theta.toy, Edash.theta=Edash.theta.toy, extractor=extractor.toy, phi=phi.toy)

## Now compare the above value with p.page4() calculated with phi
## differing only in psi2:

phi.toy.new <- phi.change(phi.fun=phi.fun.toy, old.phi = phi.toy, psi2=c(8,8,8))

p.page4(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, V=V.toy, y=y.toy, z=z.toy,
E.theta=E.theta.toy, Edash.theta=Edash.theta.toy,
extractor=extractor.toy, phi=phi.toy.new)
## different!

}
\keyword{array}
