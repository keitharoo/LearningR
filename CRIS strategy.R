# Sample trading strategy
# https://www.quantinsti.com/blog/an-example-of-a-trading-strategy-coded-in-r/

library(quantmod)

getSymbols('CRIS')

chart_Series(CRIS, TA = NULL)

data <- CRIS[, 4]

macd <- MACD(data, nFast = 12, nSlow = 26, nSig = 9, maType = SMA, percent = FALSE)

chartSeries(CRIS, TA = "addMACD()")

signal <- Lag(ifelse(macd$macd < macd$signal, -1, 1))

returns <- ROC(data) * signal

portfolio <- exp(cumsum(returns))

plot(portfolio)
### error here ###

table.Drawdowns(ret, top=10)
table.DownsideRisk(ret)
charts.PerformanceSummary(ret)