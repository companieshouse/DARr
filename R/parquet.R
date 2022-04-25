library(arrow, warn.conflicts = FALSE)
library(dplyr, warn.conflicts = FALSE)

# Read the test file into a variable
my_test <- read.csv('BasicCompanyDataAsOneFile-2022-03-01.csv', header=TRUE)
my_test

# Use the penguins data set
data(penguins, package = "palmerpenguins")

penguins

# Create a temporary file for the output
parquet = tempfile(fileext = ".parquet")
write_parquet(penguins, sink = parquet)

fp = getwd()
write_parquet(penguins, ".parquet")

