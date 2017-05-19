best <- function(stateinput, outcomes){


if (length(stateinput) != 1 || sum(outcome$State == stateinput) <= 0){
  
  stop("invalid state")
  
}

if (length(outcomes) != 1 || sum(outcomes == c("heart attack", "heart failure", "pneumonia")) != 1){
  
  stop("invalid outcome")
  
}
  
 return(NULL)
  
}