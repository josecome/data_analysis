library(tseries)

# Getting data
set.seed(250)
timeseries=arima.sim(list(order = c(1,1,2), ma=c(0.26,0.38), ar=0.6), n = 100)

# Timeseries plot
plot(timeseries)

# Checking stationarity
adf.test(timeseries) # if p > 0.005, time series is not stationary

# Differentiate one time
timeseries2 = diff(timeseries)

# Timeseries plot
plot(timeseries2)

# Check again stationarity
adf.test(timeseries2) # if p < 0.005, time series is stationary

# Checking order of ARMA, I is 1
acf(timeseries)
pacf(timeseries)



# Spliting data into train and test
train_series=timeseries[1:90]
test_series=timeseries[91:100]

# Propose models
arimaModel_1=arima(train_series, order=c(0,1,2))
arimaModel_2=arima(train_series, order=c(1,1,0))
arimaModel_3=arima(train_series, order=c(1,1,2))

# Choose the best (with smaller AIC)
print(arimaModel_1)
print(arimaModel_2)
print(arimaModel_3) # smaller AIC

# Predicting values
forecast_3 = predict(arimaModel_3, 10)

# Printing predicted values
forecast_3







