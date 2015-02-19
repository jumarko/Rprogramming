## mapply
# multivariate apply of sorts which applies a function in parallel over a set of arguments
# can take multiple lists as arguments
str(mapply)

list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
# above is the same as following
mapply(rep, 1:4, 4:1)

# vectorizing a function
noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
}
noise(5, 1, 2)
# doesn't work with vectors
noise(1:5, 1:5, 2)

# can be fixed with mapply
mapply(noise, 1:5, 1:5, 2)

# and this is the same as
list(noise(1, 1, 2),
     noise(2, 2, 2),
     noise(3, 3, 2),
     noise(4, 4, 2),
     noise(5, 5, 2))