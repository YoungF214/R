## Below two functions are used to create a special object that stores a matrix and caches its inverse. 

## makeCacheMatrix creates a special "matrix" object that can cache its inverse. 
makeCacheMatrix <- function(x = matrix()) {
		inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}

## cacheSolve computes the inverse of the special "matrix" created with the above function. 
## If the inverse has already been ccomputed, it gets the inverse from cache
## and skips the computation. Otherwise, it computes and sets the value of the inverse
## in the cache via the setinverse function. 
cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv  ## Return a matrix that is the inverse of 'x'
}

## Computing the inverse of a square matrix can be done with the solve function in R.
## square_matrix <- makeCacheMatrix(matrix(10:13, 2, 2))
## square_matrix$get()
##     [,1] [,2]
## [1,]   10   12
## [2,]   11   13
## square_matrix$getinverse()
## NULL
## cacheSolve(square_matrix)
##     [,1] [,2]
## [1,] -6.5    6
## [2,]  5.5   -5
## cacheSolve(square_matrix)
## getting cached data
##     [,1] [,2]
## [1,] -6.5    6
## [2,]  5.5   -5
## square_matrix$getinverse()
##     [,1] [,2]
## [1,] -6.5    6
## [2,]  5.5   -5

