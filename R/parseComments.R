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
library(mongolite)

# Environment variables on your local machine will hold the connection strings
Sys.getenv("R_TEST")
connect_remote <- Sys.getenv("db_remote")
connect_local <- Sys.getenv("db_local")

comments_dest = mongo(collection="comments", db="companies", url=connect_local)
# You can verify that your code is now connected to the MongoDB collection by 
# checking the total number of documents in this database. 
# To do so, use the count() method.

comments_dest$count()

# This is the record to use as the $gte in the remote
lr <- comments_dest$find(sort = '{"created_at": -1}', limit = 1)
lr
date_bst <- lr$created_at -60*60
date_bst

dte <- strftime(date_bst , "%Y-%m-%dT%H:%M:%S")
dte
dte <- paste(dte, "Z", sep="")
dte
typeof(dte)


# Rest of code here ---
# Get connection to the remote mongoDB (connect_remote)

comments_source = mongo(collection="customer_feedback", db="customer_feedback", 
    url=connect_remote)

comments_source$count() # works with VPN on
# Get all comments with a $gte lr
q <- paste0('{"created_at": { "$gte" : { "$date" : "', dte, '" }}}')
q
lrs <- comments_source$find(
  query = q,
  fields = '{"_id": false, "data.customer_email": false }'
)
lrs
lrs[1,] # This should be the last entry in the local batch
nrow(lrs)
lrs <- lrs[-c(1), ]

# lrs$created_at <- lr$created_at -60*60
lrs
feedback <- do.call("data.frame", lrs)
feedback
# Find the last entry date in the local collection
# Use that as a $gte for the remote collection
# Retrieve those records
# Parse those records using the code below
# Write those records to the local DB

# Get the dataframe from the download directory
# setwd('../data/feedback')
# feedback = read.csv('customer_feedback.csv', header = TRUE)
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
df_final <- df2[, c("created_at", "data.customer_feedback",
  "data.customer_name")]

# Append the final column - company number
df_final$company_number = df2$company_split[,2]

glimpse(df_final)

df_out <- df_final %>% 
  rename(
    customer_feedback = data.customer_feedback,
    customer_name = data.customer_name
  )

glimpse(df_out)
## # A tibble: 150 x 5

# Write the finished dataset back to the working directory
# write.csv(df_final, "comments.csv", row.names = FALSE)

# comments_dest = mongo(collection="comments_backup", db="companies", url=connect_local)
comments_dest$insert(df_out)

