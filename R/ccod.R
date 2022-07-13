library(dplyr)

file_name <- 'CCOD_FULL_2022_07.csv' # manually enter the file name stem here

# my_test <- read.csv(fin, header=TRUE)
df <- read.csv(fin, header=TRUE)

# observe first rows
head(df)
summary(df)

names(df)
# Rename a couple of rows
head(df$Company.Registration.No...1.)
df = rename(df, company_number = Company.Registration.No...1.)
df = rename(df, category = Proprietorship.Category..1.)

# Filter out any local aithority owned titles
head(df$category)
df2 <- filter(df, company_number != "")
df2
summary(df2)
head(df2)

#write output file
write.csv(df2, file="mongo_import.csv")
