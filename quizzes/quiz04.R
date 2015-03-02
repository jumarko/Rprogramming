# Q1
set.seed(1)
rpois(5, 2)

# Q5
set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e

# Q6
rbinom(4, 10, 0.3)

# Q8
library(datasets)
y <- 10
x1 <- 20
x2 <- 30
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
summaryRprof()
