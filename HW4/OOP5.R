# hw4_oop4
#'
# In this exercise, we will create a class `shakeshack_order`.
#'
# 1. Create a constructor `new_shakeshack_order(names, prices)` that:
#     - takes in a vector of `names`
#     - a vector of `price` attribute whose type is double.
#     - instanciates an object of class `shakeshack_order` using `structure`.
#     - and it should be a list with 2 elements: `names` and `prices`.
# Note: Use `stopifnot` to check the input.
# Use `new_shakeshack_order(names, prices)` to create a helper function `shakeshack_order`
# that coerces the arguments `names` and `prices` respectively to string and numeric
# using `as.character` and `as.double`.
## Do not modify this line!



# 2. Write a new `sum(..., na.rm = FALSE)` method for the class `shakeshack_order` that
# returns the sum of the prices in a given order. Note that:
#    - the `sum` generic can take more than one argument via `...`, and you can capture
#    it using `list(...)`.
#    - the `na.rm` argument should be used to provide a way to sum
#    when some prices are not available.
# For instance, the following code should work without error:
# ```
# o <- shakeshack_order(c("shack burger", "fries"), c(5, 2))
# o2 <- shakeshack_order(c("fries", "coke"), c(2, NA))
# sum(o)
# sum(o, o2)
# sum(o, o2, na.rm = TRUE)
# ```
# The first sum should be equal to 7, the second to `NA`, and the third to 9.
# Do NOT use a `for`, `while` or `repeat` loop!
# (Hint: a nice solution could use a combination of `map` and `reduce`.)
## Do not modify this line!



# 3. Write a new `print` method for the class `shakeshack_order` that prints
# `"Your order is <names>. The total price is sum(<prices>)."` using `print`.
# If `length(names)` is larger than one (e.g., 3), the function should print
# `"Your order is <names[1]>, <names[2]>, <names[3]>. The total price is sum(<prices>)."`
# For instance, printing the order `o` describe above should output
# `"Your order is shack burger. The total price is $5.29."`.
# Note that:
#    - The `print` method should return the input invisibly.
#    - The arguments of print are `x` and `...`, but `...` won't be used in the
#    body of `print.shakeshack_order`.
## Do not modify this line!



# 4. Now, you need to create a combine operator for the class `shakeshack_order`.
# For example, `c(o, o2)` should equal
# `shakeshack_order(names = c('shack burger', 'fries', 'fries', 'coke'), prices = c(5, 2, 2, NA))`.
# Similarly as for `sum.shakeshack_order`, the `...` argument of `c.shakeshack_order`
# can be captured using `list(...)`.
# Do NOT use a `for`, `while` or `repeat` loop!
# (Hint: a nice solution could use a combination of `map2` and `reduce`.)
#'
## Do not modify this line!



