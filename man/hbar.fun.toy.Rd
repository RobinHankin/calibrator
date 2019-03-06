\name{hbar.fun.toy}
\alias{hbar.fun.toy}
\title{Toy example of hbar (section 4.2)}
\description{
A toy example of the expectation of h as per section 4.2
}
\usage{
hbar.fun.toy(theta, X.dist, phi)
}
\arguments{
  \item{theta}{Parameter set}
  \item{X.dist}{Distribution of variable inputs \code{X} as per section 4.2}
  \item{phi}{Hyperparameters}
}
\details{
Note that if \code{h1.toy()} or \code{h2.toy()} change, then
\code{hbar.fun.toy()} will have to change too; see \code{?h1.toy} for an
example in which nonlinearity changes the form of \code{E.theta.toy()}
}
\value{
Returns a vector as per section 4.2 of KOH2001S
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
\seealso{\code{\link{h1.toy}}}
\examples{
data(toys)
hbar.fun.toy(theta=theta.toy, X.dist=X.dist.toy, phi=phi.toy)
}
\keyword{array}
