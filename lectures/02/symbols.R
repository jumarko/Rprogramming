## Symbol Binding

### Binding value to symbol
lm <- function(x) { x * x}
lm

# 1. Search the global environment for a symbol name matching the one request
# 2. [If no match] Search the namespaces of each package on the search list

# When a user load a package with library the namespace of that package gets up in position 2 of the search lists

# Seperate namespaces for objects and functions

### Lexical scoping

# z is a "free" variable - What values should be assigned to it?
f <- function(x, y) {
  x^2 + y / z
}
# the values of free variables are searched for in the env. in which the function was defined
# env. is a collection of (symbol, value) pairs

# function + environment == closure

# You can have functions defined inside other functions
# In this case the environment in which a function is defined 
# is the body of other function!
make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}
cube <- make.power(3)
cube(4)

# What's in function's env?
ls(environment(cube))
get("n", environment(cube))

### Lexical vs. Dynamic Scoping
y <- 10

f <- function(x) {
  y <- 2
  y^2 + g(x)
}

g <- function(x) {
  x*y
}

f(3) == 34 # because g is defined outside the f
# With dynamic scoping the value of y would looked up in the env
# from which the function was called ("calling environmen")

# if function si defined in global env and called from env
# then lexical scoping and dynamic scoping are the same
g <- function(x) {
  a <- 3
  x + a + y
}
g(2)
y <- 3
g(2)

# As a consequence of lexical scoping, all object must be stored in memory
# In S-PLUS, all the functions are defined in global env.