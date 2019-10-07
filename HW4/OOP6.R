# HW4: OOP_account
#'
# In this exercise, we will create a class `account`.
#'
# 1. Create a constructor `new_account(number)` that takes in a length 2 numeric
#    vector and initiates an object of class `account` using `structure`.
#    Class `account` should have an attribute `units` which is always the character vector `c('USD', 'EUR')`.
#    The value should be the amount of money in each currency.
#    Don't forget to use `stopifnot` to check if `number` is numeric or not and if the length of number is different from 2.
#    For example, `new_account(c(5, 0))` will create an account with 5 USD.
#    `new_account(c(0, 5))` will create an account with 5 EUR.
#    `new_account(c(5, 10))` will create an account with 5 USD and 10 EUR.
## Do not modify this line!

new_account <- function(number){
  stopifnot(is.numeric(number) && length(number) == 2)
  structure(number,
            units = c('USD', 'EUR'),
            class = "account"
  )
}

# 2. Use `pmatch` to reate a function `get_unit_index(units)` to get the index of input `units` in `c('USD, 'EUR')`.
#    You are supposed to use this function in the following questions.
#    For example, `get_unit_index('EUR') = 2`. `get_unit_index('US') = 1`.
#    `get_unit_index('U','E') = c(1, 2)`.
## Do not modify this line!

get_unit_index <- function(units) {
  pmatch(units, c('USD', 'EUR') ,dup = TRUE)}

# 3. Create a helper function `account(number, units)` that takes in a scalar or vector `number`
#    with corresponding `units` which initiates an object of class `account`.
#    `units` might include `EUR`, `USD`.
#    For example, `account(5, 'USD')` will create an account with 5 USD.
#    `account(5, 'EUR')` will create an account with 5 EUR.
#    `account(c(5, 10), c('EUR', 'USD'))` will create an account with 5 EUR and 10 USD.
#    Create an account with 100 USD and 100 EUR. Save it as `my_account`.
## Do not modify this line!

account <- function(number, units){
  stopifnot(is.numeric(number))
  total <- c(NULL, NULL)
  total[get_unit_index(units)] <- number
  print (total)
  new_account(total)
}

# 4. Creat two generic functions `deposit(account, number, units)` and `withdraw(account, number, units)`
#    that takes in a scalar or vector `number` with corresponding `units`.
#    `units` might include `EUR`, `USD`.
#    Methods `deposit.account` and `withdraw.account` should return an object of class `account` with correct amounts.
#    Deposit 50 USD and withdraw 50 EUR for `my_account`.
## Do not modify this line!

deposit <- function(account, number, units) UseMethod("deposit")
withdraw <- function(account, number, units) UseMethod("withdraw")

deposit.account <- function(account, number, units){
  idx <- get_unit_index(units)
  account[idx] <- account[idx] + number
  account(account, c("USD", "EUR"))
}

withdraw.account <- function(account, number, units){
  idx <- get_unit_index(units)
  account[idx] <- account[idx] - number
  account(account, c("USD", "EUR"))
}

my_account <- deposit.account(my_account, 50, "USD")
my_account <- withdraw.account(my_account, 50, "EUR")

# 5. Write a new `summary` method for class `account`. `summary(account, units)` should return a named vector
#    which has the same length and names as `units`.
#    The reurn value should be the total amount of the `account` in `units`.
#    For simplicity, 1 EUR = 1.1 USD.
#    For example, `summary(my_account, c('USD', 'EUR'))` should return a named vector with values `c(150, 50)`.
#    `summary(my_account, 'USD')` should return a named vector with value `205`.
## Do not modify this line!

summary.account <- function(account, units){
  temp <- c(1,2)
  unit_index <- get_unit_index(units)
  if (length(units)==1){
    other_cur <- switch(units,
                  "USD" = account[temp[-unit_index]]*1.1,
                  "EUR" = account[temp[-unit_index]]/1.1)
    total <- other_cur + account[unit_index]
    names(total) <-attr(account,"units")[unit_index]
    return(total)
  }else{
    total <- account[unit_index]
    names(total) <- attr(account,"units")[unit_index]
    return(total)}
}

# 6. Now let's consider a subclass `minimum_balance_account` which should maintain a pre-determined minimum balance.
#    Create a constructor `new_minimum_balance_account(number, minimum)` that takes in legnth 2 numeric vectors and
#    initiates an object of subclass `minimum_balance_account` using `structure`.
#    Subclass `minimum_balance_account` should have an attribute `units` which is always
#    the character vector `c('USD', 'EUR')` and an attribute `minimum` which is a numeric vector.
#    The value should be the amount of money in each currency.
#    Don't forget to use `sopifnot` to check if `number` and `minimum` are numeric or not.
#    For example, `new_minimum_balance_account(c(5, 0), c(1, 0))` will create an account
#    with 5 USD and minimum balance 1 USD.
## Do not modify this line!

new_minimum_balance_account <- function(number, minimum){
  stopifnot(is.numeric(number) && is.numeric(minimum))
  stopifnot(length(number) ==2 && length(minimum) ==2)
  structure(number,
            class = c("minimum_balance_account", "account"),
            units = c('USD', 'EUR'),
            minimum = minimum,
            minimum_units = c('USD', 'EUR')
  )
}

# 7. Create a helper function `minimum_balance_account(number, units, minimum, minimum_units)`
#    that takes in a scalar or vector `number` and `minimum`
#    with corresponding `units` and `minimum_units` which initiates an object of subclass `minimum_balance_account`.
#    `units` and `minimum_units` might include `EUR`, `USD`.
#    For example, `minimum_balance_account(5, 'USD', 1, 'USD')` will create an account
#    with 5 USD and minimal balance 1 USD.
## Do not modify this line!

minimum_balance_account<- function(number, units, minimum, minimum_units){
  temp1 <- c(0,0)
  unit_index <- get_unit_index(units)
  temp1[unit_index] <- number
  temp2 <- c(0,0)
  minimum_unit_index <- get_unit_index(minimum_units)
  temp2[minimum_unit_index] <- minimum
  new_minimum_balance_account(temp1, temp2)
}

# 8. Add method for `withdraw` and modify `deposit.account` if needed such that:
#    a. The returned value should be the same class of input `account`.
#    b. Function `deposit` can accpet `minimum_balance_account` and return correct object.
#    c. If withdraw will cause the balance lower than the minimum balance,
#       report an error 'Minimum balance must be maintained.'.
#    d. Use `withdraw.account` in `withdraw.minimum_balance_account`.
## Do not modify this line!

deposit.minimum_balance_account <- function(account, number, units){
  unit_index <- get_unit_index(units)
  account[unit_index] <- account[unit_index] + number
  account(account,c("USD",'EUR'))
}

withdraw.minimum_balance_account <- function(account, number, units){
  unit_index <- get_unit_index(units)
  minimum <- attr(account,"minimum")
  if( (account[unit_index] - number)>= minimum[unit_index]){
    withdraw.account(account,number, units)
  }else{
    stop('Minimum balance must be maintained.')
  }
}