corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    files <- list.files(directory, full.names = TRUE)
    
    correlations <- vector()
    i <- 1
    for (file in files) {
        fileData <- read.csv(file)
        numberOfCompleteCases <- length(which(complete.cases(fileData)))
        if (numberOfCompleteCases > 0 && numberOfCompleteCases >= threshold) {
            nitrate <- fileData[, "nitrate"]
            sulfate <- fileData[, "sulfate"]
            correlations[i] <- cor(nitrate, sulfate, use="complete.obs")
            i <- i + 1
        }        
    }
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    correlations
}