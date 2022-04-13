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

# Get the data frame from the download directory
setwd('../data/companies')
companies = read.csv('BasicCompanyDataAsOneFile-2022-04-01.csv', header = TRUE)

# Get a random sample of the dataframe and use this to test Neo4j
mysample <- companies[sample(1:nrow(companies), 5000, replace=FALSE),]
nrow(mysample)
write.csv(mysample, "companies_sample.csv", row.names = FALSE)

# remove non printing characters
companies$CompanyName <- gsub("[^\x20-\x7F]","",companies$CompanyName)
companies$CompanyName <- gsub("'","",companies$CompanyName)

# Write the finished data frame back to the working directory
write.csv(companies, "companies.csv", row.names = FALSE)
companies$CompanyName
