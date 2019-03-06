\name{beta2hat.fun}
\alias{beta2hat.fun}
\title{estimator for beta2}
\description{
estimates beta2 as per the equation of page 4 of the supplement.  Used
by \code{p.page4()}
}
\usage{
beta2hat.fun(D1, D2, H1, H2, V, z, etahat.d2, extractor, E.theta,
Edash.theta, phi)
}
\arguments{
  \item{D1}{Matrix of code run points}
  \item{D2}{Matrix of observation points}
  \item{H1}{regression basis functions}
  \item{H2}{regression basis functions}
  \item{V}{overall covariance matrix}
  \item{z}{vector of observations}
  \item{etahat.d2}{expectation as per \code{etahat.vector}}
  \item{extractor}{extractor function}
  \item{E.theta}{Expectation}
  \item{Edash.theta}{Expectation wrt thetadash}  
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
\seealso{\code{\link{W2}}}
\examples{
data(toys)

etahat.d2 <- etahat(D1=D1.toy, D2=D2.toy, H1=H1.toy, y=y.toy,
E.theta=E.theta.toy, extractor=extractor.toy, phi=phi.toy)

beta2hat.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, V=NULL,
z=z.toy, etahat.d2=etahat.d2, extractor=extractor.toy,
E.theta=E.theta.toy, Edash.theta=Edash.theta.toy, phi=phi.toy)

jj <- create.new.toy.datasets(D1.toy , D2.toy)
phi.true <- phi.true.toy(phi=phi.toy)
y.toy <- jj$y.toy
z.toy <- jj$z.toy
d.toy <- jj$d.toy

etahat.d2 <- etahat(D1=D1.toy, D2=D2.toy, H1=H1.toy, y=y.toy,
E.theta=E.theta.toy, extractor=extractor.toy, phi=phi.toy)

beta2hat <- beta2hat.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, V=NULL,
z=z.toy, etahat.d2=etahat.d2, extractor=extractor.toy,
E.theta=E.theta.toy, Edash.theta=Edash.theta.toy,
phi=phi.toy)

print(beta2hat)

plot(z.toy , H2.toy(D2.toy) \%*\% beta2hat) 


}
\keyword{array}
