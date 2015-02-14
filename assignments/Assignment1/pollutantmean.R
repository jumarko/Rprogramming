pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    # read all files from given directory
    full_files <- list.files(directory, full.names = TRUE)
    
    data <- readAll(full_files[id])
    mean(data[, pollutant], na.rm = TRUE)
}

#' reads all data from given files and combines them into the single data frame
readAll <- function (files) {
    data <- do.call(rbind, lapply(files, read.csv))
}


