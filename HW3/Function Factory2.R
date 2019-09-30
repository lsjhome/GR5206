#' HW3: function factory 2
#'
#' 1. Create a function `f` that takes an input value `x` and evalutes `f(x) = x^4-2x^3-7x^2+9`.
## Do not modify this line!

f <- function(x) x^4-2*x^3-7*(x^2)+9


#' 2. Create a function factory `polynomial_factory` that takes an input vector `a` and returns a polynomial function, 
#' for example, `polynomial_factory(a=c(9,0,-7,-2,1))` will output the function defined in the previous exercise.
#'    Reminder: use `force`.
## Do not modify this line!

polynomial_factory <- function(a){
  force (a)
  function (x){
    degree <- seq(a) - 1
    return (sum(a * x^{degree}))
  }
}

#' 3. Use `optimise` to calculate the minimum point `xmin` and minimum value `ymin` 
#' between `(-5,10)` for the function `f` in exercise 1.
## Do not modify this line!

xmin <- optimise(f, interval = c(-5, 10))$minimum
ymin <- optimise(f, interval = c(-5, 10))$objective


#' 4. Use `map`, `polynomial_factory` and `optimise` to calculate the minimum of 
#' `f(x)=3x^3-8x^2+2x-7`, `f(x)=x^5-2x^4-3x^2+5x`, and `f(x)=x^4-2x^2+7x+6` within range `(-2,5)`,
#'    save the answer into a list `v`, with length of 3, 
#'    each component consists of a `minimum` and an `objective` which represent the minimum point and minimum value respectively.
#'    Try to write the code in one line.
## Do not modify this line!

library(purrr)
poly_list <- list(rev(c(3, -8, 2, -7)), rev(c(1, -2, 0, -3, 5, 0)), rev(c(1, 0, -2, 7, 6)))
v <- map(.x=poly_list, .f = ~ optimise(polynomial_factory(.), interval = c(-2,5)))
