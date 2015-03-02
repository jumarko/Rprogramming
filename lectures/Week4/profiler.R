# figure out why sth. computing takes a long time


# system.time() - evaluates expressions and display proc_time object
# in case of error it measures time until the error occurs
# - elapsed time may be greater than user time if CPU spends a lot of time waiting around 
# - elapsed time may be smaller than the user time if your machine has multiple cores

# multithread BLAS libraries (vecLib/Accelerate, ATLAS, ACML, MKL)
# parallel processing via the "parallel" package

## Using system.time()
system.time(readLines("http://www.jhsph.edu"))

hilbert <- function(n) {
    i <- 1:n
    1 / outer(i - 1, i, "+")
}
x <- hilbert(1000)
system.time(svd(x))

# timing longer expression
system.time({
    n <- 1000
    r <- numeric(n)
    for (i in 1:n) {
        x <- rnorm(n)
        r[i] <- mean(x)
        
    }
})



## Rprof() starts the profiler in R
# R must be compiled with profiler support (this is usually the case)
# summaryRprof() summarizes the output from Rprof(), otherwise it's not readable
# don't use system.time() and Rprof() together!!!

# profiler keeps track of the function call stack 
# at regularly sampled intervals 0.02 seconds

# $by.total (total time in function) vs $by.self (actual time)

# C or Fortran code is not profiled
