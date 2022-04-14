packages = c('funModeling', 'haven', 'corrplot', 'tidyverse')
for (p in packages){
  if(!require(p, character.only = T)){
    install.packages(p)
  }
  library(p, character.only = T)
}

# Read the test file into a variable
my_test <- read.csv('example_data_set.csv', header=TRUE)
my_test

# Understanding the structure of a dataset
str(my_test)

# Transform columns to dates
my_test$DissolutionDate <- as.Date(my_test$DissolutionDate, format = "%d/%m/%y")
my_test$IncorporationDate <- as.Date(my_test$IncorporationDate, format = "%d/%m/%y")
my_test$Accounts.NextDueDate <- as.Date(my_test$Accounts.NextDueDate, format = "%d/%m/%y")
my_test$Accounts.LastMadeUpDate <- as.Date(my_test$Accounts.LastMadeUpDate, format = "%d/%m/%y")
my_test$Returns.NextDueDate <- as.Date(my_test$Returns.NextDueDate, format = "%d/%m/%y")
my_test$Returns.LastMadeUpDate <- as.Date(my_test$Returns.LastMadeUpDate, format = "%d/%m/%y")
my_test$ConfStmtNextDueDate <- as.Date(my_test$ConfStmtNextDueDate, format = "%d/%m/%y")
my_test$ConfStmtLastMadeUpDate <- as.Date(my_test$ConfStmtLastMadeUpDate, format = "%d/%m/%y")

# Glimpse comes from the dply package
glimpse(my_test)

# Remove some extraneous previous name fields
my_test <- my_test %>%
  select(-PreviousName_2.CONDATE, -PreviousName_2.CompanyName, -PreviousName_3.CONDATE, -PreviousName_3.CompanyName,
         -PreviousName_4.CONDATE, -PreviousName_4.CompanyName, -PreviousName_5.CONDATE, -PreviousName_5.CompanyName, 
         -PreviousName_6.CONDATE, -PreviousName_6.CompanyName, -PreviousName_7.CONDATE, -PreviousName_7.CompanyName,
         -PreviousName_8.CONDATE, -PreviousName_8.CompanyName, -PreviousName_9.CONDATE, -PreviousName_9.CompanyName,
         -PreviousName_10.CONDATE, -PreviousName_10.CompanyName)


# Changes blank fields to NA
my_test[my_test==""] <- NA

status(my_test)

# Ordering report by the percentage of zeros
my_status <- status(my_test)
my_status

arr_by_zero <- arrange(my_status, -p_zeros) %>%
  select(variable, q_zeros, p_zeros, unique)

arr_by_zero

# Ordering by quantity of NAs
arr_by_NA <- arrange(my_status, q_na) %>%
  select(variable, q_na, p_na, unique)

arr_by_NA

# Data Integrity
data_integrity(my_test)

# Descriptive Statistics
summary(my_test)

# Profile_num
# Get a metric table with many indicators for all numerical variables, 
# automatically skipping the non-numerical variables. 
# Current metrics are: mean, std_dev: standard deviation, 
# all the p_XX: percentile at XX number, skewness, kurtosis, 
# iqr: inter quartile range, 
# variation_coef: the ratio of sd/mean, range_98 is the limit for which the 98
profiling_num(my_test)

# ggplot2 histogram of Accounts.AccountRefDay
ggplot(my_test, aes(x=Accounts.AccountRefDay)) + geom_histogram()

# Use plot_num to profile continuous variables
plot_num(my_test, bins = 15)

# Frequency Distributions
freq(my_test)

# Probability Density
plotar(my_test, target = 'CompanyStatus', plot_type = "histdens")
