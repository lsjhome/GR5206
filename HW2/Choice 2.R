# HW2: choices2
#
# 1. Create a function `is_prime` that checks if an integer is a prime number or not,
# `is_prime` takes one parameter named `num`, return `True` if `num` is a prime number, return `False` if it is composite.
# 2. Use a `for` loop to create an integer vector `x`, containing the all prime numbers from 1 to 100.
# 3. How many prime numbers are greater than 30 but less than 80? Save the answer into scalar `a`.
# 4. Calculate the sum of the 2nd, 4th, 6th... prime number below 100. Save the anser into scalar `b`.

## Do not modify this line! ## Write your code for 1. after this line! ##

is_prime <- function(num) {
  if (num == 2) {
    TRUE
  } else if (any(num %% 2:sqrt(num) == 0)) {
    FALSE
  } else { 
    TRUE
  }
}

## Do not modify this line! ## Write your code for 2. after this line! ##

x <- NULL

for (i in seq(1, 100))
{
  if (is_prime(i))
  {
    x <- append(x, i)
  }
}

## Do not modify this line! ## Write your code for 3. after this line! ##

a <- sum((x >30) & (x<80))

## Do not modify this line! ## Write your code for 4. after this line! ##

idx <- seq.int(2, 99, 2)
b<- sum(x[idx], na.rm = T)



