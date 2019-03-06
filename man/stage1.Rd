\name{stage1}
\alias{stage1}
\alias{stage2}
\alias{stage3}
\title{Stage 1,2 and 3 optimization on toy dataset}
\description{
Perform O'Hagan's three stage optimization on the toy dataset.  Function
\code{stage1()} and \code{stage2()} find the optimal values for
the hyperparameters and \code{stage3()} finds the optimal values for
the three parameters.
}
\usage{
stage1(D1, y, H1,  maxit,  trace=100, method="Nelder-Mead",
      directory = ".", do.filewrite=FALSE, do.print=TRUE,
      phi.fun, lognormally.distributed=FALSE, include.prior=TRUE, phi)
stage2(D1, D2, H1, H2, y, z, maxit, trace=100, method = "Nelder-Mead",
      directory = ".", do.filewrite=FALSE, do.print=TRUE,  extractor,
      phi.fun, E.theta, Edash.theta, isotropic=FALSE,
      lognormally.distributed = FALSE, include.prior = TRUE,
      use.standin = FALSE, rho.eq.1 = TRUE, phi) 
stage3(D1, D2, H1, H2, d, maxit, trace=100, method="Nelder-Mead",
      directory = ".", do.filewrite=FALSE, do.print=TRUE,
      include.prior = TRUE, lognormally.distributed=FALSE,
      theta.start=NULL, phi) 
}
\arguments{
  \item{maxit}{Maximum number of iterations as passed to \code{optim()}}
  \item{trace}{Amount of information displayed, as passed to \code{optim()}}
  \item{D1}{Matrix whose rows are points at which code output is known}
  \item{D2}{Matrix whose rows are points at which observations were made}
  \item{H1,H2}{Regressor basis functions for \code{D1} and \code{D2}}
  \item{y}{Code outputs.  Toy example is \code{y.toy}}
  \item{z}{Observations.  Toy example is \code{z.toy}}
  \item{d}{Data vector consisting of the code runs and observations}
  \item{extractor}{extractor function for \code{D1}}
  \item{E.theta,Edash.theta}{Expectation WRT theta, and dashed theta.
    Toy examples are \code{E.theta.toy()} and \code{Edash.theta.toy()}}
  \item{phi.fun}{Function to create hyperparameters; passed  (in
    \code{stage1()} and \code{stage2()}) to \code{phi.change()}.  Toy
    version is \code{phi.fun.toy()}}
  \item{method}{Method argument passed to \code{optim()}; qv}
  \item{include.prior}{Boolean variable with default \code{TRUE} meaning
    to include the prior distribution in the optimization process and
    \code{FALSE} meaning to use an uniformative prior (effectively
    uniform support).  This variable is passed to \code{p.eqn4.supp()}
    for \code{stage1()}, \code{p.page4()} for \code{stage2()}, and
    \code{p.eqn8.supp()}  for \code{stage3()}} 
  \item{lognormally.distributed}{Boolean with \code{TRUE} meaning to use
    a lognormal distn.  See \code{prob.theta} for details}
  \item{do.filewrite}{Boolean, with \code{TRUE} meaning to
    save a \code{load}able file \code{stage[123].<date>}, containing the interim value of \code{phi}
    and the corresponding optimand to \code{directory} at each evalution
    of the optimizer.  If \code{FALSE}, don't write the files}
  \item{directory}{The directory to write files to; only matters if
    \code{do.filewrite} is \code{TRUE}}
  \item{isotropic}{In function \code{stage2()}, Boolean with default
    \code{FALSE} meaning to carry out a full optimization, and
    \code{TRUE} meaning to restrict the scope to isotroic roughness
    matrices.  See details section below}
  \item{do.print}{Boolean, with default \code{TRUE} meaning to print
    interim values of \code{phi} at each evaluation}
  \item{use.standin}{In \code{stage2()}, a Boolean argument, with
    default \code{FALSE} meaning to use the real value for matrix
    \code{V.temp}, and \code{TRUE} meaning to use a standing that is the
    same size but contains fictitious values.  The only time to set
    \code{use.standin} to \code{TRUE} is when debugging as it runs
    several orders of magnitude faster}
  \item{rho.eq.1}{Boolean, with default \code{TRUE} meaning to hold the
    value of \code{rho} constant at one (1)}
  \item{theta.start}{In \code{stage3()}, the starting point of the
    optimization with default \code{NULL} meaning to use the maximum
    likelihood point of the apriori distribution (ie \code{phi$theta.apriori$mean})}
  \item{phi}{Hyperparameters.  Used as initial values for the
    hyperparameters in the optimization routines}
}
\details{
  The three functions documented here carry out the multi-stage
  optimization detailed in KOH2001 (actually, KOH2001 only defined stage
  1 and stage 2, which estimated the hyperparameters.  What is here
  called \dQuote{\code{stage3()}} estimates the true value of
  \eqn{\theta}{theta} given the hyperparameters).

  \code{stage1()} carries out stage 1 of KOH2001 which is used to
  estimate \eqn{\psi_1}{psi1} using optimization.

  In function \code{stage2()}, setting argument \code{isotropic} to
  \code{TRUE} will force \code{phi$omegastar_x} to be a function of a
  length one scalar.  The value of \code{phi$omegastar_x} used will
  depend on \code{pdm.maker.psi2()} (an internal function appearing in
  \code{hpa.fun.toy()}).  In \code{stage2()}, several kludges are made.
  The initial conditions are provided by argument \code{phi}.  The
  relevant part of this is \code{phi$psi2}.  
  
  Function \code{stage2()} estimates \eqn{\psi_2}{psi2} \strong{and}
  \eqn{\rho}{rho} \strong{and} \eqn{\lambda}{lambda}, using
  optimization.  Note that \eqn{\psi_2}{psi2} includes
  \eqn{\sigma_2^2}{sigma2squared} in addition to \code{omegastar_X} (in
  the toy case, \eqn{\psi_2}{psi2} has three elements: the first two are
  the diagonal of \code{omegastar_x} and the third is
  \eqn{\sigma_2^2}{sigma2squared} \strong{but} this information is
  encoded in \code{phi.fun.toy()}, which changes from application to
  application).

  Function \code{stage3()} attempts to find the maximum likelihood
  estimate of \eqn{\theta}{theta}, given hyperparameters and
  observations, using optimization
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
  \code{\link{phi.fun.toy}}  
}
\examples{
data(toys)
stage1(D1=D1.toy,y=y.toy,H1=H1.toy, maxit=5, phi.fun=phi.fun.toy, phi=phi.toy)

##now try with a slightly bigger dataset:
##Examples below take a few minutes to run:

set.seed(0)
data(toys)
jj <- create.new.toy.datasets(D1.toy , D2.toy)
y.toy <- jj$y.toy
z.toy <- jj$z.toy
d.toy <- jj$d.toy

phi.toy.stage1 <- stage1(D1=D1.toy, y=y.toy, H1=H1.toy, maxit=10, phi.fun=phi.fun.toy, phi=phi.toy)

phi.toy.stage2 <- stage2(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy,
 y=y.toy, z=z.toy, extractor=extractor.toy,
phi.fun=phi.fun.toy, E.theta=E.theta.toy, Edash.theta=Edash.theta.toy,
maxit=3, phi=phi.toy.stage1)

stage3(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, d=d.toy, maxit=3, phi=phi.toy.stage2)

# Now try with the true values of the hyperparameters:
phi.true <- phi.true.toy(phi=phi.toy)

stage3(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, d=d.toy, maxit=3, phi=phi.true)

}
\keyword{array}
