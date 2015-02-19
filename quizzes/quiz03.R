library(datasets)
data(iris)
head(iris)

# What is the mean of "Sepal.Length" for the species virginica
with(iris, tapply(Sepal.Length, Species, mean))


# Continuing with the 'iris' dataset from the previous Question,  what R code 
# returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
names(iris)
apply(iris[, 1:4], 2, mean)
# OR
sapply(split(mtcars$mpg, mtcars$cyl), mean)
# -> others are not correct
apply(iris[, 1:4], 1, mean)
rowMeans(iris[, 1:4])
colMeans(iris)


# mtcars dataset: 
# How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
with(mtcars, tapply(mpg, cyl, mean))
# -> others are not correct
lapply(mtcars, mean)
sapply(mtcars, cyl, mean)
split(mtcars, mtcars$cyl)


# What is the absolute difference between the average horsepower of 4-cylinder cars
# and the average horsepower of 8-cylinder cars?
with(mtcars, tapply(hp, cyl, mean))

82.63636 - 209.21429 
