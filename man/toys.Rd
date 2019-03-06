\name{toys}
\alias{D1.toy}
\alias{D2.toy}
\alias{d.toy}
\alias{phi.toy}
\alias{theta.toy}
\alias{t.vec.toy}
\alias{toys}
\alias{x.toy}
\alias{x.toy2}
\alias{x.vec}
\alias{y.toy}
\alias{z.toy}
\alias{V.toy}
\alias{X.dist.toy}
\docType{data}
\title{Toy datasets}
\description{
  Toy datasets that illustrate the package.
}
\usage{
  data(toys)
  D1.toy
  D2.toy
  d.toy
  phi.toy
  theta.toy
  V.toy
  X.dist.toy
}
\format{
  The \code{D1.toy} matrix is 8 rows of code run points, with five
  columns.  The first two columns are the lat and long and the next
  three are parameter values.

  The \code{D2.toy} matrix is five rows of observations on two
  variables, \code{x} and \code{y} which are styled
  \dQuote{latitude and longitude}.

  \code{d.toy} is the \dQuote{data} vector consisting of length 13: elements
  1-8 are code runs and elements 9-13 are observations.
  
  \code{theta.toy} is a vector of length three that is a working example
  of \eqn{\theta}{theta}.  The parameters are designed to work with
  \code{computer.model()}.

  \code{t.vec.toy} is a matrix of eight rows and three columns.  Each
  row specifies a value for \eqn{\theta}{theta}.  The eight rows
  correspond to  eight code runs.

  \code{x.toy} and \code{x.toy2} are vectors of length two that gives a
  sample point at which observations may be made (or the code run).
  The gloss of the two elements is latitude and longitude.

  \code{x.vec} is a matrix whose rows are reasonable x values but
  \emph{not} those in \code{D2.toy}.
  
  \code{y.toy} is a vector of length eight.  Each element corresponds to
  the output from a code run at each of the rows of \code{D1.toy}.
  
  \code{z.toy} is a vector of length five.  Each element corresponds to
  a measurement at each of the rows of \code{D2.toy}.

  \code{V.toy} is a five by five variance-covariance matrix for the toy
  datasets.

  \code{X.dist.toy} is a toy example of a distribution of \code{X} for
  use in calibrated uncertainty analysis, section 4.2.
  
  \strong{Brief description of toy functions fully documented under their own manpage}
  
  Function \code{create.new.toy.datasets()} creates new toy datasets
  with any number of observations and code runs.

  Function \code{E.theta.toy()} returns expectation of \code{H(D)} with
  respect to \eqn{\theta}{theta}; \code{Edash.theta.toy()} returns
  expectation with respect to \eqn{E'}{Edash}.
  
  Function \code{extractor.toy()}  extracts \code{x.star.toy}
  and \code{t.vec.toy} from \code{D2}; toy example needed because the
  extraction differs from case to case.

  Function \code{H1.toy()} applies basis functions to rows of \code{D1}
  and \code{D2}

  Function \code{phi.fun.toy()} creates a hyperparameter object such as
  \code{phi.toy} in a form suitable for passing to the other functions
  in the library.

  Function \code{phi.change.toy()} modifies the hyperparameter object.

  \strong{See the helpfiles listed in the \dQuote{see also} section
  below}
}
\details{
  All toy datasets are documented here.  There are also several toy
  functions that are needed for a toy problem; these are documented
  separately (they are too diverse to document fully in a single
  manpage).  Nevertheless a terse summary  for each toy function
  is provided on this page.  All toy functions in the package are listed
  under \dQuote{See Also}.
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
  \code{\link{create.new.toy.datasets}},
  \code{\link{E.theta.toy}},
  \code{\link{extractor.toy}},
  \code{\link{H1.toy}},
  \code{\link{phi.fun.toy}},
  \code{\link{stage1}}
}
\examples{
data(toys)
D1.toy
extractor.toy(D1.toy)

D2.fun(theta=theta.toy , D2=D2.toy)
D2.fun(theta=theta.toy,D2=D2.toy[1,,drop=FALSE])

library("emulator")
corr.matrix(D1.toy,scales=rep(1,5))
corr.matrix(D1.toy, pos.def.matrix=diag(5))

}

\keyword{datasets}
