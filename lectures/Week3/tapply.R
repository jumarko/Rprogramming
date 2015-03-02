## tapply 
# used to apply a function over subsets of a vector.
str(tapply)
# X - list
# INDEX - factor or list of factors
# FUN - function to be applied
x <- c(rnorm(10), runif(10), rnorm(10, 1))
x
f <- gl(3, 10)
f
tapply(x, f, mean)
tapply(x, f, mean, simplify = FALSE)

