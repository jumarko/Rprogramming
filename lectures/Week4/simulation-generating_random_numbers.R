# functions for probability distributions:
rnorm
dnorm
pnorm
rpois

# for each distribution there are functions that starts with
# "d" for density
# "r" for random number generation
# "p" for cumulative distribution
# "q" for quantile function
# For example dnorm, pnorm, qnorm, rnorm
# Standard distributions like Normal, Poisson, Binomial, Exponentail are supported


# Examples
x <- rnorm(10)
x

# specify "mean" and "standard deviaton"
x <- rnorm(10, 20, 2)


# Setting random number seed with "set.seed" ensures reproducibility
set.seed(1)
rnorm(5)
# if we reset the seed the random numbers are the same
set.seed(1)
rnorm(5)
# => always set seed when doing the simulation


# Generating Poisson data
rpois(10, 1)
rpois(10, 2)
rpois(10, 20)

ppois(2, 2)
