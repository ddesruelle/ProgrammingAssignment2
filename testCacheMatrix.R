## Test for cachematrix.R
    ## Computes inverse for matrix m
    v <- runif(4,-10, 10)
    m <- matrix(v, 2, 2)
    sm <- makeCacheMatrix(m)
    inverse <- cacheSolve(sm)
    m
    inverse
    m %*% inverse
    
    ## Shows use of cache for inverse of m
    inverse <- cacheSolve(sm)
    inverse
    
    ## Changes matrix m and recomputes inverse
    v <- runif(9, -10, 10)
    m <- matrix(v, 3, 3)
    sm$set(m)
    inverse <- cacheSolve(sm)
    m
    inverse
    m %*% inverse
    
    ## Shows use of cache for inverse of m
    inverse <- cacheSolve(sm)
    inverse
    