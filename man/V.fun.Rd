\name{V.fun}
\alias{V.fun}
\title{Variance matrix for observations}
\description{
Determines the variance/covariance matrix for the observations and code
run points.
}
\usage{
V.fun(D1, D2, H1, H2,  extractor,
E.theta, Edash.theta, give.answers=FALSE, test.for.symmetry=FALSE, phi)
}
\arguments{
  \item{D1}{Matrix of code run points}
  \item{D2}{Matrix of observation points}
  \item{H1}{Regression function for \code{D1}}
  \item{H2}{Regression function for \code{D2}}
  \item{extractor}{Function to extract \code{x.star} and \code{t.vec}
    from \code{D1}}
  \item{Edash.theta}{Function to return expectation of \code{H} with respect
    to the alternative distribution of \eqn{\theta}{theta};
    \code{Edash.theta.toy} is the example for the toy dataset}
  \item{E.theta}{Expectation of \code{h} WRT theta over the apriori
    distribution.  Note that this function must be updated if \code{h1()} changes.}
  \item{give.answers}{Boolean (defaulting to \code{FALSE}) with
    \code{TRUE} meaning to return a list whose elements are \code{V} and
    its constituent parts, viz \code{line1} to \code{line6}.  This
    argument is used mainly for debugging.}
  \item{test.for.symmetry}{Boolean with \code{TRUE} meaning to
    calculate each element of \eqn{C} explicitly, and default
    \code{FALSE} meaning to calculate only the elements of \eqn{C}
    that lie on or over the diagonal and use the fact that \eqn{C}
    is symmetric to calculate the other matrix elements.  For \eqn{n}
    observations, this means \eqn{n(n+1)/2} evaluations, compared with
    \eqn{n^2} for the full case.  The time saving is considerable, even
    for small matrices.
    
    Set this argument to \code{TRUE} only when debugging, or testing
    accuracy} 
  \item{phi}{Hyperparameters}
}
\details{
  See KOH2001 for full details on page 3 of the supplement
}
\value{
  If \code{give.answers} is the default value of \code{FALSE},
  returns a matrix of covariances for use in \code{p.page4()}.

  If \code{give.answers} is \code{TRUE}, returns a named list of (currently)
  17 elements.  Elements one to six are lines one to six respectively from
  page 3 of the supplement; subsequent lines give intermediate steps in
  the calculation.  The final element is the matrix is the covariances
  as returned when \code{give.answers} is \code{FALSE}.
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
\note{This function takes a long time to run}
\seealso{\code{\link{tt.fun}},\code{\link{p.page4}}}
\examples{
data(toys)
(jj <-V.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, 
  extractor=extractor.toy, 
  Edash.theta=Edash.theta.toy,
  E.theta=E.theta.toy,  phi=phi.toy))


## Now note that V.fun() changes with the PRIOR used for theta:
phi.different.theta <-  phi.change(old.phi=phi.toy,
     theta.apriori.mean=c(100,100,100),phi.fun=phi.fun.toy)
V.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, 
  extractor=extractor.toy, 
  Edash.theta=Edash.theta.toy,
  E.theta=E.theta.toy,  phi=phi.different.theta)
## different!


## Now compare jj above with V.fun() calculated with
## different phi2:

phi.toy.new <- phi.change(phi.fun=phi.fun.toy, old.phi = phi.toy, psi2=c(8,8,8))

V.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, 
  extractor=extractor.toy, 
  Edash.theta=Edash.theta.toy,
  E.theta=E.theta.toy,  phi=phi.toy.new)

## different!



\dontrun{
data(toys)
set.seed(0)
jj <- create.new.toy.datasets(D1=D1.toy , D2=D2.toy)
y.toy <- jj$y.toy
z.toy <- jj$z.toy
d.toy <- jj$d.toy

v.fun <- function(...){V.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, 
     extractor=extractor.toy, Edash.theta=Edash.theta.toy,
     E.theta=E.theta.toy, phi=phi.toy, give=TRUE)}

Rprof(file="~/f.txt");ignore <- v.fun();Rprof(file=NULL)
system("cd ; R CMD Rprof ~/f.txt > ~/ff.txt")
}
}
\keyword{array}
