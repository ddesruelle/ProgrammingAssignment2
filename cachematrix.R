## These functions compute the inverse of a matrix, using a cache.

## To compute the inverse of matrix m, create a special matrix sm
## with sm <- makeCacheMatrix(m) and pass sm to cacheSolve(). 

## When the matrix m is changed, update the special matrix sm 
## with the command sm$set(m) and computes the inverse with cacheSolve(sm)

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    
    set <- function(new_matrix) {
        x <<- new_matrix
        inverse <<- NULL
    }
    
    get <- function() x
    
    setinverse <- function(new_inverse) inverse <<- new_inverse
    
    getinverse <- function() inverse
    
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## This function computes the inverse of the special matrix returned by makeCacheMatrix. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then cacheSolve retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {
    inverse <- x$getinverse()
    if(!is.null(inverse)) {
        message("getting cached inverse")
        return(inverse)
    }
    data <- x$get()
    inverse <- solve(data, ...)
    x$setinverse(inverse)
    inverse
}
