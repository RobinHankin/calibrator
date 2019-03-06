\name{prob.psi1}
\alias{prob.psi1}
\alias{prob.psi2}
\alias{prob.theta}
\alias{sample.theta}
\title{A priori probability of psi1, psi2, and theta}
\description{
  Function to determine the a-priori probability of \eqn{\psi_1}{psi1}
  and \eqn{\psi_2}{psi2} of the hyperparameters, and \eqn{\theta}{theta},
  given the apriori means  and standard deviations.

  Function \code{sample.theta()} samples \eqn{\theta}{theta} from its prior distribution.
}
\usage{
prob.psi1(phi,lognormally.distributed=TRUE)
prob.psi2(phi,lognormally.distributed=TRUE)
prob.theta(theta,phi,lognormally.distributed=FALSE)
sample.theta(n=1,phi)
}
\arguments{
  \item{phi}{Hyperparameters}
  \item{theta}{Parameters}
  \item{lognormally.distributed}{Boolean variable with 
    \code{FALSE} meaning to assume a Gaussian distribution and \code{TRUE}
    meaning to use a lognormal distribution.}
  \item{n}{In function \code{sample.theta()}, the number of observations
    to take}
}
\details{
  These functions use package \code{mvtnorm} to calculate the
  probability density under the assumption that the PDF is lognormal.
  One implication would be that \code{phi$psi2.apriori$mean}
  and \code{phi$psi1.apriori$mean} are the means of the
  \strong{logarithms} of the elements of \code{psi1} and \code{psi2}
  (which are thus assumed to be positive).  The \code{sigma} matrix is
  the covariance matrix of the logarithms as well.
  
  In these functions, interpretation of argument \code{phi} depends on
  the value of Boolean argument \code{lognormally.distributed}.  Take
  \code{prob.theta()} as an example.  If \code{lognormally.distributed}
  is \code{TRUE}, then \code{log(theta)} is normally distributed with
  mean \code{phi$theta.aprior$mean} and variance
  \code{phi$theta.apriori$sigma}.  If \code{FALSE}, \code{theta} is
  normally distributed with mean \code{phi$theta.aprior$mean} and
  variance \code{phi$theta.apriori$sigma}.

  Interpretation of \code{phi$theta.aprior$mean} depends on the value of
  \code{lognormally.distributed}: if \code{TRUE} it is the expected
  value of \code{log(theta)}; if \code{FALSE}, it is the expectation of
  \code{theta}.

  The reason that \code{prob.theta} has a different default value for
  \code{lognormally.distributed} is that some elements of \code{theta}
  might be negative, contraindicating a lognormal distribution
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
\seealso{
  \code{\link{p.eqn4.supp}}, \code{\link{stage1}}, \code{\link{p.eqn8.supp}}
}
\examples{
data(toys)
prob.psi1(phi=phi.toy)
prob.psi2(phi=phi.toy)

prob.theta(theta=theta.toy,phi=phi.toy)

sample.theta(n=4,phi=phi.toy)

}
\keyword{array}
