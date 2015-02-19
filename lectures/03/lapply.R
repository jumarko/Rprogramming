lapply
# always return a list
# coerce the first arg if it's not a list

x <- list (a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100,5))
lapply(x, mean)

x <- 1:4
# runif generates given number of uniform random numbers
lapply(x, runif)

x <- 1:4
lapply(x, runif, min = 0, max = 10)

# lapply and friends make heavy use of anonymous functions
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
# Extract first column from matrices
lapply(x, function(elt) elt[,1])
# you can use curly braces as well:
lapply(x, function(elt) { elt[,1] })



## sapply - simlify the result
# if the result is the list where every lement is lenght 1, then vector is returned
# if the result is a list where every element is a vector of the same lenght > 1, then matrix is returned
# if above rules are not applicable, then list is returned

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
sapply(x, mean)
