# HW4: Object Oriented Programming
#'
# In this exercise, we will create a class `distance` on top of integers and overload the function `mean()`.
#'
# 1. Create a constructor `new_distance(x, units)` where:
#     - `x` is a vector of numbers (not a vector of strings like `"ten"`),
#     - `units` is an attribute which can take values in `c("mm", "cm", "m", "km")`, with default value `"m"`,
#     - the object of class `distance` is instanciated using `structure`.
#    (Hint : Don't forget to use `stopifnot` to check the input type with `is.numeric` and `is.character`.)
#    Create a helper `distance(x, units)` that checks whether the input `unit` is in the feasible domain
#    `c("mm", "cm", "m", "km")` and throws an error if not.
#     (Hint : Use `match.arg()`.)
#    Write a new `print` method named `print.distance` for class `distance` that prints
#    `"the distance is <distance> <unit>"` when `<distance>` is a vector of length 1. 
#    It should print `"the distances are <distance> <unit>"` if 
#    `<distance>` is a vector of at least two elements.
#    For example, `print(distance(1:3, "cm"))` should print `"the distances are 1 2 3 cm"`.
#    Use the functions `print()`, `paste0()`, and the function `attr()` to access the unit of the distance
#    and use `as.character` to convert the `distance` to a vector of characters,
#    and the function `attr()` to access the unit of the distance.
#    (Note: there is a space between `<distance>` and `<unit>` and no space at the end of the string.)
#    Make sure that the method returns the object invisibly by adding `invisible(x)` at the end.
#    The `"<distance>"` should be substituted by the number when instantiating `distance`.
#    The default unit should be `m`.
#    Create an instance of `distance` called `dist1` using `x = 10` and then print `dist1`.
## Do not modify this line!


new_distance <- function(x, units = "m") {
  stopifnot(is.numeric(x) & is.character(units))
  structure(x,
            units = units,
            class = "distance")
}

distance <- function(x, units="m") {
  ifelse(units %in% c("mm", "cm", "m", "km"),
         units <- match.arg(units , c("mm", "cm", "m", "km")),
         stop("Unknown unit."))
  new_distance(x, units)
}

print.distance <- function(x, ...){
  ifelse(length(x) == 1 ,
         print( paste0("the distance is ",x ," " , attr(x, "units"))),
         print( paste0("the distances are ", as.character(paste0(x, collapse = " ")) ," " , attr(x, "units")))
  )
  invisible(x)
}

dist1 <- distance(10)
print(dist1)



# 2. Create a function `to_mm(x)` that takes in a distance and converts it to the equivalent distance
#    in millimeters (i.e., it returns an object of class `distance`.
#    (Hint: Use `attr()` to access the units and `switch` to convert them.
#    Use `stop("Unknown unit.")` as default to specify the output when the input unit is not
#    in the feasible domain. Do not use `if` and `else`.
#    Use the helper function `distance()`to create the final object.)
#    Create an instance of `distance` called `dist1_converted` by converting `dist1` to millimeters.
## Do not modify this line!

to_mm <- function(x, ...){
  units <- attr(x, "units")
  stopifnot(units %in% c("mm", "cm", "m", "km"))
  dist <- switch(units , "mm" = x , "cm" = x*10 , "m" = x*1000 , "km" = x*1000000)
  distance(dist, units = "mm")
}
dist1_converted <- to_mm(dist1)


# 3. Write a new function `c.distance` for the class `distance` that combines its arguments to form a vector
#    of distances converted in millimeters.
#    (Hint: note that the argument to the `c()` generic is `...`, and you can use `list(...)`
#    to capture them. You can then use `sapply()` and `to_mm()` to first convert each distance in `list(...)`
#    the list into millimeters.)
#    Next, instantiate a new distance `dist2` of `20cm`.
#    Concatenate `dist1` and `dist2` together using `c()` and store the distance vector into `dist_both`.
## Do not modify this line!

c.distance <- function(...){
  dist_list <- list(...)
  dist_list <- sapply(dist_list, to_mm)
  distance(dist_list, "mm")
}
dist2 <- distance(20, "cm")
dist_both <- c(dist1, dist2)


# 4. Write a new `mean.distance` function for the class `distance`
#    that calculates the average distance of a distance vector in millimeters.
#    (Hint: in the implementation of the function, first convert all elements in the list to millimeters.
#    We can do that by simply call `to_mm(x)` because it is well defined for a distance object.
#    Then convert the distance variable to numeric by `as.numeric`.
#    Finally, since all the elements have been converted to numeric values,
#    we can simply calculate the average of the list by calling `mean(x)` and return an object of class
#    distance by calling the helper `distance()`.)
#    After you define function `mean.distance`, calculate the mean `dist_both` and store it into `avg`.
## Do not modify this line!

# HW4: Object Oriented Programming
#'
# In this exercise, we will create a class `distance` on top of integers and overload the function `mean()`.
#'
# 1. Create a constructor `new_distance(x, units)` where:
#     - `x` is a vector of numbers (not a vector of strings like `"ten"`),
#     - `units` is an attribute which can take values in `c("mm", "cm", "m", "km")`, with default value `"m"`,
#     - the object of class `distance` is instanciated using `structure`.
#    (Hint : Don't forget to use `stopifnot` to check the input type with `is.numeric` and `is.character`.)
#    Create a helper `distance(x, units)` that checks whether the input `unit` is in the feasible domain
#    `c("mm", "cm", "m", "km")` and throws an error if not.
#     (Hint : Use `match.arg()`.)
#    Write a new `print` method named `print.distance` for class `distance` that prints
#    `"the distance is <distance> <unit>"` when `<distance>` is a vector of length 1. 
#    It should print `"the distances are <distance> <unit>"` if 
#    `<distance>` is a vector of at least two elements.
#    For example, `print(distance(1:3, "cm"))` should print `"the distances are 1 2 3 cm"`.
#    Use the functions `print()`, `paste0()`, and the function `attr()` to access the unit of the distance
#    and use `as.character` to convert the `distance` to a vector of characters,
#    and the function `attr()` to access the unit of the distance.
#    (Note: there is a space between `<distance>` and `<unit>` and no space at the end of the string.)
#    Make sure that the method returns the object invisibly by adding `invisible(x)` at the end.
#    The `"<distance>"` should be substituted by the number when instantiating `distance`.
#    The default unit should be `m`.
#    Create an instance of `distance` called `dist1` using `x = 10` and then print `dist1`.
## Do not modify this line!


new_distance <- function(x, units = "m") {
  stopifnot(is.numeric(x) & is.character(units))
  structure(x,
            units = units,
            class = "distance")
}

distance <- function(x, units="m") {
  ifelse(units %in% c("mm", "cm", "m", "km"),
         units <- match.arg(units , c("mm", "cm", "m", "km")),
         stop("Unknown unit."))
  new_distance(x, units)
}

print.distance <- function(x, ...){
  ifelse(length(x) == 1 ,
         print( paste0("the distance is ",x ," " , attr(x, "units"))),
         print( paste0("the distances are ", as.character(paste0(x, collapse = " ")) ," " , attr(x, "units")))
  )
  invisible(x)
}

dist1 <- distance(10)
print(dist1)



# 2. Create a function `to_mm(x)` that takes in a distance and converts it to the equivalent distance
#    in millimeters (i.e., it returns an object of class `distance`.
#    (Hint: Use `attr()` to access the units and `switch` to convert them.
#    Use `stop("Unknown unit.")` as default to specify the output when the input unit is not
#    in the feasible domain. Do not use `if` and `else`.
#    Use the helper function `distance()`to create the final object.)
#    Create an instance of `distance` called `dist1_converted` by converting `dist1` to millimeters.
## Do not modify this line!

to_mm <- function(x){
  units <- attr(x, "units")
  stopifnot(units %in% c("mm", "cm", "m", "km"))
  dist <- switch(units , "mm" = x , "cm" = x*10 , "m" = x*1000 , "km" = x*1000000)
  distance(dist, units = "mm")
}
dist1_converted <- to_mm(dist1)



# 3. Write a new function `c.distance` for the class `distance` that combines its arguments to form a vector
#    of distances converted in millimeters.
#    (Hint: note that the argument to the `c()` generic is `...`, and you can use `list(...)`
#    to capture them. You can then use `sapply()` and `to_mm()` to first convert each distance in `list(...)`
#    the list into millimeters.)
#    Next, instantiate a new distance `dist2` of `20cm`.
#    Concatenate `dist1` and `dist2` together using `c()` and store the distance vector into `dist_both`.
## Do not modify this line!

c.distance <- function(...){
  dist_list <- list(...)
  dist_list <- sapply(dist_list, to_mm)
  distance(dist_list, "mm")
}
dist2 <- distance(20, "cm")
dist_both <- c(dist1, dist2)


# 4. Write a new `mean.distance` function for the class `distance`
#    that calculates the average distance of a distance vector in millimeters.
#    (Hint: in the implementation of the function, first convert all elements in the list to millimeters.
#    We can do that by simply call `to_mm(x)` because it is well defined for a distance object.
#    Then convert the distance variable to numeric by `as.numeric`.
#    Finally, since all the elements have been converted to numeric values,
#    we can simply calculate the average of the list by calling `mean(x)` and return an object of class
#    distance by calling the helper `distance()`.)
#    After you define function `mean.distance`, calculate the mean `dist_both` and store it into `avg`.
## Do not modify this line!

mean.distance <- function(x, ...){
  dist <- as.numeric(to_mm(x))
  distance( mean(dist), 'mm')
}
avg <- mean.distance(dist_both)
