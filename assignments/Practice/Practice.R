# Check https://github.com/rdpeng/practice_assignment/blob/master/practice_assignment.rmd
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

list.files("diet_data/")

andy <- read.csv("diet_data/Andy.csv")
head(andy)
length(andy$Day)
# alternatively
dim(andy)
# other commands
str(andy)
summary(andy)
names(andy)

# Andy's starting weight
andy[1, "Weight"]
# and final weight
andy[30, "Weight"]
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[, "Day"] == 30), "Weight"]
subset(andy$Weight, andy$Day == 30)
subset(andy, Day == 30)$Weight

andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]
andy_loss <- andy_start - andy_end
andy_loss

# All at once
list.files()
files <- list.files("diet_data")
files
files[3:5]
# John
head(read.csv(files[3]))
files_full <- list.files("diet_data", full.names = TRUE)
head(read.csv(files_full[3]))

# one big data frame with everybody's data in it
andy_david <- rbind(andy, read.csv(files_full[2]))
head(andy_david)
tail(andy_david)
andy_david[which(andy_david$Day == 25), ]

dat <- data.frame()
for (i in 1:5) {
    dat <- rbind(dat, read.csv(files_full[i]))
}
cumul(dat)
str(dat)
head(dat)

# following will yield NA, because John has NAs
median(dat$Weight)
median(dat$Weight, na.rm = TRUE)

dat_30 <- dat[which(dat[, "Day"] == 30), ]
dat_30
median(dat_30$Weight)

medianWeight <- function (directory, day) {
    full_files <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    for (i in 1:length(full_files)) {
        dat <- rbind(dat, read.csv(full_files[i]))
    }
    print(dat)
    givenDay <- dat[which(dat[, "Day"] == day)]
    median(givenDay$Weight)
}
medianWeight("diet_data/", 30)
