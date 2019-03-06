\name{cov.p5.supp}
\alias{cov.p5.supp}
\alias{Cov.eqn9.supp}
\title{Covariance function for posterior distribution of z}
\description{
Covariance function for posterior distribution of \eqn{z(\cdot)}{z(.)}
conditional on estimated hyperparameters and calibration parameters
\eqn{\theta}{theta}. 
 }
\usage{
Cov.eqn9.supp(x, xdash=NULL, theta, d, D1, D2, H1, H2, phi)
cov.p5.supp  (x, xdash=NULL, theta, d, D1, D2, H1, H2, phi)
}
\arguments{
  \item{x}{first point, or (\code{Cov.eqn9.supp()}) a matrix whose rows
    are the points of interest}
  \item{xdash}{The second point, or (\code{Cov.eqn9.supp()}) 
    a matrix whose rows are the points of interest.  The default of
    \code{NULL} means to use \code{xdash=x}}
  \item{theta}{Parameters.  For \code{Cov.eqn9.supp()}, supply a vector
    which will be interpreted as a single point in parameter space.  For
    \code{cov.p5.supp()}, supply a matrix whose rows will be interpreted
    as points in parameter space}
  \item{d}{Observed values}
  \item{D1}{Code run design matrix}
  \item{D2}{Observation points of real process}
  \item{H1}{Basis function for \code{D1}}
  \item{H2}{Basis function for \code{D2}}
  \item{phi}{Hyperparameters}
}
\details{
Evaluates the covariance function: the last formula on page 5 of the
supplement.  The two functions documented here are vectorized
differently.

Function \code{Cov.eqn9.supp()} takes matrices for arguments \code{x}
and \code{xdash} and a single vector for \code{theta}.  Evaluation is
thus taken at a single, fixed value of \code{theta}.  The function
returns a matrix whose rows correspond to rows of \code{x} and whose
columns correspond to rows of \code{xdash}.

Function \code{cov.p5.supp()} takes a vector for arguments \code{x} and
\code{xdash} and a matrix for argument \code{theta} whose rows are the
points in parameter space.  A vector \code{V}, with elements
corresponding to the rows of argument \code{theta} is returned:
\deqn{V[i] = \mbox{cov}\left(z(x),z(x')|\theta_i\right)}{V[i] =
  cov(z(x),z(x')|theta[i])}
}
\value{
  Returns a matrix of covariances
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
  May return the transpose of the desired object
}
  \examples{
data(toys)
x <- rbind(x.toy,x.toy+1,x.toy,x.toy,x.toy)
rownames(x) <- letters[1:5]
xdash <- rbind(x*2,x.toy)
rownames(xdash) <- LETTERS[1:6]

Cov.eqn9.supp(x=x,xdash=xdash,theta=theta.toy,d=d.toy,D1=D1.toy,
    D2=D2.toy,H1=H1.toy,H2=H2.toy,phi=phi.toy)

phi.true <- phi.true.toy(phi=phi.toy)

Cov.eqn9.supp(x=x,xdash=xdash,theta=theta.toy,d=d.toy,D1=D1.toy,
     D2=D2.toy,H1=H1.toy,H2=H2.toy,phi=phi.true)


# Now try a sequence of thetas:
cov.p5.supp(x=x.toy,theta=t.vec.toy,d=d.toy,D1=D1.toy,D2=D2.toy,
    H1=H1.toy,H2=H2.toy,phi=phi.toy)

}
\keyword{array}
