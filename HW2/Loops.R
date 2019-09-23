# HW2: loop2
#
# 1. Use a `for` loop to create a vector `x1` that stores the Displacement (`disp`) of the `mtcars` dataset, whose values are 160 or higher.
# 2. Use a `for` loop to create a vector `x2` that stores the Displacement (`disp`) of the `mtcars` dataset in order, 
#    until it observes a value strictly smaller than 160.(Do not include that value less than 160).
# 3. Do the above exercise no.2 again, but use a `while` loop instead, name the vector `x2_new`.
# 4. Use a `for` loop to create a vector `x3` that stores the Displacement (`disp`) of the `mtcars` dataset, 
# making all the values greater than 160 to be exactly 160.

## Do not modify this line! ## Write your code for 1. after this line! ##

n <- nrow(mtcars)
x1 <- vector()
for (i in 1:n){
  if (mtcars$disp[i] >= 160){
    x1 <- append(x1, mtcars$disp[i])
  }
}

## Do not modify this line! ## Write your code for 2. after this line! ##

x2 <- vector()
for (i in 1:n){
  if (mtcars$disp[i] >= 160)
  {
    x2 <- append(x2, mtcars$disp[i])
  }
  else{
    break
  }
}


## Do not modify this line! ## Write your code for 3. after this line! ##

x2_new <- vector()
i <- 1
while (mtcars$disp[i] >= 160){
  x2_new <- append(x2_new, mtcars$disp[i])
  i <- i+1
}


## Do not modify this line! ## Write your code for 4. after this line! ##

x3 <- vector()
for (i in 1:n){
  if (mtcars$disp[i] > 160){
    x3 <- append(x3, 160)
  }
  
  else{
    x3 <- append(x3, mtcars$disp[i])
  }
}
