\name{tee}
\alias{tee}
\alias{h.fun}
\title{Auxiliary functions for equation 9 of the supplement}
\description{
  Returns a vector whose elements are the \dQuote{distances} from a point
  to the observations and code run points (\code{tee()}); and basis
  functions for use in \code{Ez.eqn9.supp()}
}
\usage{
tee(x, theta, D1, D2, phi)
h.fun(x, theta, H1, H2, phi)
}
\arguments{
  \item{x}{Point from which distances are calculated}
  \item{theta}{Value of parameters}
  \item{D1,D2}{Design matrices of code run points and field observation
    points respectively (\code{tee()})}
  \item{H1,H2}{Basis functions for eta and model inadequacy term
    respectively (\code{h.fun()})}
  \item{phi}{Hyperparameters}
}
\details{
  Equation 9 of the supplement is identical to equation 10 of KOH2001.

  Function \code{h.fun()} returns the first of the subsidiary equations
  in equation 9 of the supplement and function \code{tee()} returns the
  second (NB: do not confuse this with functions \code{t1bar()} and
  \code{t2bar()} which are internal to \code{EK.eqn10.supp()})
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
  \code{\link{Ez.eqn9.supp}}
}
\examples{
data(toys)
tee(x=x.toy, theta=theta.toy, D1=D1.toy, D2=D2.toy, phi=phi.toy)


# Now some vectorized examples:
jj <- rbind(x.toy , x.toy , x.toy+0.01,x.toy+1,x.toy*10)

tee(x=jj, theta=theta.toy, D1=D1.toy, D2=D2.toy, phi=phi.toy)
h.fun(x=jj, theta=theta.toy, H1=H1.toy, H2=H2.toy, phi=phi.toy)

}
\keyword{array}
