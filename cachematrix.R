
## 4 things to do:
## set the value of matrix
## get the value of matrix
## set the inverse value of matrix
## get the inverse value of matrix

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {	## set the value of matrix
		x <<- y		## superassignment
		inv <<- NULL	## superassignment
	}
	get <- function() x	## get the value of matrix
	setinverse <- function(inverse) inv <<- inverse	## set the inverse value of matrix
	getinverse <- function() inv			## get the inverse value of matrix
	list(set=set, get=get, 
	setinverse=setinverse, 
	getinverse=getinverse)
}

## get the inverse value of matrix
## if inv already has a value, return this cached value and finish function
## otherwise, get matrix and solve it
## put this as the inverse value, and return it
## Condition: the metrix should be convertible
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inv <- x$getinverse()
	if(!is.null(inv)) {
		message("getting cached data.")
		return(inv)
	}
	data <- x$get()
	inv <- solve(data)
	x$setinverse(inv)
	inv
}

## test run
##> set.seed(1)
##> n = rnorm(100)
##> x = matrix(n, nrow=5, ncol=5)
##> m = makeCacheMatrix(x)
##> m$get()
##           [,1]       [,2]       [,3]        [,4]        [,5]
##[1,] -0.6264538 -0.8204684  1.5117812 -0.04493361  0.91897737
##[2,]  0.1836433  0.4874291  0.3898432 -0.01619026  0.78213630
##[3,] -0.8356286  0.7383247 -0.6212406  0.94383621  0.07456498
##[4,]  1.5952808  0.5757814 -2.2146999  0.82122120 -1.98935170
##[5,]  0.3295078 -0.3053884  1.1249309  0.59390132  0.61982575
##> cacheSolve(m)
##          [,1]       [,2]       [,3]       [,4]       [,5]
##[1,]  1.454738  1.3840962 -0.3498497  0.9940760 -0.6707848
##[2,] -7.417680 -3.4830201 -0.1112810 -3.4591743  4.3038870
##[3,] -7.660864 -4.6016852 -0.4135901 -3.7590216  5.1500421
##[4,]  1.405882  0.4923485  0.5354575  0.8106457 -0.1683125
##[5,]  8.128682  5.4280210  0.3687256  3.8127630 -5.0951330
##> cacheSolve(m)
##getting cached data.
##          [,1]       [,2]       [,3]       [,4]       [,5]
##[1,]  1.454738  1.3840962 -0.3498497  0.9940760 -0.6707848
##[2,] -7.417680 -3.4830201 -0.1112810 -3.4591743  4.3038870
##[3,] -7.660864 -4.6016852 -0.4135901 -3.7590216  5.1500421
##[4,]  1.405882  0.4923485  0.5354575  0.8106457 -0.1683125
##[5,]  8.128682  5.4280210  0.3687256  3.8127630 -5.0951330

