\name{MH}
\alias{MH}
\title{Very basic implementation of the Metropolis-Hastings algorithm}
\description{
  Very basic implementation of the Metropolis-Hastings algorithm using a
  multivariate Gaussian proposal distribution.   Useful for sampling
  from \code{p.eqn8.supp()}.
}
\usage{
MH(n, start, sigma, pi)
}
\arguments{
  \item{n}{Number of samples to take}
  \item{start}{Start value}
  \item{sigma}{Variance matrix for kernel}
  \item{pi}{Functional proportional to the desired sampling pdf}
}
\details{
  This is a \strong{basic} implementation.  The proposal
  distribution~\eqn{q(X|Y)} is
  \eqn{q(\cdot|X)=N(X,\sigma^2)}{q(.|X)=N(X,sigma^2)}
}
\value{
  Returns a matrix whose rows are samples from \eqn{\pi()}{pi()}.  Note
  that the first few rows will be \dQuote{burn-in}, so should be
  ignored
}
\references{
  \itemize{
    \item W. R. Gilks et al 1996. \emph{Markov Chain Monte Carlo in
      practice}.  Chapman and Hall, 1996.    ISBN 0-412-05551-1
    \item N. Metropolis and others 1953. \emph{Equation of state
      calculations by fast computing machines}.  The Journal of Chemical
    Physics, volume 21, number 6, pages 1087-1092
  }
}
\author{Robin K. S. Hankin}
\note{
  This function is a little slow because it is not vectorized.
}
\seealso{\code{\link{p.eqn8.supp}}}
\examples{
# First, a bivariate Gaussian:
A <- diag(3) + 0.7
quad.form <- function(M,x){drop(crossprod(crossprod(M,x),x))}
pi.gaussian <- function(x){exp(-quad.form(A/2,x))}
x.gauss <- MH(n=1000, start=c(0,0,0),sigma=diag(3),pi=pi.gaussian)
cov(x.gauss)/solve(A) # Should be a matrix of 1s.


# Now something a bit weirder:
pi.triangle <- function(x){
  1*as.numeric( (abs(x[1])<1.0) & (abs(x[2])<1.0) ) +
  5*as.numeric( (abs(x[1])<0.5) & (abs(x[2])<0.5) ) *
    as.numeric(x[1]>x[2])
}
x.tri <- MH(n=100,start=c(0,0),sigma=diag(2),pi=pi.triangle)
plot(x.tri,main="Try with a higher n")


# Now a Gaussian mixture model:
pi.2gauss <- function(x){
  exp(-quad.form(A/2,x)) +
  exp(-quad.form(A/2,x+c(2,2,2)))
}
x.2 <- MH(n=100,start=c(0,0,0),sigma=diag(3),pi=pi.2gauss)
\dontrun{p3d(x.2, theta=44,d=1e4,d0=1,main="Try with more points")}


}
\keyword{array}
