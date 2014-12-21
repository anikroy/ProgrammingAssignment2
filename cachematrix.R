## I literally just changed the "mean" from the sample cache function
## and just switched it to a "solve. And changed function names to be more fitting
##pretty simple assignment.


makeCacheMatrix <- function(x = matrix()) {

  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) m <<- inverse
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


cacheSolve <- function(x, ...) {
  
  
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
  ## Returns a matrix that is the inverse of 'x'
}


#succesful test

B <- matrix(c(1,2,3,5), nrow=2, ncol=2)
BB <- makeCacheMatrix(B)
cacheSolve(BB)
