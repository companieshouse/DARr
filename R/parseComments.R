# Package Names
packages <- c("urltools", "ggplot2", "dplyr")

# Install packages not yet installed
installed_packages <- packages %in% rownames(install.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

library(dplyr)
library(tidyr)
library(stringr)
library(urltools)

# Get the dataframe from the download directory
setwd('../data/feedback')
feedback = read.csv('customer_feedback.csv', header = TRUE)
glimpse(feedback)

# Split the URL into additional columns (data.source_url)
feedback$url_raw = url_parse(feedback$data.source_url)
feedback 

# Split the resulting column url_raw$path on '/'
feedback$company_split <- str_split_fixed(feedback$url_raw$path, "/", 3)
feedback 

# Create a new dataset with only companies in the url
df2 <- subset(feedback, company_split[,1]=="company")
glimpse(df2)

# Create the final dataset by selecting only the columns we need
df_final <- df2[, c("created_at", 
  "data.customer_email", "data.customer_feedback",
  "data.customer_name")]

# Append the final column - company number
df_final$company_number = df2$company_split[,2]

# Write the finished dataset back to the working directory
write.csv(df_final, "comments.csv", row.names = FALSE)
