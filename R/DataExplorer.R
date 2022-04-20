# install.packages("tidyverse")
library(dplyr)
library(readr)


# read csv file
df <- 
  read_delim(
    file = "../data/companies.csv")


# pre-processing
# df <- 
  # remove the id
  # select(df, -id) %>%
  # age: days -> years
  # mutate(age = round(age / 365))


# observe first rows
head(df)
summary(df)

# install.packages("DataExplorer")
library(DataExplorer)


df %>%
  create_report(
    output_format = html_document(toc = TRUE, toc_depth = 6, theme = "yeti"),
    output_file = "report.html",
    output_dir = getwd(),
    y = NULL,
    config = configure_report(),
    report_title = "Data Profiling Report"
  )
