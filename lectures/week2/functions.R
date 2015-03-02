## Functions

add2 <- function(x, y) {
  x + y
}
add2(3,5)

above10 <- function(x) {
  greaterThan10 <- x > 10
  x[greaterThan10]
}
above10(1:20)

# see default value for n
above <- function(x, n = 10) {
  greaterThanN <- x > n
  x[greaterThanN]
}
above(1:20, 10)
# use default 10
above(1:20)

# matrix
columnmean <- function(m, removeNA = TRUE) {
  nc <- ncol(m)
  # initialize empty vector - all zeros
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(m[, i], na.rm = removeNA)
  }
  means
}
columnmean(airquality)
columnmean(airquality, removeNA = FALSE)

# functions are first class objects
class(columnmean)
formals(columnmean)

mydata <- rnorm(100)
mydata
# standard deviation
sd(mydata)

# positional matching and matching by name can be mixed
args(lm)
lm(data = mydata, y - x, model = FALSE, 1:100)

### Argument Matching
# 1. Check for exact match
# 2. Check for partial match
# 3. Check for a positional match

f <- function(a, b = 1, c = 2, d = NULL) {
  # body
}

### Lazy evaluation
# arguments are evaluated only as they are needed

f <- function(a, b) {
  a^2
}
f(2)
f(2, 0/0)

f <- function(a,b) {
  print(a)
  print(b)
}
f(45)

### "..." Argument - variable number of arguments

# often used when extending another function 
# and you don't want to cpy the entier argument list of the original function

myplot <- function(x, y, type = "l", ...) {
  plot(x, y, type = type, ...)
}

# Generic functions
mean
function(x, ...)
UseMethod("mean")

# paste function
args(paste)
# function (..., sep = " ", collapse = NULL)
args(cat)
# function (..., file = "", sep = " ", fill = FALSE, labels = NULL, append = FALSE) 

# Any argument that appears after ... must be named using the full name (no partial matching!)
paste("a", "b", sep = ":")
# VS.
paste("a", "b", se = ":")

