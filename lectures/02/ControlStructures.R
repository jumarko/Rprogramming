## Control Structures 

# control structures are useful for writing programs, 
# not especially the command line (*apply functions)


### if-else
x <- 3
y <- 10
if (x > 3) {
  y <- 10
} else {
  y <- 0
}
y


### for loops

for (i in 1:10) {
  print(i)
}

x <- c("a", "b", "c", "d")
for (i in 1:4) {
  print(x[i])
}

# same as previous
for(i in seq_along(x)) {
  print(x[i])
}

# and again
for(letter in x) {
  print(letter)
}

# Nested for loop
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}


### while loop

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}

# random walk
z <- 5
while(z >= 3 && z <= 10) {
  print(z)
  
  # flip the fair coin
  coin <- rbinom(1, 1, 0.5)
  
  if(coin == 1) {
    z <- z + 1
  } else {
    z <- z - 1
  }  
}


### repeat - initiates infinite loop, the only to exit is to call break
x0 <- 1
tol <- 1e-8
repeat {
  # computeEstimate is not a real function!!
  x1 <- computeEstimate()
  if (abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}
# previous loop is dangerous, the better approach
# is to set a hard limit after which the loop break


## next, return
for(i in 1:100) {
  if (i <= 20) {
    # skip the first 20 iterations
    next
  }
  # Do something here
  print(i)
}

