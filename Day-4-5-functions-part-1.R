###########################################################

############## USER-DEFINED FUNCTIONS IN R   ##############

###########################################################

## Discusses creation of functions, their rules,
## how they relate to and communicate with the
## environments from which they are called.

# 4.1 FUNCTIONS p. 63

## GO TO - SHOW SLIDE # 1 FIRST

# A function has the form
#
# name <- function(argument_1, argument_2, ...) {
#     expression_1
#     expression_2
#     ...
#     return(output) # optional but preferred
# }
#
# Here argument_1, argument_2 are variables and
# expression_1, expression_2, and output are all
# regular R expressions. name is the name of the
# function. A function may have no arguments.
# Braces are optional with only one expression.
#
# To call or run the function we type
#
# name(x1, x2, ...)
#
# The value of this expression is the value of the
# expression output.
#
# 1)Function may have more than one return statement
#   in which case it stops executing after reaching
#   the first one.
#
# 2)If no return(output) statement, the last thing
#   done (and returned) is the last statment in
#   in the braces.
#
# 3)Function always returns a value (can be NULL)
#
# 4)Like an expression, value returned is printed
#   if not assigned to a variable.

## Scope and its consequences; p. 68

# Arguments and variables defined within a function
# exist only within that function. If variables
# w/ same name exist in and out, they do not
# interact or affect each other at all. Is two
# separate environments. The function environment
# only communicates with the outside world through
# values of its arguments, and output expression.

# For example, if you execute command rm(list=ls())
# inside a function, you only delete those objects
# that are defined inside the function.

rm(list = ls())

test <- function(x) {
  y <- x + 1
  return(y)
}

test(1)
x
y

y <- 10
test(1)
y

# Part of program in which variable is defined is
# its 'scope'. Variables called within a function
# do not modify samed-named variables outside.

# HOWEVER!!! This scope is not symmetric....
# Variables defined inside a function cannot be
# seen outside, but variables defined outside
# can be seen inside the function (as long as
# there is not a same-named variable inside.

# This opens the door to creative programming
# opportunities as we will see with recursive
# programming.

# Also makes it possible to write a function
# whose behavior depends on the context in
# which it is run. For example, consider:

test2 <- function(x) {
  y <- x + z
  return(y)
}
z <- 1
test2(1)

z <- 2
test2(1)

# Moral: value returned with same value passed into
# the function changes based on value of z outside.
# 'outside' means the "global environment"; BUT
# ONLY BECAUSE Z IS ABSENT INSIDE THE FUNCTION.

# REMEMBER THIS for exercise "random.sum" later

# So called 'lexical scope': z is unbound variable.
# R attempts to resolve in the local environment, then
# in the enclosure to that function, working it way
# 'out' to the global environment.

# EXAMPLE SCOPING RULE p. 8 SLIDES

cube <- function(n) {
  sq <- function()
    n * n
  cb <- n * sq()
}
cube(3)

# Note that variable n in function sq() is
# not an argument to that function. It is a free
# variable and scoping rules determine its
# value from the value in outside function cube().

## Optional arguments and default values. p. 70

# If any argument has a default value within a function,
# then it may be omitted when calling the function.
# Then the default value is used.

# However, omitting an argument can cause ambiguity
# about which arguments are assigned to which variables.

# R tries to avoid this ambiguity by assigning arguments
# from left to right, unless the argument is named.

test3 <- function(x = 1,
                  y = 1,
                  z = 1) {
  return(x * 100 + y * 10 + z)
}
test3(2, 2)
test3(y = 2, z = 2)

dateNow <- gsub(" ", "_", date())
dateNowFile <- paste("day-4-5-fun-p1", dateNow, "RData", sep = ".")
save.image(file = dateNowFile)
