

### US Inflation Rates with us_infl.csv

# Data import via scan
mydata = scan()

# First exploratory plot
plot.ts(mydata)

# Converting to a time series
usinfl = ts(mydata, start = 2003, frequency = 12)

# Time series plot with proper x axis
plot(usinfl)

# Seasonal decomposition
decompose(usinfl)

# Visualization
plot(decompose(usinfl))

# STL decomposition
plot(stl(usinfl, s.window = 7))

# stl forecasting
plot(stlf(usinfl, method = "ets"))

# comparison with a standard ets forecast
plot(forecast(ets(usinfl), h = 24))

# using autoplot
library(ggplot2)
autoplot(stlf(usinfl, method = "ets"))

# seasonal arima
auto.arima(usinfl, stepwise = F, 
           approximation = F, 
           trace = T)

# creating the object
usinflarima = auto.arima(usinfl, 
                             stepwise = F, 
                             approximation = F, 
                             trace = T)

# forecasting
forec = forecast(usinflarima)

# forecast plot
plot(forec)

# ARIMA(0,1,1)(0,1,1)(12) catch all model
usinflarima2 = Arima(usinfl, 
                     order = c(0, 1, 1), 
                     seasonal = c(0, 1, 1))

# forecast and plot
forec = forecast(usinflarima2)
plot(forec)


# Holt Winters exponential smoothing 
plot(hw(usinfl, h = 24))

# forecast of ets
plot(forecast(ets(usinfl), h = 24))

# monthplot
ggmonthplot(usinfl)

# seasonplot
ggseasonplot(usinfl)
