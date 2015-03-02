# & operator works on whole vector
TRUE & c(TRUE, FALSE, FALSE)

## && operator works on the first element of the vector
TRUE && c(TRUE, FALSE, FALSE)

# | and || works in a similar way

# All AND operators are evaluated before OR operators
5 > 8 || 6 != 8 && 4 > 3.9

### Functions for dealing with logical expressions
isTRUE(6 > 4)
identical('twins', 'twins')
xor(5 == 6, !FALSE)

# vector of 10 random integers from 1 to 10
ints <- sample(10)

# which function returns the indices that are TRUE
which(ints > 7)

any(ints < 0)
all(ints > 0)