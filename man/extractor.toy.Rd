\name{extractor.toy}
\alias{extractor.toy}
\title{Extracts lat/long matrix and theta matrix from D2.
    }
\description{
Extracts \code{x.star.toy} and \code{t.vec.toy} from \code{D2}; toy
example needed because the extraction differs from case to case.
}
\usage{
extractor.toy(D1)
}
\arguments{
  \item{D1}{Matrix of code run points}
}
\value{
  Returns a list with two elements:
  \item{x.star}{A matrix containing the lat/longs of the code run points}
  \item{t.vec}{A matrix containing the parameters used for the code runs}
}
\details{
  The first two columns give the elements of \code{x.star}
  and columns 3 through 5 give the elements of \code{t.vec}.

  Function \code{extractor.toy} is the inverse of function
  \code{D1.fun}, in the sense that \code{extractor.toy} splits up
  \code{D1}  into \code{x.star} and \code{t.vec}, while \code{D1.fun}
  joins them up again
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
  \code{\link{toys}}, \code{\link{D1.fun}}
}
\examples{
data(toys)
extractor.toy(D1.toy)
extractor.toy(D1.toy[1,,drop=FALSE])
(jj <- extractor.toy(D1.fun(x.star=x.toy , t.vec=theta.toy)))
D1.fun(jj$x.star,jj$t.vec)

}
\keyword{array}
