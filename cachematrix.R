## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
        ## this function creates a matrix that can cache its inverse
        
makeCacheMatrix <- function(x = matrix()) {
        ## sets the matrix (x) that will be inverted in the
        ## cacheSolve() function
        i <- NULL
        set <- function (y){
                x <<- y
                i <<- NULL
                ## assigns a value to the object in an environment 
                ## that is different from this environment
        }
        get <- function () x
        setinverse <- function (inverse) i <<- inverse
        getinverse <- function () i
        list (set = set, get = get,
              setinverse = setinverse,
              getinverse = getinverse)
        ## makes the return matrix object get and returns original matrix
        ## sets the inverse matrix and assigns the inverse matrix
        ## to the environment
        ## defines the function to return the inverse matrix
}

## Write a short comment describing this function
        ## this function will return the inverse of the 
        ## matrix that was used in makeCacheMatrix()
        ## the inverse will be set in the cache and will be able
        ## to be recalled in future computations to shorten length
        ## of said future computation
cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if (!is.null (i)){
                message ("getting cached data")
                return (i)
                ## returns message and skips calculation if the 
                ## inverse has already been calculated
                ## then will return the inverse from the cache
        }
        data <- x$get()
        i <- inverse (data, ...)
        x$setinverse (i)
        i
        ## returns inverse of the matrix and the inverse is set
        ## in the cache 
}
        ## Return a matrix that is the inverse of 'x'
