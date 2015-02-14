# Dates are represented by the Date class
# -> internally stored as the number of days since 1970-01-01
# Times are represented by the POSIXct (very large integer) 
#                       or the POSIXlt (list containing other info too)
# -> internally stored as the number of seconds since 1970-01-01

x <- as.Date("1970-01-01")
x
unclass(x)
class(x)
unclass(as.Date("1970-01-02"))

# generic functions
x <- Sys.time()
weekdays(x)
months(x)
quarters(x)

p <- as.POSIXlt(x)
names(unclass(p))
p$sec
p$yday

unclass(x)

# Formatting
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x < strptime(datestring, "%B %d %Y %H:%M")
class(x)

# Mathematical ops on dates & times can be used
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y
as.POSIXlt(x)-y

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "UTC")
y-x
