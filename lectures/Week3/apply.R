## apply - used to a evaluate functions over the margins of an array
# most often used to apply a function to the rows or columns of a matrix

str(apply)

x<- matrix(rnorm(200), 20, 10)
x

# dimension 1 has 20 rows, dimension 2 has 10 columns
# "2" means you want to eliminate "rows" while retaining "columns"
apply(x, 2, mean)

# preserve all the rows, but collapse the columns - sum of the rows
apply(x, 1, sum)

# alternative *highly optimized* functions for matrix dimensions
rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)

# quantiles
x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))

# array of matrices
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
a
# preserve first and second dimension but collapse the third one
apply(a, c(1,2), mean)
# another way
rowMeans(a, dims = 2)
