\name{D1.fun}
\alias{D1.fun}
\title{Function to join x.star to t.vec to give matrix D1}
\description{
 Function to join \code{x.star} to \code{t.vec} to give matrix \code{D1} with correct row-
    and column- names. 
}
\usage{
D1.fun(x.star, t.vec)
}
\arguments{
  \item{x.star}{Matrix of code run points}
  \item{t.vec}{Matrix of parameter theta values}
}
\details{
  Note that the matrix returned is a D1 matrix: it is a design matrix for
  code observations as it contains both x and theta
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
\seealso{\code{\link{toys}}}
\examples{
data(toys)
jj <- extractor.toy(D1.toy)
x.star.toy <- jj$x.star
t.vec.toy  <- jj$t.vec
D1.fun(x.star.toy , t.vec.toy)  # both dataframes
D1.fun(x.star.toy , theta.toy)  # one dataframe, one vector
D1.fun(x.toy , t.vec.toy)       # one vector, one dataframe
D1.fun(x.toy,theta.toy)         # two vectors
}
\keyword{array}
