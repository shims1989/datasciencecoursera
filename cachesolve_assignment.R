makeCacheMatrix <- function(x = numeric()){
  inverse <- NULL
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  get_inverse <- function() inverse
  set_inverse <- function(inv) inverse <<- inv
  list(set = set, get = get, get_inverse = get_inverse, set_inverse = set_inverse)
}

cacheSolve <- function(x){
  inverse <- x$get_inverse()
  if (!is.null(inverse)){
    message("Getting cache inverse matrix!")
    inverse <- x$get_inverse()
    return(inverse)
  }
  data <- x$get()
  if (dim(data)[1] != dim(data)[2]){
    message("No inverse, input must be a square matrix!")
    return()
  }
  
  else if (det(data) == 0){
    message("No inverse, the determinant of matrix should not be equal to 0")
    return()
  
  }
  inverse <- solve(data)
  x$set_inverse(inverse)
  return(inverse)
}