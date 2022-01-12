# Load Iris data
data(iris)

# Peek at the data
head(iris)

# Look at unique species
unique(iris$Species)

# Create scatterplot matrix
plot(iris[1:4])

# Create a scatterplot of petal length vs width
plot(
  x = iris$Petal.Length, 
  y = iris$Petal.Width)

# Create a linear regression model
x <- iris$Petal.Length

y <- iris$Petal.Width

model <- lm(y ~ x)

# Draw linear regression model on plot
lines(
  x = iris$Petal.Length,
  y = model$fitted, 
  col = "red",
  lwd = 3)

# Get correlation coefficient
cor(
  x = iris$Petal.Length, 
  y = iris$Petal.Width)

# Summarize the model
summary(model)

# Predict new unknown values from the model
predict(
  object = model, 
  newdata = data.frame(x = c(2, 5, 7)))
