\name{H1.toy}
\alias{H1.toy}
\alias{H2.toy}
\title{Basis functions for D1 and D2}
\description{
Applies basis functions to rows of \code{D1} and \code{D2}
}
\usage{
H1.toy(D1)
H2.toy(D2)
}
\arguments{
  \item{D1}{Matrix of code run points}
  \item{D2}{Matrix of observation points}
}
\value{
  Returns a matrix whose rows are the basis functions of the code run
  points or observation points.  Function \code{H1.toy()} operates on
  datasets like \code{D1.toy} (latlong and parameters) and function
  \code{H2.toy()} operates on datasets like \code{D2.toy} (latlong only)
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
  See package \pkg{goldstein} for a less trivial example of \code{h()}.
  }
\seealso{
  \code{\link{D1.toy}},
}
\examples{
data(toys)
jj <- extractor.toy(D1.toy)
x.star.toy <- jj$x.star
t.vec.toy <- jj$t.vec

H1.toy(D1=D1.toy)
H1.toy(D1.toy[1,,drop=FALSE])
H1.toy(D1.fun(x.star.toy , theta.toy)[1,,drop=FALSE])
H1.toy(D1.fun(x.star=x.toy,t.vec=theta.toy))
H1.toy(D1.fun(x.star=x.star.toy[1,],t.vec=t.vec.toy[1,]))
H1.toy(D1.fun(x.star=x.star.toy[1,],t.vec=t.vec.toy[1:2,]))

H2.toy(D2.toy)
H2.toy(t(x.toy))
}
\keyword{array}
