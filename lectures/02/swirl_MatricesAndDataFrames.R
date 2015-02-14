my_vector <- 1:20
dim(my_vector) # vector doesn't have a `dim` attribute
# but has a length
length(my_vector)

# we can give the vector a `dim` attribute
dim(my_vector) <- c(4,5)
# we can check it via "attributes" function as well
attributes(my_vector)

# Now, my_vector isn't a vector anymore - it's a matrix!
my_vector
class(my_vector)
my_matrix <- my_vector

my_matrix2 <- matrix(1:20, 4, 5)
# Both matrix are actualy identical
identical(my_matrix, my_matrix2)

# names of patients
patients <- c("Bill", "Gina", "Kelly", "Sean")

# Matrixes can contain only one class of data, therefore the combining will lead to "all strings" matrix
cbind(names, my_matrix)

my_data <- data.frame(patients, my_matrix)

# names of all columns
> cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames