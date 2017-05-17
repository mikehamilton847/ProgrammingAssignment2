## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(cacheMatrix) {
  inverseCacheMatrix <<- NULL
  set <- function(m) {
    inverseCacheMatrix <<- NULL
    cacheMatrix <<- m
  }
  get <- function() cacheMatrix
  setInverse <- function(invertedMatrix) inverseCacheMatrix <<- invertedMatrix
  getInverse <- function() inverseCacheMatrix
  list(set=set, get=get,setInverse=setInverse,getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(localMatrix, ...) {
        ## Return a matrix that is the inverse of 'x'
  invertedMatrix <- localMatrix$getInverse()
  if (!is.null(invertedMatrix)) {
    message("Getting cached data")
    return(invertedMatrix)
  }
  localData <-localMatrix$get()
  #invertedMatrix <- solve(localData)
  localMatrix$setInverse(solve(localData))
}
