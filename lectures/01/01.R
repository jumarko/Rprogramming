
## Reading Tabular Data

data <- read.table("foo.txt")
data
classes <- sapply(data, class)
classes


## Textual formats - dump, dput

# dump and dput preserves metadata -> another user doesn't have to specify it all over again
dput(data)
dput(data, file="data.R")
dget("data.R")

# dump can be used on multiple objects
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "dump.R")
rm(x,y)
source("dump.R")


## Interfaces to the outside world

# file, gzfile, gzfile, url
str(file)
con <- file("foo.txt", "r")
data <- read.csv(con)
readLines(con)
close(con)
data

# reading from url
con <- url("http://jhsph.edu", "r")
x <- readLines(con)
head(x)



## Subsetting

x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
# using logical index
x[x > "a"]
u <- x > "a"

### Subsetting Lists

x <- list(foo = 1:4, bar = 0.6)
# list the contains sequence 1 2 3 4
x[1]
# sequence 1 2 3 4
x[[1]]
# using name
x$bar
x["bar"]
x[["bar"]]

# extracting multiple elements of list
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1,3)]

# [[ operator can be used with computed indices, $ can only be used with literal names
name <- "foo"
x[[name]]

#### Subsetting nested elements of a list
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1,3)]]


### Subsetting a Matrix

x <- matrix(1:6, 2, 3)
# x[row, col]
x[1, 2]
# you can get 1 x 1 matrix
x[1, 2, drop = FALSE]

x[1,]
x[1, , drop = FALSE]

### Subsetting with Names

x <- list(aardvark = 1:5)
# $ operator does partial matching - element(s) starting with "a"
x$a
# [[ operator expects exact match
x[["a"]]
# this behavior can be changed
x[["a", exact = FALSE]]

# partial matching on multiple elements doesn't work!
# -> is there any other option?
y <- list(aaa = 1, aab = 2, ba = 3)
y[["a", exact = FALSE]]



## Removing NA Values

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

#Multiple objects
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
# or: y <- c("NA", "b", NA, "d", NA, "NA")
good <- complete.cases(x, y)
x[good]
y[good]

# removing NA values from data frames
airquality[1:6,]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]



## Vectorized operations

x <- 1:4; y <- 6:9
#You can add things in parallel (not having to looping through vectors)
x + y
x > 2
x >= 2
y == 8
x * y
x / y
# Even vectors with different lengths can be sum up
x <- 1:4
y <- 2:3
x + y

### Vectorized Matrix Operations
x <- matrix(1:4, 2, 2)
y <- matrix(rep(10,4), 2, 2)
x
y
x * y 
# true matrix multiplication
x %*% y



## swirl = "Statistics with interactive R learning"
# Interactive learning with practicing while going