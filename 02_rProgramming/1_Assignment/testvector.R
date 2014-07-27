# By Kevin Ostheimer

# This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x_mat = matrix()) {
  m_inverse <- NULL
  # The constructor x_mat and m_inverse are static
  set <- function(y_mat) {
    x_mat <<- y_mat
    m_inverse <<- NULL
  }
  get <- function() x_mat
  # This function is called from an upper frame
  setInverse <- function(inverse) m_inverse <<- inverse
  getInverse <- function() m_inverse
  # The internal functions are pointed to listvariables
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
# If the inverse has already been calculated
cacheSolve <- function(mat_norm) {
  ## Return a matrix that is the inverse of 'mat_norm'
  m <- mat_norm$getInverse()
  # If is not empty, the inverse is already calculated...
  if(!is.null(m)) {
    message("getting cached data of inverse matrix")
    return(m)
  }
  # Else m is empty, the calculation routine comes here
  data <- mat_norm$get()
  m <- solve(data)
  # Setting the result to the frame of the argument mat_norm
  mat_norm$setInverse(m)
  m # Display the result
}

###############################################################
## Testprocedure for Programming Assignment 2: Lexical Scoping
## Feel free to uncomment ;-)
###############################################################
# zzz<-matrix(rnorm(n = 9,mean = 10,sd = 2),nrow = 3,ncol = 3)
# aaa<-makeCacheMatrix(zzz)
# cacheSolve(aaa)
# cacheSolve(aaa) # This is the proof
