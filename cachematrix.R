## Function to keep track of current matrix, its inverse and to return information about the same

makeCacheMatrix <- function(cacheMatrix) {
  #init inverse
    inverseCacheMatrix <<- NULL
    #set matrix
  set <- function(m) {
    inverseCacheMatrix <<- NULL
    cacheMatrix <<- m
  }
  #return matrix
  get <- function() cacheMatrix
  #set inverse matrix value
  setInverse <- function(invertedMatrix) inverseCacheMatrix <<- invertedMatrix
  #get cached inverse
  getInverse <- function() inverseCacheMatrix
  list(set=set, get=get,setInverse=setInverse,getInverse=getInverse)
}


## Function to print an inverted matrix uses makeCacheMatrix

cacheSolve <- function(localMatrix, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  
  #Get cached matrix
  invertedMatrix <- localMatrix$getInverse()
  if (!is.null(invertedMatrix)) {
    #if there is a cached matrix, message and return the inverse
    message("Getting cached data")
    return(invertedMatrix)
  }
  #get current matrix
  localData <-localMatrix$get()
  #invert the matrix and save it to the cache
  localInvertedMatrix = solve(localData)
  localMatrix$setInverse(localInvertedMatrix)
  localInvertedMatrix
}