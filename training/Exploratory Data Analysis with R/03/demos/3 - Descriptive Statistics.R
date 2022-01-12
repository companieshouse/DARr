# Set working directory
setwd("C:/Pluralsight")

# Load CSV data
movies <- read.csv(
  file = "Movies.csv",
  quote = "\"")

genres <- read.csv(
  file = "Genres.csv",
  quote = "\"")

# Convert Rating to a factor
movies$Rating <- as.factor(movies$Rating)

# Peek at data
head(movies)

head(genres)

# Univariate statistics for qualitative variables
table(movies$Rating)

table(genres$Genre)

# Univariate statistics for quantitative variables

# Analyze the location of a quantitative variable
mean(movies$Runtime)

median(movies$Runtime)

which.max(table(movies$Runtime))

# Analyze the spread of a quantitative variable
min(movies$Runtime)

max(movies$Runtime)

range(movies$Runtime)

diff(range(movies$Runtime))

quantile(movies$Runtime)

quantile(movies$Runtime, 0.25)

quantile(movies$Runtime, 0.90)

IQR(movies$Runtime)

var(movies$Runtime)

sd(movies$Runtime)

# Analyze the shape of a quantitative variable
install.packages("moments")

library(moments)

skewness(movies$Runtime)

kurtosis(movies$Runtime)

plot(density(movies$Runtime))

# Summarize a quantitative variable
summary(movies$Runtime)

# Bivariate statistics for two qualitative variables
table(genres$Genre, genres$Rating)

# Bivariate statistics for two quantitative variables

# Covarience
cov(movies$Runtime, movies$Box.Office)

cov(movies$Critic.Score, movies$Box.Office)

# Correlation coefficients
cor(movies$Runtime, movies$Box.Office)

cor(movies$Critic.Score, movies$Box.Office)

# Bivariate statistics for both a qualitative and quantitative variable
tapply(movies$Box.Office, movies$Rating, mean)

tapply(genres$Box.Office, genres$Genre, mean)

# Summarize entire table
summary(movies)

