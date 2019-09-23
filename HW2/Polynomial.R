# HW2: Compute polynomial
#
# Review: nth degree polynomial $f(x) = a_0 + a_1 x + ... + a_n x^n$, "where $a = (a_0, 1_a, ..., a_n)$ are the coefficients of the polynomial.
#
# 1. Calculate f(5) where $f(x) = 3 + 3 + 4 x + 5 x^2 + 6 x^3$ and store it into a variable `n1`.
# 2. Set the random seed to zero and save the random seed vector to `seed`. (hint: use the command `seed <- .Random.seed`)
#    Use `runif` function to randomly sample 11 numbers from uniform distribution U(1,10). Store the sample in vector `vec2`.
#    Use a for loop to assign `n2` to the value of the 10th degree polynomial with coefficients `vec2` and evaluated at 3.
# 3. Please write a function `polynomial(vec,x)` that evaluates the polynomial with coefficients `vec` at `x`.
#    Note: The length of `vec` is not determined. You can assume the degree of the polynomial is length of vec - 1.

## Do not modify this line! ## Write your code for 1. after this line! ##

f <- function(x){
  return (3 + 4*x + 5*x^2 + 6 * x^3)
}

n1 <- f(5)

## Do not modify this line! ## Write your code for 2. after this line! ##

set.seed(0)
seed <- .Random.seed
vec2 <- runif(11, 1, 10)

f2 <- function(x) {
  n2 <- 0
  n = length(vec2)
  for (i in 1:n-1) {
    n2 <- n2 + vec2[i+1]*x^(i)
  }
  return(n2)
}

n2 <- f2(3)

## Do not modify this line! ## Write your code for 3. after this line! ##

polynomial <- function(vec, x){
  degree <- seq(from=0, to=length(vec)-1)
  answer <- sum(vec * x^degree)
  return (answer)
}