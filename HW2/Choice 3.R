# HW2: choices
#
# 1. Create an integer vector `x`, containing the numbers from 1 to 100.
# 2. Use `vectorised if` to find numbers in `x` which are divisible by 3 and return a logical vector `r`.
# 3. Calculate how many numbers are NOT divisible by 3 using the function `sum()`, and store it in the variable `n`.
# 4. Convert vector `x` to vector `y`, using a for loop, following these conditions :
#    if x is less than 20, change it to -1, if between 20 and 50 (inclusive) to 0, and if between 51 and 80 (inclusive) to 1, rest to NA.
# 5. Apply `table()` function to find value counts of y and store into a table `z`.
# 6. Apply `is.na()` to find how many NA exists in vector y, and assign this number to variable `num_NA`.

## Do not modify this line! ## Write your code for 1. after this line! ##

x <- seq.int(1:100)

## Do not modify this line! ## Write your code for 2. after this line! ##

r <- ifelse(x%%3==0, T, F)

## Do not modify this line! ## Write your code for 3. after this line! ##

n<- sum(!r)

## Do not modify this line! ## Write your code for 4. after this line! ##

y <- NULL
for (i in x){
  if (i<20)
  {
    y[i]<- -1
  }
  
  else if (20<=i & i<=50){
    y[i] <- 0
  }
  
  else if (51<=i & i<=80){
    y[i] <- 1
  }
  
  else
    y[i] <- NA
}


## Do not modify this line! ## Write your code for 5. after this line! ##

z <- table(y)

## Do not modify this line! ## Write your code for 6. after this line! ##

num_NA <- sum(is.na(y))

