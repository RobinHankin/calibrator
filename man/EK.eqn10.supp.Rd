\name{EK.eqn10.supp}
\alias{EK.eqn10.supp}
\title{Posterior mean of K}
\description{
  Estimates the posterior mean of K as per equation 10 of KOH2001S,
  section 4.2
}
\usage{
EK.eqn10.supp(X.dist, D1, D2, H1, H2, d, hbar.fun,
   lower.theta, upper.theta, extractor, give.info=FALSE,
   include.prior=FALSE, phi, ...)
}
\arguments{
  \item{X.dist}{Probability distribution of \code{X}, in the form of a
    two-element list.  The first element is the mean (which should have
    name \dQuote{\code{mean}}), and the second element is the variance
    matrix, which should  be a positive definite matrix of the correct
    size, and have name \dQuote{var}}
  \item{D1}{Matrix whose rows are the code run points}
  \item{D2}{Matrix whose rows are field observation points}
  \item{H1}{Regression function for \code{D1}}
  \item{H2}{Regression function for \code{D2}}
  \item{d}{Vector of code outputs and field observations}
  \item{include.prior}{Boolean; passed to function \code{p.eqn8.supp()} (qv)}
  \item{hbar.fun}{Function that gives expectation (with respect to \code{X})
    of \code{h1(x,theta)} and \code{h2(x)} as per section 4.2}
  \item{lower.theta}{Lower integration limit for \code{theta} (NB: a vector)}
  \item{upper.theta}{Lower integration limit for \code{theta} (NB: a
    vector)}
  \item{extractor}{Extractor function; see \code{extractor.toy()} for
    an example}
  \item{give.info}{Boolean, with default \code{FALSE} meaning to return
    just the answer and \code{TRUE} to return the answer along with all
    output from both integrations as performed by \code{adaptIntegrate()}}
  \item{phi}{Hyperparameters}
  \item{...}{Extra arguments passed to the integration
    function.  If multidimensional (ie \code{length(theta)>1}), then the
    arguments are passed to \code{adaptIntegrate()}; if one dimensional, they
    are passed to \code{integrate()}}
}
\details{
This function evaluates a numerical approximation to equation 10 of
section 4.2 of the supplement.

Equation 10 integrates over the prior distribution of \code{theta}.  If
\code{theta} is a vector, multidimensional integration is necessary.

In the case of multidimensional integration, function
\code{adaptIntegrate()} is used.

In the case of one dimensional integration---theta being a
scalar---function \code{integrate()} of the stats package is used.

Note that equation 10 is conditional on the observed data \strong{and}
the hyperparameters
}
\value{
  Returns a scalar
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
\note{
  The function was not reviewed by the Journal of Statistical Software.

  The package formely used adapt package, but this is no longer
  available on CRAN.  The package now uses the cubature package.
  
}
\examples{
1+1
\dontrun{
# Not run because it takes R CMD check too long

data(toys)
EK.eqn10.supp(X.dist=X.dist.toy, D1=D1.toy, D2=D2.toy,
          H1=H1.toy, H2=H2.toy, d=d.toy,
          hbar.fun=hbar.fun.toy, lower.theta=c(-3,-3,-3),
          upper.theta=c(3,3,3),extractor=extractor.toy,
          phi=phi.toy)
}
}
\keyword{array}
