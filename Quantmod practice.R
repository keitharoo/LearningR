# Quantmod practice

library(quantmod)

# Get some data from Google
getSymbols('GOOG', src = "google")

head(GOOG)

# Visualize the data so far
chartSeries(GOOG, TA = NULL)

# Adds the volume parameter
barChart(GOOG)

# Assign the closing price to a new variable
Goog_close <- Cl(GOOG)

# Plot the close price
plot(Goog_close)

# Show histogram of Google's closing price
hist(Goog_close)

# Changes the title to something more readable
hist(Goog_close, main = "Google Closing Price")

# Introduces more price ranges
hist(Goog_close, main = "Google Closing Price", breaks = 25)

# Now to experiment with some techinical indicators
chartSeries(GOOG)

# Adds moving average convergence divergence signals to the apple stock price
addMACD() 

# Adds Bollinger bands to the apple stock price.
addBBands() 

# Add Commodity channel index.
addCCI() 

# Add Directional Movement Indicator
addADX() 

#Add Chaiken Money Flow
addCMF() 

##############################################
### Other indicators supported by Quantmod ###
##############################################

# Add Chaiken Money Flow
addCMO() 

# Add Double Exponential Moving Average
addDEMA() 

# Add Detrended Price Oscillator
addDPO()

# Add Exponential Moving Average
addEMA() 

# Add Price Envelope
addEnvelope() 

# Add Exponential Volume Weigthed Moving Average
addEVWMA() 

# Add Moving Average Convergence Divergence
addMACD() 

# Add Momentum
addMomentum() 

# Add Rate of Change
addROC() 

# Add Relative Strength Indicator
addRSI() 

# Add Parabolic Stop and Reverse
addSAR() 

# Add Simple Moving Average
addSMA()

# Add Stocastic Momentum Index
addSMI()

# Add Triple Smoothed Exponential Oscillator
addTRIX() 

# Add Volume
addVo() 

# Add Weighted Moving Average
addWMA()

#####
#   #
#####

# Shows the object holding the Google data is xts and zoo
class(GOOG)

# Checks to see if the xts data has open, high, low, and close
is.OHLC(GOOG)

# Checks whether the data object has volume
has.Vo(GOOG) 

# To check the highest point of price.
seriesHi(GOOG) 

#One period lag of the closing price
Lag(Cl(GOOG)) 

#The next periods open to close - today!
Next(OpCl(GOOG)) 

#Fetches all Google’s 2007 OHLC
GOOG ['2007'] 

# Google data, from 2008 onward
GOOG ['2008::'] 

# Returns by day
dailyReturn(GOOG) 

# Returns by week
weeklyReturn(GOOG) 

# month, indexed by yearmon  daily,weekly,monthly,quarterly, and yearly
monthlyReturn(GOOG) 

# note the plural
allReturns(GOOG) 
