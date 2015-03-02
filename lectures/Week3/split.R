## split
# takes a vector or other objects and splits it into groups determined by a factor or list of factors
str(split)

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)

# common idiom is split followed by an lapply
lapply(split(x, f), mean)
# Notice, that tapply is more compact in this case

# splitting a data frame
library(datasets)
head(airquality)

# calculate the mean of Ozone, Solar.R and Wind in each Month
# 1. split the dataset by month
# 2. calculate the man
# Strictly speaking, the Month is not a factor but can be used in that way
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

# let's simplify the result
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
# remove NAs
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")],
                               na.rm = TRUE))


### splitting on more than one level
# more than one factor
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)
str(split(x, list(f1, f2)))
# Notice that there are some empty levels "num(0)" - can be removed
str(split(x, list(f1, f2), drop = TRUE))
