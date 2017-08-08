### ARIMA modeling in R ###

### Chapter 1 ###
# View a detailed description of AirPassengers
help(AirPassengers)

# Plot AirPassengers
plot(AirPassengers)

# Plot the DJIA daily closings
plot(djia$Close)

# Plot the Southern Oscillation Index
plot(soi)

# Stationarity and nonstationarity
# Constant over time and no trend (mean is constant)
# If stationary, we can estimate by averaging
# Plot detrended y (trend stationary)
plot(diff(y))

# Plot detrended x (random walk)
plot(diff(x))

# Plot globtemp and detrended globtemp
par(mfrow = c(2,1))
plot(globtemp) 
plot(diff(globtemp))

# Plot cmort and detrended cmort
par(mfrow = c(2,1))
plot(cmort)
plot(diff(cmort))

# astsa and xts are preloaded 

# Plot GNP series (gnp) and its growth rate
par(mfrow = c(2,1))
plot(gnp)
plot(diff(gnp))
plot(log(gnp))

# Plot DJIA closings (djia$Close) and its returns
par(mfrow = c(2,1))
plot(djia$Close)
plot(diff(djia$Close))
plot(log(djia$Close))

# Generate and plot white noise
WN <- arima.sim(model = list(order = c(0, 0, 0)), n = 200)
plot(WN)

# Generate and plot an MA(1) with parameter .9 by filtering the noise
MA <- arima.sim(model = list(order = c(0, 0, 1), ma = .9), n = 200)  
plot(MA)

# Generate and plot an AR(1) with parameters 1.5 and -.75
AR <- arima.sim(model = list(order = c(2, 0, 0), ar = c(1.5, -.75)), n = 200) 
plot(AR)

