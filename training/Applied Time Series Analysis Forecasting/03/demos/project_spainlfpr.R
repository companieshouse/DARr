
#### Project Trending Data - Spain LFPR

spain = ts(spain$x, start = 1980)

plot(spain, ylab = "Labor Force Participation Rate 25-54")


# Exponential smoothing with holt
library(forecast)
holttrend = holt(spain, h = 5)
summary(holttrend)
plot(holttrend)

# Phi auto generated
plot(holt(spain, h = 15, damped = T))
# To see the generated value for phi
summary(holt(spain, h = 15, damped = T))

# Manual setting of phi
plot(holt(spain, h = 15, damped = T, phi = 0.8))


# Arima auto generated
spainarima = auto.arima(spain, 
                        stepwise = F, 
                        approximation = F)

summary(spainarima)

plot(forecast(spainarima, h = 5))


# Overview plot
holttrend = holt(spain, h = 10)
holtdamped = holt(spain, h = 10, damped = T, phi = 0.8)
arimafore = forecast(spainarima, h = 10)

library(ggplot2)
# 3 Forecast Lines as Comparison
autoplot(spain) +
  forecast::autolayer(holttrend$mean, series = "Holt Linear Trend") +
  forecast::autolayer(holtdamped$mean, series = "Holt Damped Trend") +
  forecast::autolayer(arimafore$mean, series = "ARIMA") +
  xlab("year") + ylab("Labour Force Participation Rate Age 25-54") + 
  guides(colour=guide_legend(title="Forecast Method")) + theme(legend.position = c(0.8, 0.2)) +
  ggtitle("Spain") + theme(plot.title=element_text(family="Times", hjust = 0.5, color = "blue", face="bold", size=15))
