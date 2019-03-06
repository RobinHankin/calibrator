\name{E.theta.toy}
\alias{E.theta.toy}
\alias{Edash.theta.toy}
\title{Expectation and variance with respect to theta}
\description{
  Function 
  \code{E.theta.toy} returns expectation of \code{H_1(D)} with respect to
  \eqn{\theta}{theta}; \code{Edash.theta.toy} returns expectation with
  respect to \eqn{E'}{Edash}.  Function \code{E.theta.toy} also returns
  information about nonlinear behaviour of \code{h1(x,theta)}.
}
\usage{
E.theta.toy(D2=NULL,  H1=NULL, x1=NULL, x2=NULL, phi, give.mean=TRUE)
Edash.theta.toy(x, t.vec, k,  H1, fast.but.opaque=FALSE, a=NULL, b=NULL,
phi=NULL)
}
\arguments{
  \item{D2}{Observation points}
  \item{H1}{Regression function for D1}
  \item{phi}{hyperparameters.  Default value of \code{NULL} only to be
    used in \code{Edash.theta.toy()} when \code{fast.but.opaque} is \code{TRUE}}
  \item{x}{lat/long point (for \code{Edash.theta.toy})}
  \item{t.vec}{Matrix whose rows are parameter values (for \code{Edash.theta.toy})}
  \item{k}{Integer specifying column (for \code{Edash.theta.toy})}
    \item{give.mean}{In \code{E.theta.toy()}, Boolean, with default \code{TRUE} meaning to return
    the mean (expectation), and \code{FALSE} meaning to return the \dQuote{variance}}
  \item{fast.but.opaque}{In \code{Edash.theta.toy()}, Boolean, with
    default \code{FALSE} meaning to use a slow but clear method.  If
    \code{TRUE}, use faster code but parameters \code{a} and \code{b} must then be specified}
  \item{a}{Constant term, needed if \code{fast.but.opaque} is
    \code{TRUE}: 
    \eqn{\left(V_\theta^{-1}+2\Omega_t\right)^{-1}V_\theta^{-1}m_\theta}{(V_theta^{-1}+2Omega_t)^{-1}V_theta^{-1}m_theta}.
    Specifying \code{a} in advance saves execution time}
  \item{b}{Linear term, needed if \code{fast.but.opaque} is \code{TRUE}:
    \eqn{2\left(V_\theta^{-1}+2\Omega_t\right)^{-1}\Omega_t}{2(V_theta^{-1}+2Omega_t)^{-1}Omega_t}
    (multiplied by \code{t[k,]} in \code{Edash.theta.toy()}).}
  \item{x1}{In \code{E.theta.toy(g=F,...)}, the value of \code{x} in
    \eqn{h_1(x,\theta)}{h_1(x,theta)}.  The default value is \code{NULL}
    because in simple cases such as that implemented here, the output is
    independent of \code{x1} and \code{x2}}
  \item{x2}{In \code{E.theta.toy(g=F,...)}, the value of \code{x} in
    \eqn{h_1(x,\theta)}{h_1(x,theta)}}
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
\note{
  A terse discussion follows; see the \code{calex.pdf} vignette and the
  1D case study in directory \code{inst/doc/one/dim/} for more details
  and examples.
  
  Function \code{E.theta.toy(give.mean=FALSE,...)} does \strong{not}
  return the variance!  The matrix returned is a \strong{different size}
  from the variance matrix!

  It returns the thing that must be added to
  \code{crossprod(E_theta(h1(x,theta)),t(E_theta(h1(x,theta))))} to give
  \code{E_theta(h1(x,theta).t(h1(x,theta)))}.

  In other words, it returns
  \code{E_theta(h1(x,theta).t(h1(x,theta)))}-
  \code{crossprod(E_theta(h1(x,theta)),t(E_theta(h1(x,theta))))}.
  
  If the terms of
  \code{h1()} are of the form \code{c(o,theta)} (where \code{o} is a
  vector that is a function of \code{x} alone, and independent of
  \code{theta}), then the function will include the variance matrix, in
  the lower right corner (zeroes elsewhere).

  Function \code{E.theta()} must be updated if \code{h1.toy()}
  changes: unlike \code{E.theta()} and \code{Edash.theta()}, it does not
  \dQuote{know} where the elements that vary with \code{theta} are, nor
  their (possibly x-dependent) coefficients.

  This form of the function requires \code{x1} and \code{x2} arguments,
  for good form's sake, even though the returned value is independent of
  \code{x} in the toy example.  To see why it is
  necessary to include \code{x}, consider a simple case with
  \eqn{h_1(x,\theta)=(1,x\theta)^T}{h1(x,theta)=(1,x*theta)'}.  Now
  \eqn{E_\theta\left(h(x,\theta)\right)}{E_theta(h(x,theta))} is just
  \eqn{(1,x\overline{\theta})^T}{(1,x*mean(theta))'} but
  \deqn{E_\theta\left(h_1(x,\theta)h_1(x,\theta)^T\right)}{E_theta(h_1(x,theta)h1(x,theta)^T)}
  is a 2-by-2 matrix (\eqn{M}, say) with
  \eqn{E_\theta(M)=h_1(x,\overline{\theta})h_1(x,\overline{\theta})^T +
  \mbox{variance terms}}{E_theta(M)=h1(x,thetabar)h_1(x,thetabar)^T +
  variance terms}.

\deqn{
  E_\theta\left(
  \begin{array}{cc}
      1 & x\theta\\
      x\theta & x^2\theta^2
      \end{array}\right)
      }{ommitted: see dvi}
      
  All three functions here are intimately connected to the form of
  \code{h1.toy()} and changing it (or indeed \code{H1.toy()}) will
  usually require rewriting all three functions documented here.  Look
  at the definition of \code{E.theta.toy(give=F)}, and you will see that
  even changing the meat of \code{h1.toy()} from \code{c(1,x)} to
  \code{c(x,1)} would require a redefinition of \code{E.theta.toy(g=F)}.

  The only place that \code{E.theta.toy(g=F)} is used is internally in
  \code{hh.fun()}.  
   
  }
\author{Robin K. S. Hankin}
\seealso{
  \code{\link{toys}}
}
\examples{
data(toys)
E.theta.toy(D2=D2.toy,      H1=H1.toy,phi=phi.toy)
E.theta.toy(D2=D2.toy[1,],  H1=H1.toy,phi=phi.toy)
E.theta.toy(D2=x.toy,       H1=H1.toy,phi=phi.toy)
Edash.theta.toy(x=x.toy,t.vec=t.vec.toy,k=1, H1=H1.toy,phi=phi.toy)
}
\keyword{array}
