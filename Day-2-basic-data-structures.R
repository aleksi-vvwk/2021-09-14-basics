###########################################################
#####                                                 #####
#####              BASIC DATA STRUCTURES              #####
#####                                                 #####
###########################################################

## BASIC DATA STRUCTURES
# vectors
c(1, 2, 6, 4, 8)
x <- c(88, 5, 15, 44)
x

# vectors are addressable
x <- c(88, 5, 15, 44)
x[1:3]
x <- c(x[1:3], 168, x[4])
x

# vector elements can have names
v <- c(10, 20, 30)
names(v) <- c("Moe", "Larry", "Curly")
print(v) # note: same as typing "v" at prompt
v[1]
v[2:3]
c(v[1], v[3])

# matrix is a vector with two dimensions
A <- 1:6 # A is a vector at this point
print(A) # same as expressing, or evaluating, A
dim(A) <- c(2, 3) # Force vector A to be 2 x 3
print(A) # Now A is a matrix, no longer a vector

# list is an ordered collection of objects
e <- list(thing = "hat", size = "8.25")
e

# can reference list components and elements with subscripts
e[1]
e[[1]]
e[2]
e[[2]]
e[3]

# can combine data structures using list() function
x1 <- c(1, 2, 3)
x2 <- c(c("a", "b", "c", "d"), c(1, 2, 3))
x3 <- 3
x4 <- matrix(nrow = 2, ncol = 2)
x4[, 1] <- c(1, 2)
x4[, 2] <- c(3, 4)
Y <- list(x1 = x1,
          x2 = x2,
          x3 = x3,
          x4 = x4)
Y  # What appears when we type Y at R prompt?

# data frame is a list
# here is data frame for wins/losses in National League East:
teams <- c("PHI", "NYM", "FLA", "ATL", "WSN") # character vector
w <- c(92, 89, 94, 72, 59) # numeric vector
l <- c(70, 73, 77, 90, 102) # numeric vector
nleast <- data.frame(teams, w, l) # data frame
nleast

# can refer to components using $ operator
nleast$w
nleast$teams == "FLA"
nleast$l[nleast$teams == "FLA"]


dateNow <- gsub(" ", "_", date())
dateNowFile <- paste("day-2-ds", dateNow, "RData", sep = ".")
save.image(file = dateNowFile)
