# Curis analysis

library(quantmod)

getSymbols('CRIS')
head(CRIS)

chartSeries(CRIS, TA = NULL)

barChart(CRIS)

Curis_close <- Cl(CRIS)
plot(Curis_close)

hist(CRIS[, 4])

chart_Series(CRIS)

# Add moving average convergence divergence signals
addMACD()

# Add Bollinger bands
addBBands()

# Add commodity channel index
addCCI()

# Add directional movement indicator
addADX()

# Add momentum
addMomentum()

# Fetches daily return
daily <- dailyReturn(CRIS)
plot(daily)

# Fetches weekly return
weekly <- weeklyReturn(CRIS)
plot(weekly)

# Fetches all returns
all_returns <- allReturns(CRIS)
plot(all_returns)
