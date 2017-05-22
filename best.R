best <- function(state, outcome){

        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

## Define the outcome name. Input should be limited to this
        outcomename <- c("heart attack", "heart failure", "pneumonia")

## control my input. outcome should be limited to "outcomename".
## state should be limited to the state name in the csv file
        if (length(state) != 1 || sum(data$State == state) <= 0){
                stop("invalid state")
}

        if (length(outcome) != 1 || sum(outcome == outcomename) != 1){
                stop("invalid outcome")
}

## these 3 columns indicate 30 mortaliry of 3 diseases in the csv you read
        index_stack <- c(11,17,23) 
## This line just turn off warning message appears when there is NA generated.
        options(warn=-1) 
## coerce the 3 column to numeric
        for (i in index_stack) data[[i]] <- as.numeric(data[[i]]) 
## Turn on the warning message function again        
        options(warn=0) 
## Split data by state name and store it
        split_state_outcome <- split(data, data$State)
## Define an empty list. Length of this list equals to "state" number. For storing data after sorting
        split_outcome_sort <- vector(mode = "list", length = length(split_state_outcome))

        for (j in 1:length(split_state_outcome)){
                split_outcome_sort[[j]] <- vector(mode = "list", length = 3) #Define that each element in the list contains 3 nest list (for storing 3 diseases outcome). 
                for (k in 1:3){
                        NA_number <- sum(is.na(split_state_outcome[[j]][index_stack[k]])) #Calculate NA number for certain outcome
  
## Use "order" function to sort data, first by certain outcome value, second by alphabet of hospital name to break tie
                        split_outcome_sort[[j]][[k]] <- split_state_outcome[[j]][order(split_state_outcome[[j]][index_stack[k]], split_state_outcome[[j]][2], na.last = NA), ]
## Bind the data with one column "Rank"
                        split_outcome_sort[[j]][[k]] <- cbind(split_outcome_sort[[j]][[k]], Rank = 1:(dim(split_state_outcome[[j]])[1]-NA_number))
                        }
## Define the name of outcome for sorted data (nested list)
                names(split_outcome_sort[[j]]) <- outcomename
                }
## Define the name of state for sorted data
        names(split_outcome_sort) <- names(split_state_outcome)
## Generate a data.frame to store information based on the input.        
        infor_output <- split_outcome_sort[[state]][[outcome]]
## Generate output, row 1 indicate the "best" outcome, column 2 indicate hospital name
        result <- infor_output[1, 2]
        return(result)
        }



