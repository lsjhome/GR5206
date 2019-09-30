#' HW3: Map Reduce
#'
#' In this exercise, we will use `map-reduce` to efficiently calculate means of large vectors from the `MplsStops` dataset, contained in
#' the package `carData`. The `MplsStops` dataset records all stops made by the Minneapolis Police Department for the year 2017.
#' It contains 51857 observations with 14 variables.(Docs: https://vincentarelbundock.github.io/Rdatasets/doc/carData/MplsStops.html).
#'
#'
#' 1. Load the packages `carData` and `purrr`. 
#' Select all the numeric columns from `MplsStops` dataset and store them in a variable `mpls_num`.
#'    (Hint: use the `keep(.x, .p)` 
#'    function to select the correponding columns from dataset `.x` that satisfies the contraints defined in `.f`).
## Do not modify this line!
# install.packages('carData')

library(purrr)
library(carData)
mpls_num <- keep(MplsStops , is.numeric)

#' 2. Calculate the mean of each column and store them in a list `mpls_mean`. (Hint: Use `map_dbl()` and `mean()`.)
#'    Calculate the time it takes to calculate the mean and store it in a variable called `time1`.
#'    (Hint: use `Sys.time()` to calculate the current system time. Create a variable `startime` to store the system time before the
#'    calculation and a variable 'endtime' after the calculation. The duration of the calculation is `endtime-startime`.)
## Do not modify this line!

startime <- Sys.time()
mpls_mean <- map_dbl(mpls_num, mean)
endtime <- Sys.time()
time1 <- endtime-startime
time1  
#' 3. Use `reduce()` to calculate the mean of `mpls_mean`(which is the overall mean of the three columns `lat`, `long` and `policePrecinct`)
#'    and store the result in `mpls_reduce`. (Hint: `reduce(x, f)` conducts an operation `f` on all the elements in the vector `x`.
#'    You can use `reduce` to calculate the sum of `mpls_mean` and then calculate the mean.)
#'    Try to think about why `mean(mpls_mean)` wouldn't work!
## Do not modify this line!

mpls_reduce <- reduce(mpls_num, sum)/(nrow(mpls_num)*3)

#' 4. Use a `for` loop to manually calculate the overall mean of the three columns `lat`, `long` and `policePrecinct` and store the
#'    result in a variable `naive_calculation` (it should be the mean of the three colums, not the mean of each column).
#'    Do NOT use the function `mean()`.
#'    Store the calculation time in variable `time2`(Hint: calculate the OVERALL mean of the three columns, not columnwise mean.
#'    Calulation time can be calculated in same way as question 2).
## Do not modify this line!

n_row <- nrow(mpls_num)
n_col <- ncol(mpls_num)
naive_calculation <- 0
startime <- Sys.time()

for (i in 1:n_row) {
  for (j in 1:n_col) {
    naive_calculation <- naive_calculation + mpls_num[i, j]
  }
}

naive_calculation <- naive_calculation / (n_row * n_col)
endtime <- Sys.time()
time2 <- endtime-startime