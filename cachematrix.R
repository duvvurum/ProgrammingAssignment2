# Below are the two funcitons. Function "makeCacheMatrix" will
## create a matrix. cacheSolve will catch the inverse of matrix
#===============================================================
# Below "makeCacheMatrix" function below will creat a special 
##matrix object that will catch the inverse of the matrix
#===============================================================

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m<<- solve
    getsolve <- function()m
    list(set = set,
         get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}

#===========================================================
# "cacheSolve" function below will compute the inverse of 
##the special matrix returned by "makeCacheMatrix".
### However if the inverse matrix has already mean claiculated
####and the matrix has not changed, it will retrive the 
#####inverse from the cache.
#===========================================================

