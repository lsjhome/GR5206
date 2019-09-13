# HW1: factor8
#
# 1. Create an ordered factor `f1` consist of letters 'a' to 'z' ordered alphabetically.
# 2. Create an ordered factor `f2` consist of letters 'a' to 'z' in descending alphabetical order.
# 3. Create a 30 elements, ordered factor `f3` consist of letters 'a' to 'z' followed by 4 NA. 
# The order of `f3` is 'a'<...<'z'<NA.
# 4. Delete the element 'c' with the level 'c' and assign it to `f4`.

## Do not modify this line! ## Write your code for 1. after this line! ##
f1 <- ordered(c(letters), levels = c(letters))
## Do not modify this line! ## Write your code for 2. after this line! ##
f2 <- ordered(c(letters), levels = c(rev(letters)))
## Do not modify this line! ## Write your code for 3. after this line! ##
temp = append(c(letters), c(NA, NA, NA, NA))
temp_level = append(c(letters), NA)
f3 <- ordered(temp, levels=temp_level, exclude=FALSE)
## Do not modify this line! ## Write your code for 4. after this line! ##
f4 <- f3[-3, drop=TRUE]
