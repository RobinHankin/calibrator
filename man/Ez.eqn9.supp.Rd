\name{Ez.eqn9.supp}
\alias{Ez.eqn9.supp}
\alias{Ez.eqn9.supp.vector}
\title{Expectation as per equation 10 of KOH2001}
\description{
Expectation as per equation 10 of KOH2001 (not the supplement)
}
\usage{
Ez.eqn9.supp(x, theta, d, D1, D2, H1, H2,  phi)
Ez.eqn9.supp.vector(x, theta, d, D1, D2, H1, H2, phi)
}
\arguments{
  \item{x}{point at which expectation is needed}
  \item{theta}{parameters}
  \item{d}{observations and code outputs}
  \item{D1}{code run points}
  \item{D2}{observation points}
  \item{H1}{regression function for D1}
  \item{H2}{regression function for D2}
  \item{phi}{hyperparameters}
}
\details{
  The user should always use \code{Ez.eqn9.supp()}, which is a wrapper
  for \code{Ez.eqn9.supp.vector()}.  The forms differ in their treatment
  of \eqn{\theta}{theta}.  In the former, \eqn{\theta}{theta} must be a
  vector; in the latter, \eqn{\theta}{theta} may be a matrix, in which
  case \code{Ez.eqn9.supp.vector()} is applied to the rows.

  Note that \code{Ez.eqn9.supp.vector()} is vectorized in \code{x} but
  not \eqn{\theta}{theta} (if given a multi-row object,
  \code{apply(theta,1,...)} is used to evaluate the function for each
  row supplied).

  Function \code{Ez.eqn9.supp()} will take  multiple-row arguments for
  \code{x} and \code{theta}.  The output will be a matrix, with rows
  corresponding to the rows of \code{x} and columns corresponding to the
  rows of \code{theta}.  See the third example below.
  
  Note that function \code{Ez.eqn9.supp()} determines whether there are
  multiple values of \eqn{\theta}{theta} by \code{is.vector(theta)}.  If
  this returns \code{TRUE}, it is assumed that \eqn{\theta}{theta} is a
  single point in multidimensional parameter space; if \code{FALSE}, it
  is assumed to be a matrix whose rows correspond to points in parameter
  space.

  So if \eqn{\theta}{theta} is one dimensional, calling
  \code{Ez.eqn9.supp()} with a vector-valued \eqn{\theta}{theta} will
  fail because the function will assume that \eqn{\theta}{theta} is a
  single, multidimensional, point.  To get round this, use
  \code{as.matrix(theta)}, which is not a vector; the rows are the (1D)
  parameter values.
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
\seealso{\code{\link{tee}}}

\examples{
data(toys)
Ez.eqn9.supp(x=x.toy,  theta=theta.toy, d=d.toy, D1=D1.toy,
         D2=D2.toy, H1=H1.toy,H2=H2.toy, phi=phi.toy)

Ez.eqn9.supp(x=D2.toy, theta=t.vec.toy,  d=d.toy, D1=D1.toy,
         D2=D2.toy, H1=H1.toy,H2=H2.toy, phi=phi.toy)

Ez.eqn9.supp(x=x.vec,  theta=t.vec.toy,  d=d.toy, D1=D1.toy,
         D2=D2.toy, H1=H1.toy,H2=H2.toy, phi=phi.toy)

}
\keyword{array}
