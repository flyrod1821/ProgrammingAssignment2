## This script creates a matrix that is stored in cache memory. 
## The second part of the script creates a function that calculates the inverse of the maxtrix.



makeCacheMatrix <- function(x = matrix()) {
  m <- NULL             ##      Sets m to null if function has not been run
  set <- function(y) {  ##      creates function set that assigns x and m values
        x <<- y         ##      These variables are set to the parent environment in makeCacheMatrix                      
        m <<- NULL                           
                                         
  }
  get <- function() x                    
    setinverse <- function(solve) m <<- solve  
    getinverse <- function() m            
                                             
  list(set = set, get = get,           
       setinverse = setinverse,         ##      Creates list of variable names and 
       getinverse = getinverse)         ##      calculated values
}

cacheSolve <- function(x, ...) {        ##      Pulls the m value from the other function
        m <- x$getinverse()            ##     environment to this environment         
                                      
        if(!is.null(m)) {               ##      Tests to see if function has been run previously 
                                     
        message("getting cached data")
        return(m)
  }
        data <- x$get()                      
                                     
                                     
        m <- solve(data, ...)              
                                    
        x$setinverse(m)                   
                                     
        m                            ##         returns the inverse of the matrix   
}

