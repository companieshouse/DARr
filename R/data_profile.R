# install.packages("tidyverse")
library(dplyr)
library(readr)


# read csv file
df <- 
  read_delim(
    file = "/data/cardio_train.csv",
    col_types = "iifidiiffffff",
    delim=";")


# pre-processing
df <- 
  # remove the id
  select(df, -id) %>%
  # age: days -> years
  mutate(age = round(age / 365))


# observe first rows
head(df)