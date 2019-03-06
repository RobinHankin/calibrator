require(calibrator, quietly=TRUE)
require(emulator, quietly=TRUE)

"D1.toy" <- 
structure(c(
            0.5625, 0.9375, 0.3125, 0.1875, 0.4375, 0.8125, 0.0625, 0.6875,
            0.4375, 0.8125, 0.9375, 0.5625, 0.3125, 0.1875, 0.0625, 0.6875,
            0.0625, 0.6875, 0.9375, 0.3125, 0.5625, 0.4375, 0.8125, 0.1875,
            0.1875, 0.6875, 0.3125, 0.8125, 0.0625, 0.4375, 0.9375, 0.5625,
            0.0625, 0.9375, 0.4375, 0.5625, 0.3125, 0.1875, 0.6875, 0.8125
            ),
          .Dim = as.integer(c(8, 5)),
          .Dimnames = list(c("code.1", "code.2", "code.3", "code.4", "code.5", "code.6", "code.7", "code.8"),
            c("x", "y", "A", "B", "C")),
          comment = "Each line has two variable inputs and three parameter values"
          )

"D2.toy" <- 
structure(c(0.5, 0.9, 0.3, 0.1, 0.7, 0.7, 0.3, 0.1, 0.9, 0.5), .Dim = as.integer(c(5, 
2)), .Dimnames = list(c("obs.1", "obs.2", "obs.3", "obs.4", "obs.5"
), c("x", "y")), comment = "x and y values at which observations are made")
 
"x.toy" <- 
structure(c(0.5, 0.6), .Names = c("x", "y"))

"x.toy2" <- 
structure(c(0.72, 0.82), .Names = c("x", "y"))

"x.vec" <-
structure(c(0.5, 3, 0.5, 0.6, 3, 0.6), .Dim = c(3, 2), .Dimnames = list(c("point.1", "point.2", "point.3"), c("x", "y")))



jj <- create.new.toy.datasets(D1.toy,D2.toy)
"y.toy" <- jj$y.toy
"z.toy" <- jj$z.toy
"d.toy" <- jj$d.toy

"theta.toy" <- 
structure(as.integer(c(1, 2, 3)), .Names = c("A", "B", "C"))


## Now define some jj* variables that go into phi.toy():
jj.psi1 <- c(1.1, 1.2, 1.3, 1.4, 1.5, 3.9)
names(jj.psi1) <- c("x", "y", "A", "B", "C","sigma1squared")

jj.psi1.apriori.mean <- rep(1,6)
names(jj.psi1.apriori.mean) <- names(jj.psi1)
jj.psi1.apriori.sigma <- (1+9*diag(6))/80
rownames(jj.psi1.apriori.sigma) <- names(jj.psi1)
colnames(jj.psi1.apriori.sigma) <- names(jj.psi1)
jj.psi1.apriori <- list(mean=jj.psi1.apriori.mean,sigma=jj.psi1.apriori.sigma)

jj.psi2 <- c(2.1 , 2.2 , 1.555)
names(jj.psi2) <- c("x", "y","sigma2squared")

jj.psi2.apriori.mean <- rep(1.33,5)
names(jj.psi2.apriori.mean) <- c("rho","lambda",names(jj.psi2))
jj.psi2.apriori.sigma <- (0.2+6*diag(5))/80
rownames(jj.psi2.apriori.sigma) <- names(jj.psi2.apriori.mean)
colnames(jj.psi2.apriori.sigma) <- names(jj.psi2.apriori.mean)
jj.psi2.apriori <- list(mean=jj.psi2.apriori.mean,sigma=jj.psi2.apriori.sigma)

jj.theta.apriori.mean <- c(8,0,6)/10
names(jj.theta.apriori.mean) <- LETTERS[1:3]
jj.theta.apriori.sigma <- 10*matrix(c(10,2,0,2,10,0,0,0,10),3,3)
rownames(jj.theta.apriori.sigma) <- LETTERS[1:3]
colnames(jj.theta.apriori.sigma) <- LETTERS[1:3]
jj.theta.apriori <- list(mean=jj.theta.apriori.mean, sigma=jj.theta.apriori.sigma)

"phi.toy" <- 
phi.fun.toy(rho = 1,
            lambda = 2,
            psi1 = jj.psi1,
            psi1.apriori = jj.psi1.apriori,
            psi2 = jj.psi2,
            psi2.apriori = jj.psi2.apriori,
            theta.apriori = jj.theta.apriori)


"V.toy" <- 
structure(c(14.9142207582054, 12.0025896265835, 12.2767044775853, 
14.3957192230814, 13.0749342962983, 11.2810847663213, 15.2697419069014, 
12.2318708062859, 8.9378414078391, 12.8919425660406, 11.1695815919918, 
12.0159738957503, 15.9760869003541, 10.9555602796654, 11.6959105710155, 
12.7117960625486, 8.03151093903154, 10.5269607521254, 17.1940931737214, 
10.3137300693957, 13.1533815046953, 13.6889520237998, 12.7966858710281, 
12.0506477479864, 14.6135757335225), .Dim = as.integer(c(5, 5
)), .Dimnames = list(c("obs.1", "obs.2", "obs.3", "obs.4", "obs.5"
), c("obs.1", "obs.2", "obs.3", "obs.4", "obs.5")))

"t.vec.toy" <- 
structure(c(0.0625, 0.6875, 0.9375, 0.3125, 0.5625, 0.4375, 0.8125, 
0.1875, 0.1875, 0.6875, 0.3125, 0.8125, 0.0625, 0.4375, 0.9375, 
0.5625, 0.0625, 0.9375, 0.4375, 0.5625, 0.3125, 0.1875, 0.6875, 
0.8125), .Dim = as.integer(c(8, 3)), .Dimnames = list(c("code.1", 
"code.2", "code.3", "code.4", "code.5", "code.6", "code.7", "code.8"
), c("A", "B", "C")))


jj.xdist.mean <- rep(0.5,2)
names(jj.xdist.mean) <- c("x","y")
jj.xdist.var <- 0.05+diag(c(0.1,0.1))
rownames(jj.xdist.var) <- c("x","y")
colnames(jj.xdist.var) <- c("x","y")

"X.dist.toy" <- list(mean=jj.xdist.mean,var=jj.xdist.var)

rm(list=ls(pattern="jj*"))

