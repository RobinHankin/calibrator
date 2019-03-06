\name{create.new.toy.datasets}
\alias{create.new.toy.datasets}
\docType{data}
\title{Create new toy datasets}
\description{
  Creates new toy datasets, by sampling from an explicitly specified
  multivariate Gaussian distribution whose covariance matrix is that
  required for a Gaussian process.
}

\usage{create.new.toy.datasets(D1,D2,export=FALSE)}
\arguments{
  \item{export}{Boolean, with default \code{FALSE} meaning to return toy
    datasets and \code{TRUE} meaning to return, instead, a list of the
    true values of the parameters}
  \item{D1}{D1; set of code run points}
  \item{D2}{D2; set of field observation points}
  }
\value{
    Returns a list of three elements:
    \item{y.toy}{}
    \item{z.toy}{}
    \item{d.toy}{}
}
\note{
  Because function \code{create.new.toy.datasets()} calls
  \code{computer.model()} and \code{model.inadequacy()}, the datasets
  returned are drawn from a multivariate Gaussian distribution which
  \strong{is} a Gaussian process
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
\seealso{
  \code{\link{toys}}, \code{\link{reality}}, \code{\link[emulator]{latin.hypercube}}
}
\examples{
data(toys)
create.new.toy.datasets(D1=D1.toy , D2=D2.toy)

}
\keyword{datasets}
