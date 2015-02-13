mydata <- subset(data, Ozone > 31 & Temp > 90)
mean(mydata$Solar.R)

mydata2 <- subset(data, Month == 5)
max(mydata2$Ozone, na.rm = T)

logv <- data$Ozone > 31 & data$Temp > 90
data[logv]

# Another approach is to use logical vector
data[data$Ozone > 31 & data$Temp > 90, ]