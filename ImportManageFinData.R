# Use Quandl to download weekly returns data
# CL and BZ Quandl codes
quandl_codes <- c("CME/CLH2016","CME/BZH2016")

# Download quarterly CL and BZ prices
qtr_price <- Quandl(quandl_codes, type = "xts", collapse = "quarterly")

# View the high prices for both series
Hi(qtr_price)

# Download quarterly CL and BZ returns
qtr_return <- Quandl(quandl_codes, type = "xts", collapse = "quarterly", transform = "rdiff")

# View the settle price returns for both series
getPrice(qtr_return, prefer = "Settle")

# Call head on each object in data_env using eapply
data_list <- eapply(data_env, head)

# Merge all the list elements into one xts object
data_merged <- do.call(merge, data_list)

# Ensure the columns are ordered: open, high, low, close
data_ohlc <- OHLC(data_merged)

# Symbols
symbols <- c("AAPL", "MSFT", "IBM")

# Create new environment
data_env <- new.env()

# Load symbols into data_env
getSymbols(symbols, env = data_env)

# Extract the close column from each object and combine into one xts object
close_data <- do.call(merge, eapply(data_env, Cl))

# View the head of close_data
head(close_data)

# Set defaults for getSymbols
# Set the default to pull data from Google Finance
setDefaults(getSymbols, src = "google")

# Get GOOG data
getSymbols("GOOG")

# Verify the data was actually pulled from Google Finance
str(GOOG)

# Look at getSymbols.yahoo arguments
args(getSymbols.yahoo)

# Set default 'from' value for getSymbols.yahoo
setDefaults(getSymbols.yahoo, from = "2000-01-01")

# Confirm defaults were set correctly
getDefaults("getSymbols.yahoo")

# Look at the first few rows of CP
head(CP)

# Set the source for CP to FRED
setSymbolLookup(CP = "FRED")

# Load CP data again
getSymbols("CP")

# Look at the first few rows of CP
head(CP)

# Save symbol lookup table
saveSymbolLookup("my_symbol_lookup.rda")

# Set default source for CP to "yahoo"
setSymbolLookup(CP = "yahoo")

# Verify the default source is "yahoo"
getSymbolLookup("CP")

# Load symbol lookup table
loadSymbolLookup("my_symbol_lookup.rda")

# Verify the default source is "FRED"
getSymbolLookup("CP")

# Handling instrument symbols that clash or are not valid R object names
# Ford symbol F can also be confused as F like FALSE
# Load BRK-A data
getSymbols("BRK-A")

# Use backticks and head() to look at the loaded data
head(`BRK-A`)

# Use get() to assign the BRK-A data to an object named BRK.A
BRK.A <- get("BRK-A")

# Create BRK.A object
BRK.A <- getSymbols("BRK-A", auto.assign = FALSE)

# Create col_names object with the column names of BRK.A
col_names <- colnames(BRK.A)

# Set BRK.A column names to syntactically valid names
colnames(BRK.A) <- make.names(col_names)

# Set name for BRK-A to BRK.A
setSymbolLookup(BRK.A = list(name = "BRK-A"))

# Set name for T (AT&T) to ATT
setSymbolLookup(ATT = list(name = "T"))

# Load BRK.A and ATT data
getSymbols(c("BRK.A", "ATT"))