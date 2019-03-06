\name{dists.2frames}
\alias{dists.2frames}
\title{Distance between two points}
\description{
Distance between points specified by rows of two matrices, according to a
positive definite matrix.  If not specified, the second matrix used is
the first.
}
\usage{
dists.2frames(a, b=NULL, A=NULL, A.lower=NULL, test.for.symmetry=TRUE)
}
\arguments{
  \item{a}{First dataframe whose rows are the points}
  \item{b}{Second dataframe whose rows are the points; if \code{NULL},
    use \code{a}}
  \item{A}{Positive definite matrix; if \code{NULL}, a value for
    \code{A.lower} is needed.  If a value for \code{A} is supplied, use
    a clear but possibly slower method}
  \item{A.lower}{The lower triangular Cholesky decomposition of
    \code{A} (only needed if \code{A} is \code{NULL}).
    
    If a value for \code{A.lower} is specified, this means that a
    relatively opaque but possibly faster method will be used.  The time
    saving ought to be negligible unless \code{nrow(a)} (or
    \code{nrow(b)} if supplied), is huge.  \strong{Note that this option does
    not test for symmetry of matrix A}}
    \item{test.for.symmetry}{Boolean, with default \code{TRUE} meaning
    to calculate all element arrays (elegantly), and \code{FALSE}
    meaning to calculate only the upper triangular elements (using
    loops), which ought to be faster.  The value of this argument should
    not affect the returned value, up to numerical accuracy}
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
\seealso{\code{\link{dists.2frames}}}
\examples{
data(toys)

dists.2frames(a=D2.toy,A=diag(2))

A <- diag(2) + matrix(0.2,2,2)
A.lower <- t(chol(A))
jj.1 <- dists.2frames(a=D2.toy, A=A, test=TRUE)
jj.2 <- dists.2frames(a=D2.toy, A=A, test=FALSE)

jj.3 <- dists.2frames(a=D2.toy, A.lower=A.lower, test=FALSE)
jj.4 <- dists.2frames(a=D2.toy, A.lower=A.lower, test=TRUE)


}
\keyword{array}
