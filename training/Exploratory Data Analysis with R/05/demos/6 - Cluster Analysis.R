# Load Iris data
data(iris)

# Peek at the data
head(iris)

# Look at unique species
unique(iris$Species)

# Create a scatterplot matrix colored by species
plot(
  x = iris[1:4], 
  col = as.integer(iris$Species))

# View scatterplot of petal length vs width
plot(
  x = iris$Petal.Length, 
  y = iris$Petal.Width)

# Color scatterplot by species
plot(
  x = iris$Petal.Length, 
  y = iris$Petal.Width, 
  col = as.numeric(iris$Species))

# Create K-means clusters
clusters <- kmeans(
  x = iris[, 1:4], 
  centers = 3, 
  nstart = 10)

# Plot each cluster as a shape
plot(
  x = iris$Petal.Length, 
  y = iris$Petal.Width, 
  col = as.numeric(iris$Species), 
  pch = clusters$cluster)

# Plot centroid of clusters
points(
  x = clusters$centers[, "Petal.Length"], 
  y = clusters$centers[, "Petal.Width"],
  pch = 4, 
  lwd = 4, 
  col = "blue")

# View a table of the clusters
table(
  x = clusters$cluster, 
  y = iris$Species)

