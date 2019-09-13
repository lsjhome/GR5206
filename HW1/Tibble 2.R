# 1. Convert the dataset `mtcars` to a tibble `t1`.
# 2. Create a tibble `t2` which contains all columns of `t1` with a miles per gallon higher than 18.
# 3. Create a tibble `t3` that contains all the values of `t2` truncated to the corresponding integer.
# 4. Copy `t3` into a tibble `t4` and merge its two columns 'vs' and 'am' by summing them, rename it 'vsam' and make sure it is `t4`'s first column.


## Do not modify this line! ## Write your code for 1. after this line! ##
library(tibble)
t1 <- as_tibble(mtcars)

## Do not modify this line! ## Write your code for 2. after this line! ##
t2 <-subset(t1, mpg>18)

## Do not modify this line! ## Write your code for 3. after this line! ##
t3 <- trunc(t2)

## Do not modify this line! ## Write your code for 4. after this line! ##
t4 <- t3
t4['vsam'] <- t4['vs'] + t4['am']
str(t4)
colnames(t4)
t4 <- t4[c('vsam', "mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")]