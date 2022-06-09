# This file runs tests on file size differences between .csv and .parquet data

library(arrow, warn.conflicts = FALSE)
library(dplyr, warn.conflicts = FALSE)
library(palmerpenguins)

# Use the penguins data set for a small test
data(penguins, package = "palmerpenguins")

penguins

# Write the penguins dataset as a parquet file to compare file sizes
# Change the working directory back to DARr

write_parquet(penguins, "penguins.parquet")
write.csv(penguins, "penguins.csv")

# What's the difference in size for the same data?


# Companies House dataset for a big test!
# Read the test file into a variable (2.3GB so takes a while)
# Set working directory

file_name = 'BasicCompanyDataAsOneFile-2022-06-01' # manually enter the file name stem here

fin = paste0(file_name, '.csv')
fout = paste0(file_name, '.parquet')

# my_test <- read.csv(fin, header=TRUE)
df <- read.csv(fin, header=TRUE)

str(df)

write_parquet(df, fout)

# How big is the parquet version of the file?
# 364 MB - so less than 16% of the size!




