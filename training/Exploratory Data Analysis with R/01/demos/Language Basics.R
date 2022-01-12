# Assignment operators
x <- "Hello World!"
y = "Hello World!"
"Hello World!" -> z

# Implicit printing
print(x)
x

# Creating variables
l <- TRUE
i <- 123L
n <- 123.45
c <- "ABC 123"

# Displaying variables
l
i
n
c

# Creating a function
f <- function(x) { x + 1 }

# Invoking a function
f(2)

# Creating a vector
v <- c(1, 2, 3);
v

# Creating a sequence
s <- 1:5
s

# Creating a matrix
m <- matrix(data = 1:6, nrow = 2, ncol = 3)
m

# Creating an array
a <- array(data = 1:8, dim = c(2, 2, 2))
a

# Creating a list
l <- list(TRUE, 1L, 2.34, "abc")
l

# Creating a set of factors
factors <- factor(c("Male", "Female", "Male", "Male", "Female"))
levels(factors)
unclass(factors)

# Creating a data frame
df <- data.frame(
  Name = c("Cat", "Dog", "Cow", "Pig"), 
  HowMany = c(5, 10, 15, 20),
  IsPet = c(TRUE, TRUE, FALSE, FALSE))
df

# Indexing data frames by row and column
df[1, 2]

# Indexing data frames by row
df[1, ]

# Indexing data frames by column
df[ , 2]
df[["HowMany"]]
df$HowMany

# Subsetting data frames
df[c(2, 4), ]
df[2:4, ]
df[c(TRUE, FALSE, TRUE, FALSE), ]
df[df$IsPet == TRUE, ]
df[df$HowMany > 10, ]
df[df$Name %in% c("Cat", "Cow"), ]

# Vectorized operations
1 + 2
c(1, 2, 3) + c(2, 4, 6)

# Named arguments vs. ordered arguments
m <- matrix(data = 1:6, nrow = 2, ncol = 3)
n <- matrix(1:6, 2, 3) 
m == n
identical(m, n)

# Installing packages (command line)
install.packages("ggplot2")

# Loading libraries
library(ggplot2)

# Viewing help
?nrow
