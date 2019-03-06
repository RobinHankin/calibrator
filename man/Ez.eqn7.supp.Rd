\name{Ez.eqn7.supp}
\alias{Ez.eqn7.supp}
\title{Expectation of z given y, beta2, phi}
\description{
  Expectation as per equation 7 on the supplement
}
\usage{
Ez.eqn7.supp(z, D1, H1, D2, H2,  extractor, beta2, y, E.theta,  phi)
}
\arguments{
  \item{z}{Vector of observations}
  \item{D1}{Matrix whose rows are code run points}
  \item{H1}{Regressor basis functions}
  \item{D2}{Matrix whose rows are observation points}
  \item{H2}{Regressor basis functions}
  \item{extractor}{Function to split D1}
  \item{beta2}{coefficients}
  \item{y}{Code outputs at points corresponding to rows of \code{D1}}
  \item{E.theta}{Expectation function to use}
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
\seealso{\code{\link{V.fun}}}
\examples{
data(toys)
etahat.d2 <- etahat(D1=D1.toy, D2=D2.toy, H1=H1.toy, y=y.toy,
    E.theta=E.theta.toy, extractor=extractor.toy, phi=phi.toy)
beta2 <- beta2hat.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, V=V.toy, z=z.toy,
etahat.d2=etahat.d2, extractor=extractor.toy, E.theta=E.theta.toy,
Edash.theta=Edash.theta.toy, phi=phi.toy)
Ez.eqn7.supp(z=z.toy, 
    D1=D1.toy, H1=H1.toy, D2=D2.toy, H2=H2.toy, 
    extractor=extractor.toy, beta2=beta2, y=y.toy, 
    E.theta=E.theta.toy, 
    phi=phi.toy)
}
\keyword{array}
