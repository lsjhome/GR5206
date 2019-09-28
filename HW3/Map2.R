#' HW3: map2
#'
#' Consider the `iris` dataset.
#'
#' 1. Use `map`, `keep` and `summary` function to calculate the summary statistics of each column containing numeric data, save the answer into a list `m1`.
#'    The length of the list `m1` should be the same as the number of numeric columns. Each element in `m1` corresponds to the summary of each numeric column.
## Do not modify this line!
library(purrr)
m1 <- map(keep(iris, is.numeric), summary)

#' 2. Use `map_dbl` , `keep` and `mean` to calculate the mean value for each numeric column with max/min 5% values trimmed, save the answer into a vector `m2`.
#'    Hint: use `trim` argument in `mean` function.
## Do not modify this line!

m2 <- map_dbl(keep(iris, is.numeric), mean, trim=0.05)


#' 3. Now, use `map2_dbl` to calculate the trimmed mean with trim level `0.01`, `0.05`, `0.1` and `0.2` 
#' respectively for column `Sepal.Length`, `Sepal.Width`, `Petal.Length` and `Petal.Width`.
#'    Save the answer into a vector `m3`.
## Do not modify this line!

df <- keep(iris, is.numeric)
trim_fun <- function(x, y) mean(x, trim=y)
trim_list <- c(0.01, 0.05, 0.1, 0.2)
m3 <- map2_dbl(.x = df, .y = trim_list, trim_fun)

#' 4. Use `detect_index` and `map_dbl` to detect the numeric column with variance greater than `3`, 
#' save the index number into `select_var` and the corresponding column name into `m4`.
#' Try to write all the answers in one line.
## Do not modify this line!

select_var <- detect_index(.x = df, .f = function(x) var(x)>3)
m4 <- names(df)[select_var]
