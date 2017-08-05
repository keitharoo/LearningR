# Compare fundamentals of two public companies

library(quantmod)

# Let's compare Apple and Google
firm1 <- "AAPL"
firm2 <- "GOOG"

# Let's get price information
getSymbols(firm1, src = 'google')
getSymbols(firm2, src = 'google')

# Fetch financial data for both firms
getFinancials(firm1)
getFinancials(firm2)

# Look at the quarterly income statements for both firms
viewFinancials(AAPL.f, "IS", "Q")
viewFinancials(GOOG.f, "IS", "Q")

