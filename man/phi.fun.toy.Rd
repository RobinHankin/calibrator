\name{phi.fun.toy}
\alias{phi.fun.toy}
\alias{phi.change}
\title{Functions to create or change hyperparameters}
\description{
  Function to create (\code{phi.fun.toy}) or modify
  (\code{phi.change}) toy hyperparameters \eqn{\phi}{phi}
  in a form suitable for passing to the other functions in the library.

  The user should never make \eqn{\phi}{phi} by hand; always use one of
  these functions
}
\usage{
phi.fun.toy(rho, lambda, psi1, psi1.apriori, psi2, psi2.apriori,
  theta.apriori)
phi.change(phi.fun, old.phi = NULL, rho = NULL, lambda = NULL,
          psi1 = NULL, psi1.apriori=NULL,  psi1.apriori.mean=NULL,
          psi1.apriori.sigma=NULL, psi2 = NULL, psi2.apriori=NULL,
          psi2.apriori.mean=NULL,  psi2.apriori.sigma=NULL,
          theta.apriori=NULL, theta.apriori.mean=NULL,
          theta.apriori.sigma=NULL)
}
\arguments{
  \item{phi.fun}{In \code{phi.change()}, the name of the function that 
    creates the hyperparameters.  Use \code{phi.fun.toy()} for the toy
    dataset
  }
  \item{old.phi}{In function \code{phi.change()}, the hyperparameter
    object \eqn{\phi}{phi} to be modified
  }
  \item{rho}{Correlation hyperparameter appearing in main equation
  }
  \item{lambda}{Noise hyperparameter
  }
  \item{psi1}{Roughness lengths hyperparameter for design matrix
    \code{D1}.  Internal function \code{pdm.maker.psi1()} takes
    \code{psi1} as an argument and returns \code{omega_x},
    \code{omega_t} and \code{sigma1squared}.

    Recall that \eqn{\Omega_x}{omega_x} and \eqn{Omega_t}{omega_t} are
    arbitrary functions of \eqn{\psi_1}{psi1}.  In this case,
    the values are \code{omega_x=psi1[1:2]}, \code{omega_t=psi1[3:4]}
    and \code{sigma1squared=psi1[6]}}
  \item{psi1.apriori}{A priori PDF for \eqn{\psi_1}{psi1}.  In the form
    of a two element list with first element (\code{mean}) the mean and
    second element (\code{sigma}) the covariance matrix; distribution of
    the logarithms is assumed to be multivariate normal.  In the toy
    example, the mean is a vector of length six (the first five are
    \eqn{\psi_1}{psi1} and the sixth is for
    \eqn{\sigma_1^2}{sigma1squared}), and the variance is the
    corresponding six-by-six matrix.  Use function \code{prob.psi1()} to
    calculate the apriori probability density for a particular value of
    \eqn{\psi_1}{psi1}}
  \item{psi1.apriori.mean}{In function \code{phi.change.toy()}, use this
    argument to change just the mean of \code{psi1} (and leave the value
    of \code{sigma} unchanged)}
  \item{psi1.apriori.sigma}{In function \code{phi.change.toy()}, use
    this argument to change just the variance matrix  of \code{psi1}}
  \item{psi2}{Roughness lengths hyperparameter for \code{D2}.

    Internal function \code{pdm.maker.psi2()} takes \code{psi2} as an
    argument and returns \code{omegastar_x} and \code{sigma2squared}.
    In \code{phi.fun.toy()}, the values are \code{omegastar_x=psi2[1:2]}
    and \code{sigma2squared=psi2[3]}.

    NB: function \code{stage2()} optimizes more than just \code{psi2}.
    It simultaneously optimizes \code{psi2} and \code{lambda} and
    \code{rho}}
  \item{psi2.apriori}{A priori PDF for \eqn{\psi_2}{psi2} \strong{and}
    hyperparameters \eqn{\rho}{rho} and \eqn{\lambda}{lambda} (in that
    order). 
    
    As for \code{psi1.apriori}, this is in the form of a list with the
    first element (\code{mean}) the mean and second element
    (\code{sigma}) the covariance matrix; the logs are multivariate
    normal.  In the toy example, the mean is a vector of length five.
    The first and second elements of the mean are the apriori mean of
    \eqn{\rho}{rho} and \eqn{\lambda}{lambda} respectively; the third
    and fourth elements are the apriori mean of \eqn{\psi_2}{psi2} (that
    is, \code{x} and \code{y} respectively); and the fifth is the mean
    of \eqn{\sigma_2^2}{sigma2squared}.

    The second element of \code{phi.toy$psi2.apriori}, \code{sigma}, is
    the corresponding four-by-four variance matrix.  Use function
    \code{prob.psi2()} to calculate the apriori probability density of a
    particular value of \eqn{\psi_2}{psi2}}
  \item{psi2.apriori.mean}{In \code{phi.change.toy()}, use to change
    just the mean of \code{psi2}}
    \item{psi2.apriori.sigma}{In
    \code{phi.change.toy()}, use to change just the variance matrix of
    \code{psi2}}
  \item{theta.apriori}{Apriori PDF for
    \eqn{\theta}{theta}.  As above, in the form of a list with elements
    for the mean and covariance.  The distribution is multivariate
    normal (NB: The distribution is multivariate normal and NOT
    lognormal!  To be explicit: \eqn{\log(\theta)}{log(theta)} is
    lognormally distributed).  Use function \code{prob.theta()} to
    calculate the apriori probability density of a particular value of
    \eqn{\theta}{theta}}
  \item{theta.apriori.mean}{In \code{phi.change.toy()}, use to change
    just the mean of \code{theta}}
  \item{theta.apriori.sigma}{In \code{phi.change.toy()},
    use to change just the variance matrix of \code{theta}}
}
\value{
  Returns a list of several elements:
  \item{rho}{Correlation hyperparameter}
  \item{lambda}{Noise hyperparameter}   
  \item{psi1}{Roughness lengths hyperparameter for \code{D1}}
  \item{psi1.apriori}{Apriori mean and variance matrix for \code{psi1}}
  \item{psi2}{Roughness lengths hyperparameter for \code{D2}}
  \item{psi2.apriori}{Apriori mean and variance matrix for \code{psi2}}
  \item{theta.apriori}{Apriori mean and variance matrix for the
    parameters}
  \item{omega_x}{Positive definite matrix for the lat/long part of
    \code{D1}, whose diagonal is \code{psi1[1:2]}}
  \item{omega_t}{Positive definite matrix for the code parameters theta,
    whose diagonal is \code{psi1[3:5]}}
  \item{omegastar_x}{Positive definite matrix for use in equation 13 of
    the supplement; represents distances between rows of \code{D2}}
  \item{sigma1squared}{variance}
  \item{sigma2squared}{variance}
  \item{omega_x.upper}{Upper triangular Cholesky decomposition for \code{omega_x}}
  \item{omega_x.lower}{Lower triangular Cholesky decomposition for \code{omega_x}}
  \item{omega_t.upper}{Upper triangular Cholesky decomposition for \code{omega_t}}
  \item{omega_t.lower}{Lower triangular Cholesky decomposition for \code{omega_t}}
  \item{a}{Precalculated matrix for use in
    \code{Edash.theta(...,fast.but.opaque=TRUE)}}
  \item{b}{Precalculated matrix for use in
    \code{Edash.theta(...,fast.but.opaque=TRUE)}}
  \item{c}{Precalculated scalar for use in
    \code{ht.fun(...,fast.but.opaque=TRUE)}}
  \item{A}{Precalculated scalarfor use in
    \code{tt.fun()}}
  \item{A.upper}{Upper triangular Cholesky decomposition for \code{A}}
  \item{A.lower}{Lower triangular Cholesky decomposition for \code{A}}
}
\details{
  Note that this toy function contains within itself
  \code{pdm.maker.toy()} which extracts \code{omega_x} and
  \code{omega_t} and \code{sigma1squared} from \code{psi1}.
  This will need to  be changed for real-world applications.
  
  Earlier versions of the package had \code{pdm.maker.toy()}
  defined separately.
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
  \code{\link{toys}},
  \code{\link{H1.toy}}}
\examples{

phi.fun.toy(100,101,1:6,list(mean=rep(1,6),sigma=1+diag(6)),50:55,
list(mean=rep(0,4),sigma=0.1+diag(4)),
list(mean=0.1+(1:3),sigma=2.1+diag(3)))

phi.fun.toy(rho=1, lambda=1,
    psi1 = structure(c(1.1, 1.2, 1.3, 1.4, 1.5, 0.7),
            .Names = c("x", "y", "A","B", "C","s1sq")),
    psi1.apriori  = list(
             mean=rep(0,6), sigma=0.4+diag(6)),
             psi2=structure(c(2.1, 2.2), .Names = c("x","y")),
             psi2.apriori  = list(mean=rep(0,5),sigma=0.2+diag(5)),
             theta.apriori = list(mean=0.1+(1:3),sigma=2.1+diag(3))
)

data(toys)
phi.change(phi.fun=phi.fun.toy, old.phi = phi.toy, rho = 100)
phi.change(phi.fun=phi.fun.toy, old.phi = phi.toy,
     theta.apriori.sigma = 4*diag(3))

identical(phi.toy, phi.change(phi.fun=phi.fun.toy, old.phi=phi.toy))
}
\keyword{array}

