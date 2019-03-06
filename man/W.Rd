\name{W}
\alias{W}
\title{covariance matrix for beta}
\description{
Covariance matrix of beta given theta, phi, d
}
\usage{
W(D1, D2, H1, H2, theta, det=FALSE, phi)
}
\arguments{
  \item{D1}{Matrix whose rows are code run points}
  \item{D2}{Matrix whose rows are  observation points}
  \item{H1}{regression function}
  \item{H2}{regression function}
  \item{theta}{parameters}
  \item{det}{Boolean, with default \code{FALSE} meaning to return the
    covariance matrix, and \code{TRUE} meaning to return its determinant.}
  \item{phi}{Hyperparameters}
}
\details{
  This function is defined between equations 2 and 3 of the
  supplement.  It is used in functions \code{betahat.fun.koh()},
  \code{p.eqn8.supp()}, and \code{p.joint()}.
  
  Returns
  \deqn{
    {\mathbf W} (\theta)=
    \left(
         {\mathbf H}(\theta)^T {\mathbf V}_d(\theta)^{-1} {\mathbf H}(\theta)
    \right)^{-1}
  }{
    W(theta)=inv(H(theta).inv(Vd(theta)).H(theta)).
  }

  If only the determinant is required, setting argument \code{det} to
  \code{TRUE} is faster than using \code{det(W(..., det=FALSE))}, as the
  former avoids an unnecessary use of \code{solve()}.
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
\seealso{\code{\link{betahat.fun.koh}}}
\examples{
data(toys)
W(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy,  theta=theta.toy, phi=phi.toy)
}
\keyword{array}
