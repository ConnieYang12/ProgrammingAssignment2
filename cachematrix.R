
## a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  ## Initialize the inverse property
          i <- NULL
  
  ##method to set matrix
        set <- function(y){
          x <<- y
          i <<- NULL
}
  ##method to get matrix      
       get <- function(){
             x   
}
  ##method to set inverse of the matrix
  setinverse <- function(inverse){
         i <<- inverse
  }
  
  ##method to get the inverse
  getinverse <- function(){
        i
  }
  ##return a list of the methods
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
        
}


## Compute the inverse of the special matrix returned by "makeCacheMatrix"
## above. If the inverse has already been calculated (and the matrix has not
## changed), then the "cachesolve" should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
         i <- x$getinverse()
  ##return the inverse if its already set
         if(!is.null(i)){
           message("getting cached data")
           return(i)
         }
         ## Get the matrix from our object
         data <- x$get()
         
         i <- solve(data,...)
         ## Set the inverse to the object
         x$setinverse(i)
         ## Return the matrix
         i
         
         
  
}
