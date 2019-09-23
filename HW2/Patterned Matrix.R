# HW2: Generate patterned matrix
#
# In this exercise, you will write functions to create matrices with indicated patterns.
# Hint: You can create a zero matrix with required dimension first, then alter the matrix.
#
# 1. Write a function `matrix_1(d)` to return a d dimensional square matrix with following pattern:
#    1 0 0 0 ... 0
#    1 2 0 0 ... 0
#    1 2 3 0 ... 0
#    1 2 3 4 ... 0
#    . . . . ... .
#    1 2 3 4 ... d
# 2. Write a function `matrix_2(d)` to return a d dimensional square matrix with following pattern:
#    1 0 0 0  ... 0
#    2 3 0 0  ... 0
#    4 5 6 0  ... 0
#    7 8 9 10 ... 0
#    . . . .  ... .
# 3. Write a function `matrix_3(d)` to return a d dimensional square matrix with following pattern:
#    1    2    3    4     ... d
#    2d   2d-1 2d-2 2d-3  ... d+1
#    2d+1 2d+2 2d+3 2d+4  ... 3d
#    .    .    .    .     ... .
#    .    .    .    .     ... .
# Note: d is a positive integer

## Do not modify this line! ## Your code for 1.

matrix_1 <- function(d){
  mat <- matrix(0, d, d)
  for (i in 1:d){
    mat[i:d,i] <- i
  }
  return(mat)
}

## Do not modify this line! ## Your code for 2.

recur <- function(x){
  if (x==1)
    return (1)
  
  else
  {
    return(recur(x-1) + x)
  }
}

matrix_2 <- function(d){
  mat <- matrix(0, d, d)
  vec <- NULL
  for (i in 1:recur(d)){
    vec[i] <- i
  }
  mat[upper.tri(mat, diag = T)] <- vec
  
  return (t(mat))
}

## Do not modify this line! ## Your code for 3.

matrix_3 <- function(d){
  mat <- matrix(0, d, d)
  for (i in 1:d){
    if(i==1){
      mat[i, ] <- c(1:d)
    }else if(i %% 2 == 0 ){
      mat[i, ] <- c((i * d): ((i * d) - d + 1))
    }else{
      mat[i, ] <- c((((i-1) * d) +1): (i * d) )
    }
  }
  return(mat)
}
