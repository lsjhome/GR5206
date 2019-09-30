#' HW3: Reduce
#'
#' 1. Load the `purrr` package. Create a function `my_factorial(n)` which calculates the factorial of a number using `reduce`. 
#' You can assume the input will only be a natural number.
#'    Note: DO NOT use `factorial` function from the base package.
## Do not modify this line!

library(purrr)
my_factorial <- function(n) ifelse(n <= 1, 1, reduce(as.double(1:n), .f=`*`))

#' 2. Create a function `compare_length(vec1, vec2)` that takes as input 2 vectors and returns the maximum length of them using `max`.
## Do not modify this line!

compare_length <- function(vec1,vec2) max(length(vec1), length(vec2))

#' 3. Create a function `max_length(l)` that takes as input a list of vectors and returns the maximum length among the vectors 
#' using `reduce` and `compare_length`. You can assume there will be at least two vectors inside the list.
## Do not modify this line!

max_length <- function(l) reduce(l, compare_length)

#' 4. Implement `arg_max(x, f)`. It should take as input a vector `x` and a function `f`, and 
#' return a vector of the elements of `x` where the function returns the highest value.
#'    Example: `arg_max(-10:5, function(x) x ^ 2)` should return -10. `arg_max(-5:5, function(x) x ^ 2)` should return c(-5, 5).
## Do not modify this line!

arg_max <- function(x, f) x[f(x)==max(f(x))]

#' 5. Implement `my_rle(x, f)` that takes as input a list `x` and a predicate function `f`, and returns a `rle` object that 
#' contains the lengths and values of runs of elements where the predicate is true. Please use `rle` and `map_lgl`.
#'    Example: Given a list `list("a", "b", "c", 1, 2, 3)` and predicate function `is.character`, 
#'    this function should return a `rle` object with first element `lengths: 3 3` and second element `values: TRUE FALSE`.
## Do not modify this line!

my_rle <- function(x, f) rle(map_lgl(x, f))


#' 6. Implement `span(x, f)` using `my_rle`. Given a list `x` and a predicate function `f`, 
#' `span(x, f)` returns the location of the first longest sequential run of elements where the predicate is true.
#'    Note: If f(x) is FALSE for every x in the list, return `NA`.
## Do not modify this line!

# x <-list("a", "b", 1, 2, 3, "d","e","f", 4, 5, 6, 7)
# 
# rle <- my_rle(x, is.character)
# max_length <- max(rle$lengths[rle$values])
# detect_index(rle$lengths[rle$values], function(x) x==max_length)
# idx <- detect_index(rle$lengths[rle$values], function(x) x==max_length)
# which(rle$values==T)[idx]

span <- function(x, f){
  rle <- my_rle(x, f)
  if (!any(rle$values))
  {
    return (NA)
  }
  else {
    max_length <- max(rle$lengths[rle$values])
    idx_among_true <- detect_index(rle$lengths[rle$values], function(x) x==max_length)
    idx_among_total <- which(rle$values==T)[idx_among_true]                    
    if (idx_among_total == 1)
    {
      return (1)
    }
    else
    {
      output <- sum(rle$lengths[1:(idx_among_total-1)]) + 1
      return (output)
    }
  }
}