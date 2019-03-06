\name{h1.toy}
\alias{h1.toy}
\alias{h2.toy}
\title{Basis functions}
\description{
Basis functions for D1 and D2 respectively.
}
\usage{
h1.toy(x)
h2.toy(x)
}
\arguments{
  \item{x}{Vector of lat/long or lat/long and theta}
}
\details{
  Note that \code{h1()} operates on a vector: for dataframes, use
  \code{H1.toy()} which is a wrapper for \code{apply(D1, 1, h1)}.

  \strong{NB} If the definition of \code{h1.toy()} or \code{h2.toy()} is
  changed, then function \code{hbar.toy()} must be changed to match.
  This cannot be done automatically, as the form of \code{hbar.toy()}
  depends on the distribution of \code{X}.  The shibboleth is whether
  \code{E_X()} commutes with \code{h_1()}; it does in this case but does
  not in general (for example, consider
  \eqn{h(x,\theta)=c(1,x,x^2)}{h(x,theta)=c(1,x,x^2)} and \eqn{X\sim
  N(m,V)}{X~N(m,V)}.  Then \eqn{E_X(h(x,\theta))}{E_X(h(x,theta))} will
  be \eqn{(1,m,m^2+V,\theta)}{(1,m,m^2+V,theta)}; note the V)
}
\value{
  Returns basis functions of a vector; in the toy case, just prepend a
  \code{1}.
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
\seealso{\code{\link{H1.toy}}}
\examples{
data(toys)
 h1.toy(D1.toy[1,])
}
\keyword{array}
