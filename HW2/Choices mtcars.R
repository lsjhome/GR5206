# HW2: Choices mtcars
# 
# 1.Load `mtcars` dataset and call it `df` (`df` should be a DataFrame object).
#
# 2.Select out column gear and save it as `gear`. 
#  Then replace values in `gear` from 3,4,5 to 'low gear', 'medium gear', 'high gear' respectively.
#  (Note: You have to use `dplyr` package, please use `library(dplyr)` to import `dplyr` package.)
#  (Hint: Look up `case_when` function from the dplyr package.)
#
# 3.Find the mean mpg (round to nearest integer) for cars in 'low gear', 'medium gear', 'high gear' and save as `m1`, `m2`, `m3` respectively.
#
# 4.Load `mtcars` dataset again but call it `new_df` this time 
#   (`new_df` should be a DataFrame object), 
#   replace the values in the mpg column with `m1`,`m2`,`m3` depending on its respectively gear category. 
#   (a 'low gear' car would have its mpg replaced by m1)




## Do not modify this line! ## Write your code for 1. after this line! ##

df <- mtcars

## Do not modify this line! ## Write your code for 2. after this line! ##

gear <- mtcars$gear
library(dplyr)

gear <- case_when(
  gear == 3 ~ 'low gear',
  gear == 4 ~ 'medium gear',
  gear == 5 ~ 'high gear',
)

## Do not modify this line! ## Write your code for 3. after this line! ##
m1 <- round(mean(df$mpg[gear == 'low gear']))
m2 <- round(mean(df$mpg[gear == 'medium gear']))
m3 <- round(mean(df$mpg[gear == 'high gear']))

## Do not modify this line! ## Write your code for 4. after this line! ##

new_df <- mtcars
new_df$mpg <- case_when(
  gear == 'low gear' ~ m1,
  gear == 'medium gear' ~ m2,
  gear == 'high gear' ~ m3
)

new_df <- mtcars
new_df$mpg <- case_when(
  gear == 'low gear' ~ m1,
  gear == 'medium gear' ~ m2,
  gear == 'high gear' ~ m3
)