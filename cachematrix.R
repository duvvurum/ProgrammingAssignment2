# Find the two funcitons. "makeCacheMatrix" && "cacheSolve" 
#========================================
    # "makeCacheMatrix" function
#========================================
#This function creats a special matrix object to cache inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL # initiating empty inverse matrix
    set <- function(y){
        x <<- y  # assigning external matrix
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m<<- solve # creating the inverse matrix
    getsolve <- function()m # obtaining the value of m from the environment out side the function
    list(set = set,
         get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}
# end of function "makeCacheMatrix"

#======================================
#         "cacheSolve" function
#======================================
# This funciton returns inverse matrix cached after checking that matrix 'm' is not null and original matrix is not changed.


cacheSolve <- function(x, ...) {
    m <- x$getsolve()  # getting the value of 'm'  
    if(!is.null(m) & identical(x,m)){ # checking that m is not null and matrix is not changed
        message("getting cached inverse") 
        return(m) # printing the inverse of the matrix
    }
    data <- x$get() # read input matrix  to data
    m <- solve(data, ...) # create the inverse of matrix and store in m
    x$setsolve(m)
    m # return inverse matrix stored in 'm'
}
#end of "cacheSolve" function.
