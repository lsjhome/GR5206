# HW1: outer product
#
# 1. Create vector `v` containing numbers 1 to 7.
# 2. Create matrix `outer_prod1` which is the outer product of `v`.
# 3. Copy `outer_prod1` to `outer_prod2` 
# and change the sign of the lower triangular part of `outer_prod2` from + to -.
# 4. Convert `outer_prod2` to a tibble `t1`.
# 5. Rename columns of `t1` as the first 7 letters of the alphabet.
# 6. Copy `t1` into `t2` and remove the columns 'd' of `t2`.
# install.packages("tidyverse")
library(tibble)
## Do not modify this line! ## Write your code for 1. after this line! ##
v <- 1:7
## Do not modify this line! ## Write your code for 2. after this line! ##
outer_prod1 <- outer(v, v)
## Do not modify this line! ## Write your code for 3. after this line! ##
outer_prod2 <- outer_prod1
outer_prod2[lower.tri(outer_prod2)] <- outer_prod2[lower.tri(outer_prod2)] * -1
## Do not modify this line! ## Write your code for 4. after this line! ##
t1 <- as_tibble(outer_prod2)
## Do not modify this line! ## Write your code for 5. after this line! ##
colnames(t1) <- c("a", "b", "c", "d", "e", "f", "g")
## Do not modify this line! ## Write your code for 6. after this line! ##
t2 = subset(t1, select = c("a", "b", "c", "e", "f", "g"))
