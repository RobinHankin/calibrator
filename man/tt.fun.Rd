\name{tt.fun}
\alias{tt.fun}
\alias{ht.fun}
\alias{hh.fun}
\alias{t.fun}
\title{Integrals needed in KOH2001}
\description{
  Calculates the three integrals needed for \code{V}, under the
  restrictions specified in the KOH2001 supplement
}
\usage{
tt.fun(D1, extractor, x.i, x.j,  test.for.symmetry=FALSE, method=1, phi)
ht.fun(x.i, x.j, D1, extractor,  Edash.theta,  H1, fast.but.opaque=TRUE,
x.star=NULL, t.vec=NULL, phi) 
hh.fun(x.i, x.j,  H1, E.theta,  phi)
t.fun(x, D1, extractor,  phi) 
}
\arguments{
  \item{D1}{Matrix of code run points}
  \item{H1}{regression basis functions for \code{D1}}
  \item{extractor}{Function to extract \code{x.star} and \code{t.vec}
    from \code{D1}}
  \item{x}{Lat and long of a point in \code{t.fun()} (eg \code{D2[1,]})}
  \item{x.i}{Lat and long of first point (eg \code{D2[1,]})}
  \item{x.j}{Lat and long of second point (eg \code{D2[2,]})}
  \item{theta}{parameters}
  \item{Edash.theta}{Function to return expectation of \code{H} with respect
    to the alternative distribution of \eqn{\theta}{theta};
    \code{Edash.theta.toy} is the example for the toy dataset}
  \item{E.theta}{Function to return expectation of \code{H} with respect
    to \eqn{\theta}{theta}}
  \item{test.for.symmetry}{In \code{tt.fun()}, Boolean with \code{TRUE}
    meaning to calculate each element of \eqn{C}{C} explicitly.  If
    \code{FALSE}, then calculate only the elements of \eqn{C}{C} that
    lie on or over the diagonal and use the fact that \eqn{C}{C} is
    symmetric to calculate the other matrix elements.  For \eqn{n}{n}
    observations, this means \eqn{n(n+1)/2}{n(n+1)/2} evaluations,
    compared with \eqn{n^2}{n^2} for the full case.
    
    Set this argument to \code{TRUE} only when debugging, or testing
    accuracy.}
  \item{fast.but.opaque}{In \code{ht.fun()}, Boolean with default
    \code{TRUE} meaning to pass some precalculated results as
    arguments, to save time.  Set this argument to \code{FALSE} only
    when debugging.}
  \item{x.star}{In \code{ht.fun()}, value of \eqn{x^*}{xstar} (required
    only if \code{fast.but.opaque} is \code{TRUE})}
  \item{t.vec}{In \code{ht.fun()}, value of \eqn{t}{t} (required
    only if \code{fast.but.opaque} is \code{TRUE})}
  \item{method}{In \code{tt.fun()}, zero means use the old method and
    nonzero means use the new method.  The new method is faster, but
    the code is harder to understand.  The two methods should give
    identical results.}
  \item{phi}{Hyperparameters}
}
\details{
The four functions return integrals representing means taken over
\code{theta}.  To wit:
\itemize{
\item Function \code{tt.fun()} evaluates \deqn{\int
  t(x_j,\theta)t(x_i,\theta)^Tp(\theta)d\theta}{int
  t(x_j,\theta)t(x_i,\theta)^T p(theta) d(theta)}  and is used in
\code{V.fun()}.  Note that this function is symmetric in \eqn{x_i}{x_i}
and \eqn{x_j}{x_j}.
\item Function \code{ht.fun()} evaluates \deqn{\int
  h_1(x_j,\theta)t(x_i,\theta)^Tp(\theta)d\theta}{int
  h_1(x_j,\theta)t(x_i,\theta)^T p(theta) d(theta)} and is used in
\code{V.fun()}.  Note that this function is \strong{not} symmetric in
\eqn{x_i}{x_i} and \eqn{x_j}{x_j}.
\item Function
\code{hh.fun()} evaluates \deqn{\int
  h_1(x_j,\theta)h_1(x_i,\theta)^Tp(\theta)d\theta}{int
  h_1(x_j,\theta)h_1(x_i,\theta)^T p(theta) d(theta)} and is used in
\code{V.fun()}.  Note that this function is symmetric in \eqn{x_i}{x_i}
and \eqn{x_j}{x_j}.
\item Function \code{t.fun()} evaluates
\deqn{\int
  t(x_i,\theta)^Tp(\theta)d\theta=
  \int c_1\left( (x_i,\theta),(x_j^*,t_j)\right)p(\theta)\,d\theta
}{int  t(x_i,\theta)^T p(theta) d(theta)}
using the formula \deqn{
  \sigma_1^2\left|I+2V_\theta\Omega_x\right|^{-1/2}
  \exp\left\{
  -\left(x_i-x_j^*\right)^T\Omega_x\left(x_i-x_j^*\right)
  \right\}\times
  \exp\left\{
  -\left(m_\theta-t_j\right)^T
  \left(2V_\theta+\Omega_t^{-1}\right)^{-1}
  \left(m_\theta-t_j\right)\right\}.
}{
  <omitted; see pdf>
}
It is used in \code{Ez_eq7.supp()}.  NB: do not confuse
this function with \code{tee()}, which is different.
}

These functions are not generally of much interest to the end user; they
are called by \code{V.fun()}.  They are defined separately as a
debugging aid, and to simplify the structure of \code{V.fun()}.
}
\value{
Each function returns a matrix as described in KOH2001
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
\seealso{\code{\link{V.fun}}}
\examples{
data(toys)

tt.fun(D1=D1.toy, extractor=extractor.toy, x.i=D2.toy[1,],
    x.j=D2.toy[2,],  phi=phi.toy)

ht.fun(x.i=D2.toy[1,], x.j=D2.toy[2,], D1=D1.toy,
    extractor=extractor.toy, 
    Edash.theta=Edash.theta.toy, H1=H1.toy, fast.but.opaque=FALSE, phi=phi.toy)

ht.fun(x.i=D2.toy[1,], x.j=D2.toy[2,], D1=D1.toy,
    extractor=extractor.toy, 
    Edash.theta=Edash.theta.toy, H1=H1.toy, fast.but.opaque=TRUE,
    x.star=extractor.toy(D1.toy)$x.star, t.vec=extractor.toy(D1.toy)$t.vec,
    phi=phi.toy)



hh.fun(x.i=D2.toy[1,], x.j=D2.toy[2,],
    H1=H1.toy, E.theta=E.theta.toy,  phi=phi.toy)

t.fun(x=x.toy, D1=D1.toy, extractor=extractor.toy, phi=phi.toy)
}
\keyword{array}
