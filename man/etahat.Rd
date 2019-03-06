\name{etahat}
\alias{etahat}
\title{Expectation of computer output}
\description{
Returns the apostiori expectation of the computer program at a particular point
with a particular set of parameters, given the code output.
}
\usage{
etahat(D1, D2, H1, y, E.theta, extractor, phi)
}

\arguments{
  \item{D1}{Matrix of code observation points and parameters}
  \item{D2}{Matrix of field observation points}
  \item{H1}{Basis functions}
  \item{y}{Code observations corresponding to rows of \code{D1}}
  \item{E.theta}{expectation wrt theta; see details}
  \item{extractor}{Extractor function}
  \item{theta}{Parameters}
  \item{phi}{Hyperparameters}
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
\details{
  Argument \code{E.theta} is officially a function that, given
  \eqn{x},y returns
  \eqn{E_\theta\left(h_1(x,\theta)\right)}{E_theta(h1(x,theta))}.
  
  However, if supplied a non-function (this is tested by
  \code{is.function()} in the code), \code{E.theta} is interpreted as
  values of \eqn{\theta}{theta} to use.  Recycling is carried out by
  function \code{D1.fun()}
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{p.page4}}}
\examples{
data(toys)

etahat(D1=D1.toy, D2=D2.toy, H1=H1.toy, y=y.toy,
    E.theta=E.theta.toy, extractor=extractor.toy, phi=phi.toy)

# Now try giving E.theta=1:3, which will be interpreted as a value for theta:
etahat(D1=D1.toy, D2=D2.toy, H1=H1.toy, y=y.toy, E.theta=1:3,
     extractor=extractor.toy, phi=phi.toy)

}
\keyword{array}
