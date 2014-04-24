# Below are the two funcitons. Function "makeCacheMatrix" will
## create a matrix. cacheSolve will catch the inverse of matrix
#===============================================================
# Below "makeCacheMatrix" function below will creat a special 
##matrix object that will catch the inverse of the matrix
#===============================================================
# Begining of "makeCacheMatrix" function
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
#===========================================================
# "cacheSolve" function below will compute the inverse of 
##the special matrix returned by "makeCacheMatrix".
### However if the inverse matrix has already mean claiculated
####and the matrix has not changed, it will retrive the 
#####inverse from the cache.
#===========================================================
# begining of "cacheSolve" function
cacheSolve <- function(x, ...) {
    m <- x$getsolve()  # getting the value of 'm'  
    if(!is.null(m) & identical(x)){ # checking that m is not null and matrix is not changed
        message("getting cached inverse") 
        return(m) # printing the inverse of the matrix
    }
    data <- x$get() # read input matrix  to data
    m <- solve(data, ...) # create the inverse of matrix and store in m
    x$setsolve(m)
    m # return inverse matrix stored in 'm'
}
#end of "cacheSolve" function.