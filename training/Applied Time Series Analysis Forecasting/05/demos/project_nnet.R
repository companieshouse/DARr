

## Import Data Vista98 as revenue


# check the quotes while importing to get 2 columns
class(revenue$V2)

# chopping off the useless quotes at 2 positions
library(tidyr)
revenue <- separate(revenue, col = V2, 
                    sep = c(2, -3), 
                    into = c("rest", "data", "rest2"))

# all the relevant data is in column "data"
head(revenue)

# class is still a character (with some missing data)
class(revenue$data)

# conversion to time series
myts <- ts(as.numeric(revenue$data),
           start = 1998, frequency = 12)

# data is still not clean (outliers and NAs)
summary(myts)

# all in one cleaning tool
library(forecast)
myts <- tsclean(myts)

# check the data
summary(myts)

plot(myts)

# set up a Neural Network model
mynnetar <- nnetar(myts)

# forecasting 3 years with the model
nnetforecast <- forecast(mynnetar, h = 36, PI = T)
library(ggplot2)
autoplot(nnetforecast)


## interactive dygraph

# data we need for the graph
data <- nnetforecast$x
lower <- nnetforecast$lower[,2]
upper <- nnetforecast$upper[,2]
pforecast <- nnetforecast$mean

mydata <- cbind(data, lower, upper, pforecast)



dygraph(mydata, main = "Beach Restaurant") %>% 
  dyRangeSelector() %>% 
  dySeries(name = "data", label = "Revenue Data") %>%
  dySeries(c("lower","pforecast","upper"), label = "Revenue Forecast") %>%
  dyLegend(show = "always", hideOnMouseOut = FALSE) %>%
  dyAxis("y", label = "Monthly Revenue USD") %>%
  dyHighlight(highlightCircleSize = 5,
              highlightSeriesOpts = list(strokeWidth = 2)) %>%
  dyOptions(axisLineColor = "navy", gridLineColor = "grey")


