# Suppose we want to simulate from the follwoing linear model
#     y = b_0 + b_1 x + e
# where e ~ N(0,2^2). Assume x ~ N(0,1^2), b_0 = 0.5, b_1 = 2

set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
# XXX: plot doesn't work
plot(x, y)

# What if x is binary? (e.g. representing gender)
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)


# Generalized linear model - simulate from a Poisson model where
# Y ~ Poisson(u)
# log u = b0 + b1 x
# b0 = 0.5 b1 = 0.3
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)
