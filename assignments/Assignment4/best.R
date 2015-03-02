## 2. Finding the best hospital in a state
best <- function(stateAbbr, outcomeName) {
    if (outcomeName != "heart attack" && outcomeName != "heart failure" && outcomeName != "pneumonia") {
        stop("invalid outcome")
    }
        
    outcome <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", stringsAsFactors = FALSE)
    
    if (sum(outcome$State == stateAbbr) < 1) {
        stop("invalid state")
    }
        
    hospitalsInState <- outcome[outcome[, "State"] == stateAbbr, ]
    
    if (outcomeName == "heart failure") {
        findMinRateHospitals(hospitalsInState, hospitalsInState$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    } else if (outcomeName == "heart attack") {
        findMinRateHospitals(hospitalsInState, hospitalsInState$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    } else if (outcomeName == "pneumonia") {
        findMinRateHospitals(hospitalsInState, hospitalsInState$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    }
}

findMinRateHospitals <- function (hospitalsInState, outcomeVector) {
    # convert rates to numeric values, since by default they are the "factors"    
    outcomeInStateAsNumeric <- as.numeric(outcomeVector)        
    
    # find all hospitals with minimal rate
    allMinims <- outcomeInStateAsNumeric == min(outcomeInStateAsNumeric, na.rm = TRUE)
    minRateHospitals <- hospitalsInState[allMinims, "Hospital.Name"]
    # remove NAs
    minRateHospitals <- minRateHospitals[!is.na(minRateHospitals)]
    # order alphabetically and return the first one
    minRateHospitals[order(minRateHospitals)][1]
}

## Checks
best("TX", "heart attack") == "CYPRESS FAIRBANKS MEDICAL CENTER"
best("TX", "heart failure") == "FORT DUNCAN MEDICAL CENTER"
best("MD", "heart attack") == "JOHNS HOPKINS HOSPITAL, THE"
best("MD", "pneumonia") == "GREATER BALTIMORE MEDICAL CENTER"
order(best("NY", "pneumonia"))


