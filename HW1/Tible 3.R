# HW1: tibble ordering
#
# 1. Convert the dataset `mtcars` to a tibble `t1`.
# 2. Copy `t1` into a tibble `t2` and delete the columns 'drat' and 'am'.
# 3. Copy `t2` into a tibble `t3` and permute the column 'mpg' and 'qsec' (hint : you might want to use the function `which`).
# 4. Select the 10 rows of `t3` with lowest 'qsec' and copy them into a tibble `t4` in increasing order.

## Do not modify this line! ## Write your code for 1. after this line! ##
library(tibble)
t1 <- as_tibble(mtcars)

## Do not modify this line! ## Write your code for 2. after this line! ##
library(dplyr)
t2 <- select(t1, -c('drat', am))

## Do not modify this line! ## Write your code for 3. after this line! ##

t3 <- t2[c(6, 2, 3, 4, 5, 1, 7, 8, 9)]

## Do not modify this line! ## Write your code for 4. after this line! ##
t4 <- t3[order(t3$qsec),]
t4 <- t4[1:10,,drop=F]