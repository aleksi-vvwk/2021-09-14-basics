##############################################
###  R BASICS FIRST TUTORIAL-DEMONSTRATION ###
##############################################

# Here are some illustrations of R
# interactive nature:
# You type in a 5 at the prompt
# (note that anything on a line following
# a "#" sign is considered a commentary and
# will not be processed)
5


# adding two numbers:
5 + 4

# 5 cubed:
5 ^ 3

# seeing R on-screen representation
# of pi (rounded, of course) :
pi

# To create a vector of numbers using the
# combine operator:
c(3, 4, 7)

# To create an object which will be stored
# in your directory:
x <- c(3, 4, 7)

# turning <- the other way around
c(3, 4, 7) -> x

# create an object 'temp' just like x
temp <- x

# temp is equivalent to x
temp

# we change what x is:
x <- c(x[1], 18, 6, x[2:3])
x

# Notice that temp does not change....why not'
temp

# To list the objects in your directory:
ls()

# To remove 'temp' object from your directory:
rm(temp)
ls()

# To view x:
x

# To view the second element of x:
x[2]

# note that in general the square brackets []
# pull out an entry from a vector or matrix
# To view the first and third elements of x:
x[c(1, 3)]

# An example of how to create a 2 ' 3 matrix:
# The last two arguments are the numbers of rows and columns
y <- matrix(c(1, 2, 3, 4, 3, 4), nrow = 2, ncol = 3)

# To view the matrix, y:
y

# To view the first row of y:
y[1,]

# To view the second and third columns of y:
y[, c(2, 3)]

# You can create your own functions
# using the following format:
# newfunc <-function(args) {
#    commands in body of function
# }

# An example of a user written function
# to find the approximate derivative of
# a function f:
# MUST READ IN ALL LINES AT ONCE:
derivf <- function(x) {
  (f(x + 0.001)
   - f(x)) / 0.001
}

# Let's say that f has been defined as:
f <- function(x) {
  x ^ 3 + x ^ 2 + x + 10
}

# The derivative of f is
# obviously 3 x 2 +2x +1. Let's
# evaluate this true derivative
# and the approximate derivative
# (using the function derivf) for
# several values of x:

# this produces the vector (1,2,3,4,5,6)
x <- c(1:6)

# this is the exact derivative
3 * x ^ 2 + 2 * x + 1

# this is the approximate derivative
derivf(x)

### SOME USEFUL FEATURES AND FUNCTIONS
# Let's create our original object vector, x:
# Note that can use ';' to create a new line:
x <- c(3, 4, 7)
x

# this will provide all numbers
# in a vector except for the third
x[-3]

# this will produce all numbers in
# x that are greater than or equal to 5
x[x >= 5]

# Notice that arithmetic operations
# are applied to each
# element in a vector.
# For example:
x + 3

# Let z be a new vector:
z <- c(1.5, 1 / 6, 1 / 3)
z

# View only the first two
# decimal places of z:
round(z, 2)

# View z in reverse order:
rev(z)

# Order z from smallest to largest:
sort(z)

# Determine the length of the vector z:
# The length of a vector is the
# number of elements
length(z)

# Find the maximum value of z in two ways:
max(z)
sort(z)[length(z)]

# Identify the ordering of z:
# i.e., the 2nd number is the
# min and the 1st number is the max
order(z)

# Now, create a sequence of numbers:
# What happens here'
seq(1, 3, length = 5)

# Create the same sequence
# in a slightly different way:
# Did you guess correctly'
seq(1, 3, by = 0.5)

# Create another sequence
# by going from 3 to 1:
seq(3, 1, by = -0.5)

# To randomly sample with replacement
# from an existing vector:
# Here is the vector
x
# How is this sample determined'
sample(x, 10, replace = T)

# Or to randomly sample without replacement
# from a sequence of numbers from 1 to 500:
sample(1:500, 10, replace = F)

# Missing values are represented by NA:
w <- c(3, 4, NA, 5)
w

# Some functions ignore NA's:
sort(w)

# Other function, by default, do not:
mean(w)

# Two ways to determine the
# mean of the non-missing values are:
mean(w, na.rm = T)

# Equivalent expression to above
# where ! indicates 'not' an
# d is.na subsets only NA values
mean(w[!is.na(w)])

# Some functions, use 'na.omit=T
# ' instead of 'na.rm=T'
# Create a new vector by
# concatenating x and z:
c(x, z)

# Create a matrix by treating
# x and z as rows:
# rbind binds by rows
rbind(x, z)

# Create the same matrix, but
# first treat x and z as columns:
# cbind binds by columns
cbind(x, z)

# transpose it
t(cbind(x, z))

### DISTRIBUTIONAL FUNCTIONS

# Determine the height of a
# normal(0,2) random variable at x=1:
dnorm(1, mean = 0, sd = 2)
dnorm

# Determine the area to the left of
# 0 for a normal (0,1) random variable:
# for the normal dist, the default
# mean is 0 and sd is 1
pnorm(0)

# Determine the quantile corresponding
# to the probability of 0.9 for a
# normal(0,1) random variable:
qnorm(0.9)

# Generate three pseudo-random numbers
# from a normal(0,3) distribution:
rnorm(3, 0, 3)

# Do it again
rnorm(3, 0, 3)

# Do it again
rnorm(3, 0, 3)

# Why are they all different'

# Functions for other distributions
# work in a similar way.
# Remember that any manual can be
# accessed using the
# help() function.

##### PLOTTING DATA
# R has some very nice graphics capabilities.
# We'll only cover a minimal
# amount of information here.
# Let's create a mock simple
# linear regression data matrix:

# Here, the first column is the
# explanatory variable and the
# second column is the response variable.
regdata <- matrix(c(1:6, c(10, 15, 19, 26, 32, 37)), 6, 2)
regdata

# To plot the data points:
# the x-axis variable is the first argument
plot(regdata[, 1], regdata[, 2])

# To plot the data points and
# have the points connected by lines:
plot(regdata[, 1], regdata[, 2], type = 'b')

# To plot only a line:
plot(regdata[, 1], regdata[, 2], type = 'l')

# To add meaningful axis labels
# and a title to the scatterplot:
plot(
  regdata[, 1],
  regdata[, 2],
  xlab = rnorm(3, 0, 3),
  ylab = 'response',
  main = 'Regression data scatterplot'
)

# To set your own limits for the y-axis:
plot(regdata[, 1], regdata[, 2], ylim = c(0, 40))

# To plot a histogram of uniformly
# distributed (0,1) random data:
hist(runif(1000, min = 0, max = 1))

# To plot a histogram of randomly
# distributed (0,1) random data:
hist(rnorm(1000, mean = 0, sd = 1))

# The function hist allows for several useful
# options. Type 'help(hist)' for details.

# To plot the pdf of a normal(0,1)
# random variable:
plot(seq(-4, 4, 0.001),
     dnorm(seq(-4, 4, 0.001)),
     type = 'l')

# To view two graphs on the
# same plot region (i.e., page),
# one on top of the other (execute
# all three lines together):
par(mfrow = c(2, 1))
plot(seq(-4, 4, 0.001),
     dnorm(seq(-4, 4, 0.001)),
     type = 'l')
plot(seq(-4, 4, 0.001),
     dnorm(seq(-4, 4, 0.001), mean = 0,
           sd = 0.75), type = 'l')

# To add a plot to a current figure
# use points or lines:
plot(seq(-4, 4, 0.001),
     dnorm(seq(-4, 4, 0.001)),
     type = 'l')
points(seq(-4, 4, 0.001),
       dnorm(seq(-4, 4, 0.001),
             mean = 0, sd = 0.75))
lines(seq(-4, 4, 0.001),
      dnorm(seq(-4, 4, 0.001),
            mean = 0, sd = 1.25))

# Enter 'help(par)' to see the many
# options available
# for dealing with graphics.
# Many of the options (e.g., xlim, ylim)
# can be used directly with the
# plotting functions.


#################

# to see what packages are currently
# in your workspace
search() # displays packages and data frames

# to see what packages are
# installed in your working directory
library()

#### TWO-STEP PROCESS TO MAKE PACKAGE ACTIVE:
## 1. INSTALL THE PACKAGE (ONLY
# NEED DO THIS ONE TIME):
install.packages("survey")

## 2. LOAD THE PACKAGE INTO
# YOUR WORKSPACE (DO THIS EACH TIME):
library("survey")

## Reading in Data and Importing Files
# Read in a text file from URL
# and assign it to a variable in workspace:
d1 <-
  read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/worms.txt",
             header = T)
head(d1) # to display first six records

# Read in a text file from your hard drive:
d2 <- read.table("worms.missing.txt", header = T)
head(d2) # first six records
tail(d2) # to show last 6 records

# Read in data interactively from keyboard
# and assign data to vector 'x':
x <- scan()
x

# ls() and objects() returns
# vector of character strings
# giving names of data sets
# and functions a user has defined
ls()

# removes all variable and
# function objects from workspace
rm(list = ls())

# returns an empty character string:
ls()

# print (list) the working directory
getwd()



## HELP COMMANDS

# Help on function solve()
help(solve)

# or, for short, just:
?solve

# On most systems have help in html by
# 'Search Engine and Keywords'
# link especially useful
help.start()


dateNow <- gsub(" ", "_", date())
dateNowFile <- paste("day-1-script", dateNow, "RData", sep = ".")
save.image(file = dateNowFile)
