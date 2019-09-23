# HW2: Sorting
#
# In this exercise, we will write a function to sort the input vector.
#
# 1. Use a `for` loop to go over the `qsec` column in `mtcars` dataset and assign to integer `n1` the position of the smallest number.
#    Note: if there are multiple smallest numbers, find the first occurrence.
# 2. Write a function `min_position(vec)` to return the position of the first occurrence of the smallest number. 
#    You should not use the `min` or `which` functions.
# 3. Write a function `my_sort(vec)` to return a sorted vector using the `min_position` function 
#    and a `while` loop. You should not use the `sort` or `order` functions.
# 4. Apply the `my_sort` function to the `qsec` column in `mtcars` dataset and store the sorted vector in `vec1`

## Do not modify this line! ## Write your code for 1. after this line! ##
qsec <- mtcars$qsec
qsec_len <- length(qsec)
min_idx <- 1
min_val <- qsec[min_idx]

for (i in 1:qsec_len){
  if (qsec[i] < min_val)
  {
    min_val <- qsec[i]
    min_idx <- i
  }
}

n1 <- min_idx

## Do not modify this line! ## Write your code for 2. after this line! ##

min_position <- function(vec){
  
  vec_len <- length(vec)
  idx <- 1
  val <- vec[idx]
  
  for (i in 1:vec_len){
    if (vec[i]<val & vec[i] >0)
    {
      val <- vec[i]
      idx <- i
    }
  }
  
  return (idx)
}

tt <- as.vector(10:20)
tt[-1]

## Do not modify this line! ## Write your code for 3. after this line! ##

my_sort <- function(vec){
  answer <- rep(NA, length(vec))
  i <- 1
  while(length(vec)!=0){
    idx <- min_position(vec)
    answer[i] <- vec[idx]
    vec <- vec[-idx]
    i <- i + 1
  }
  return (answer)
}


## Do not modify this line! ## Write your code for 4. after this line! ##

vec1 <- my_sort(mtcars$qsec)
