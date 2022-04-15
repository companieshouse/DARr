# Make a dataframe with 600 data points using stratified sampling

library(dplyr)
library(tidyverse)

# Declare some Parameters
sam_n = 60.0

# Make this example reproducible
set.seed(1)

# Create the spend figures per group
s1 <- abs(rnorm(150, mean=35, sd=5))
s2 <- abs(rnorm(150, mean=30, sd=5))
s3 <- abs(rnorm(150, mean=20, sd=5))
s4 <- abs(rnorm(150, mean=15, sd=5))

spend = c(s1, s2, s3, s4)
spend

#create data frame
df <- data.frame(group = rep(c('LH C', 'LH FO', 'SH C', 'SH FO'), each=150),
                 spend)

df <- tibble::rowid_to_column(df, "ID")

#view first six rows of data frame
head(df)

# Descriptive Statistics for the whole population
summary(df)
df %>% glimpse()
ggplot(data = df, aes(x = spend)) +
  geom_histogram(bins=40, fill = 'purple')

# Create a sampling function
sampling_function <- function(df_name) {
  
  samID <- sample(df_name$ID, size = sam_n)
  # print("hello from your function")
  sam <- filter(df_name, ID %in% samID)
  print(sam)
  return (sam)
}

# Get a test sample
sam <- sampling_function(df)
sam

# Get the confidence inteval for 95% manually
sam_mean = mean(sam$spend)
sam_sd = sd(sam$spend)
standard_error = sam_sd / sqrt(sam_n)
standard_error
int_low = sam_mean - (1.96 * standard_error)
int_high = sam_mean + (1.96 * standard_error)
print(paste("Mean", sam_mean, " 95% [", int_low, ",", int_high, "]"))

# Get the same inteval using a model
test <- lm(spend ~ 1, sam)
summary(test)
confint(test, level=0.95)


# Summary of our sample
summary(sam)
sam %>% glimpse()
ggplot(data = sam, aes(x = spend)) +
  geom_histogram(bins=15, fill = 'green')

# Generate a Sampling Distribution in R
# Define number of samples
n = 5000

# Create empty vector of length n
sample_means = rep(NA, n)

# Fill empty vector with means
for(i in 1:n){
  sample_means[i] = c(mean(sampling_function(df)$spend))
}

# View first six sample means
head(sample_means)

#create histogram to visualize the sampling distribution
hist(sample_means, main = "Sampling Distribution", xlab = "Sample Means", col = "steelblue")

ggplot(mapping = aes(x = sample_means)) +
  geom_histogram(bins=n/10, fill = 'purple')

summary(sample_means)
summary(df$spend)

# The more samples there are, the close the two means will be.
