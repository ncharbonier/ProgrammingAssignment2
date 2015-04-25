## This functions create a special matrix to store the inverse cache
## and calculates the inverse

## This function creates the special matrix that has
## the functions to get and set the inverse

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
			x <<- y
			inv <<- NULL
	}
	get <- function() x
	setinverse <- function(solve) inv <<- solve
	getinverse <- function() inv
	list(set = set, get = get,
		 setinverse = setinverse,
		 getinverse = getinverse)
}


## Calculates the inverse of the special matrix

cacheSolve <- function(x, ...) {
	## Return a matrix that is the inverse of 'x'
	inv <- x$getinverse()
	## Check if the inverse has already been calculated
	if (!is.null(inv)){
		message("getting cached data")
        return(inv)
	}
	## If it has not been calculated, calculates the inverse and caches it
	data <- x$get()
	inv <- solve(data)
	x$setinverse(inv)
	inv
}
