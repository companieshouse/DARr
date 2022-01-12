# Set working directory
setwd("C:/Pluralsight")

# Load CSV data
movies <- read.csv("Movies.csv", quote = "\"")

genres <- read.csv("Genres.csv", quote = "\"")

# Peek at the data
head(movies)

head(genres)

# Convert Rating to a factor
movies$Rating <- as.factor(movies$Rating)

# Univariate visualizations for
# a qualitiative variable

# Create a bar graph of rating observations
plot(movies$Rating)

# Create a pie chart of rating observations
pie(table(movies$Rating))

# Univariate visualizations of
# a quantitiative variable

# Create a dot plot of runtime
plot(
  x = movies$Runtime, 
  y = rep(0, nrow(movies)), 
  ylab = "", 
  yaxt = "n")

# Create a boxplot of runtime
boxplot(
  x = movies$Runtime, 
  xlab = "Runtime (minutes)", 
  horizontal = TRUE)

# Create a histogram of runtime
hist(movies$Runtime)

# Create a more course-grain histogram
hist(
  x = movies$Runtime,
  breaks = 10)

# Create a more fine-grain histogram
hist(
  x = movies$Runtime,
  breaks = 30)

# Create a density plot of runtime
plot(density(movies$Runtime))

# Add dot plot to base of density plot
points(
  x = movies$Runtime, 
  y = rep(-0.0005, nrow(movies)))

# Bivariate visualizations for
# two qualitiative variables

# Create a spineplot of genre and rating
spineplot(
  x = genres$Genre, 
  y = genres$Rating)

# Create a mosaic plot of genre and rating
mosaicplot(
  x = table(
    genres$Genre, 
    genres$Rating),
  las = 3)

# Bivariate visualizations for 
# two quantitiative variables

# Create a scatterplot of runtime and box office
plot(
  x = movies$Runtime, 
  y = movies$Box.Office)

# Create a scatterplot of critic score and box office
plot(
  x = movies$Critic.Score, 
  y = movies$Box.Office)

# Plot a line graph of count of movies by year
plot(
  x = table(movies$Year),
  type = "l")

# Bivariate visualizations for both a 
# qualitiative and quantitiative variable

# Create a bar graph of average box office by rating
barplot(tapply(movies$Box.Office, movies$Rating, mean))

# Create a bar graph of average box office by genre
barplot(
  height = tapply(genres$Box.Office, genres$Genre, mean),
  las = 3)

# Plot bivariate box plots of box office by rating
plot(
  x = movies$Rating, 
  y = movies$Box.Office)

# Summarizing an entire table

# Create a scatterplot matrix
plot(movies)

# Cleaning up data visualizations

# Create a bar chart with defaults
plot(movies$Rating)

# Clean up the bar chart
plot(
  x = movies$Rating,
  main = "Count of Movies by Rating",
  xlab = "Rating Category",
  ylab = "Count of Movies",
  col = "#b3cde3")

# View help for plots and parameters
?plot
?par

