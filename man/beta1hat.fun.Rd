\name{beta1hat.fun}
\alias{beta1hat.fun}
\title{beta1 estimator}
\description{
Least squares estimator for beta1
}
\usage{
beta1hat.fun(D1, H1, y, phi)
}
\arguments{
  \item{D1}{code run points}
  \item{H1}{regressor basis funs}
  \item{y}{code outputs}
  \item{phi}{hyperparameters}
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
\seealso{\code{\link{beta2hat.fun}}}
\examples{
data(toys)
y.toy <- create.new.toy.datasets(D1=D1.toy , D2=D2.toy)$y.toy
beta1hat.fun(D1=D1.toy, H1=H1.toy, y=y.toy, phi=phi.toy)

      # now cheat: force the hyperparameters to have the correct psi1:
 phi.fix <- phi.change(old.phi=phi.toy,psi1=c(1, 0.5, 1.0, 1.0, 0.5, 0.4),phi.fun=phi.fun.toy)
      # The value for psi1 is obtained by cheating and #examining the source
      # code for computer.model(); see ?phi.change 


      # Create a new toy dataset with 40 observations:
D1.big <- latin.hypercube(40,5)

jj <- create.new.toy.datasets(D1=D1.big , D2=D2.toy)

      # We know that the real coefficients are 4:9 because we
      # we can cheat and look at the source code for computer.model()

      # Now estimate the coefficients without cheating:

beta1hat.fun(D1=D1.big, H1=H1.toy, jj$y, phi=phi.toy)

     # Not bad!



     # We can do slightly better by cheating and using the
     # correct value for the hyperparameters:

beta1hat.fun(D1=D1.big, H1=H1.toy, jj$y,phi=phi.true.toy(phi=phi.toy))

     #marginally worse.


}
\keyword{array}
