# Select all of 2016 from x
x_2016 <- x["2016"]

# Select January 1, 2016 to March 22, 2016
jan_march <- x["2016/2016-03-22"]

# Verify that jan_march contains 82 rows
82 == length(jan_march)

# Extract all data from irreg between 8AM and 10AM
morn_2010 <- irreg["T08:00/T10:00"]

# Extract the observations in morn_2010 for January 13th, 2010
morn_2010["2010-01-13"]

# Subset x using the vector dates
x[dates]

# Subset x using dates as POSIXct
x[as.POSIXct(dates)]

# Replace the values in x contained in the dates vector with NA
x[dates] <- NA

# Replace all values in x for dates starting June 9, 2016 with 0
x["2016-06-09/"] <- "0"

# Verify that the value in x for June 11, 2016 is now indeed 0
x["2016-06-11"]

# Create lastweek using the last 1 week of temps
lastweek <- last(temps, "1 week")

# Print the last 2 observations in lastweek
last(lastweek, 2)

# Extract all but the first two days of lastweek
first(lastweek, "-2 days")

# Extract the first three days of the second week of temps
first(last(first(temps, "2 weeks"), "1 week"), "3 days")

# Math operation in xts
# Add a and b
a + b

# Add a with the numeric value of b
a + as.numeric(b)

# Add a to b, and fill all missing rows of b with 0
a + merge(b, index(a), fill = 0)

# Add a to b and fill NAs with the last observation
a + merge(b, index(a), fill = na.locf)

# Merging time series
# Like with cbind() and merge()
# Inner joins, the intersections; outer joins, the unions, and right or left
# is the x or y respectively

# rbind is short for row bind
# Perform an inner join of a and b
merge(a, b, join = "inner")

# Perform a left-join of a and b, fill missing values with 0
merge(a, b, join = "left", fill = 0)

# Order of arguments isn't important
# Row bind temps_june30 to temps, assign this to temps2
temps2 <- rbind(temps, temps_june30)

# Row bind temps_july17 and temps_july18 to temps2, call this temps3
temps3 <- rbind(temps2, temps_july17, temps_july18)

# Can fill missingness like this; locf means last observation carried forward
# Fill missing values in temps using the last observation
temps_last <- na.locf(temps)

# Fill missing values in temps using the next observation
temps_next <- na.locf(temps, fromLast = TRUE)

# Interpolate NAs using linear approximation
na.approx(AirPass)

# Lagging a time series
# Create a leading object called lead_x
lead_x <- lag(x, k = -1)

# Create a lagging object called lag_x
lag_x <- lag(x, k = 1)

# Merge your three series together and assign to z
z <- merge(lead_x, x, lag_x)

# Calculate the first difference of AirPass and assign to diff_by_hand
diff_by_hand <- AirPass - lag(AirPass)

# Use merge to compare the first parts of diff_by_hand and diff(AirPass)
merge(head(diff_by_hand), head(diff(AirPass)))

# Calculate the first order 12 month difference of AirPass
diff(AirPass, lag = 12, differences = 1)

# Applying by time
# period.apply() and split()

# Locate the weeks
endpoints(temps, on = "weeks")

# Locate every two weeks
endpoints(temps, on = "weeks", k = 2)

# Calculate the weekly endpoints
ep <- endpoints(temps, on = "weeks")

# Now calculate the weekly mean and display the results
period.apply(temps[, "Temp.Mean"], INDEX = ep, FUN = mean)

# Split temps by week
temps_weekly <- split(temps, f = "weeks")

# Create a list of weekly means, temps_avg, and print this list
temps_avg <- lapply(X = temps_weekly, FUN = mean)
temps_avg

# Use the proper combination of split, lapply and rbind
temps_1 <- do.call(rbind, lapply(split(temps, "weeks"), function(w) last(w, n = "1 day")))

# Create last_day_of_weeks using endpoints()
last_day_of_weeks <- endpoints(temps, "weeks")

# Subset temps using last_day_of_weeks 
temps_2 <- temps[last_day_of_weeks]

# Convert univariate to OHLC series data
# Convert usd_eur to weekly and assign to usd_eur_weekly
usd_eur_weekly <- to.period(usd_eur, period = "weeks")

# Convert usd_eur to monthly and assign to usd_eur_monthly
usd_eur_monthly <- to.period(usd_eur, period = "months")

# Convert usd_eur to yearly univariate and assign to usd_eur_yearly
usd_eur_yearly <- to.period(usd_eur, period = "years", OHLC = FALSE)

# Convert eq_mkt to quarterly OHLC
mkt_quarterly <- to.period(eq_mkt, period = "quarters")

# Convert eq_mkt to quarterly using shortcut function
mkt_quarterly2 <- to.quarterly(eq_mkt, name = "edhec_equity", indexAt = "firstof")

# Rolling windows
# Split edhec into years
edhec_years <- split(edhec , f = "years")

# Use lapply to calculate the cumsum for each year in edhec_years
edhec_ytd <- lapply(edhec_years, FUN = cumsum)

# Use do.call to rbind the results
edhec_xts <- do.call(rbind, edhec_ytd)

# Use rollapply to calculate the rolling 3 period sd of eq_mkt
eq_sd <- rollapply(eq_mkt, width = 3, FUN = sd)

# Index, attributes, and timezones
# View the first three indexes of temps
index(temps)[1:3]

# Get the index class of temps
indexClass(temps)

# Get the timezone of temps
indexTZ(temps)

# Change the format of the time display
indexFormat(temps) <- "%b-%d-%Y"

# View the new format
head(temps)

# Construct times_xts with tzone set to America/Chicago
times_xts <- xts(1:10, order.by = times, tzone = "America/Chicago")

# Change the time zone of times_xts to Asia/Hong_Kong
tzone(times_xts) <- "Asia/Hong_Kong"

# Extract the current time zone of times_xts
indexTZ(times_xts)

# Periods, periodicity, and timestamps
# Calculate the periodicity of temps
periodicity(temps)

# Calculate the periodicity of edhec
periodicity(edhec)

# Convert edhec to yearly
edhec_yearly <- to.yearly(edhec)

# Calculate the periodicity of edhec_yearly
periodicity(edhec_yearly)

# Count the months
nmonths(edhec)

# Count the quarters
nquarters(edhec)

# Count the years
nyears(edhec)

# Explore underlying units of temps in two commands: .index() and .indexwday()
.index(temps)
.indexwday(temps)

# Create an index of weekend days using which()
# Remember Sunday is 0, and days of the week are 0-6
index <- which(.indexwday(temps) == 0 | .indexwday(temps) == 6)

# Select the index
temps[index]

# Modifying timestamps
# Make z have unique timestamps
z_unique <- make.index.unique(z, eps = 1e-4)

# Remove duplicate times in z
z_dup <- make.index.unique(z, drop = TRUE)

# Round observations in z to the next hour
z_round <- align.time(z, n = 3600)

### Chapter 4 ###

# Making irregular data regular
# Extract the start date of the series
start_date <- start(irregular_xts)

# Extract the end date of the series
end_date <- end(irregular_xts)

# Create a regular date-time sequence
regular_index <- seq(from = start_date, to = end_date, by = "day")

# Create a zero-width xts object
regular_xts <- xts(,order.by = regular_index)

# Merge irregular_xts and regular_xts
merged_xts <- merge(irregular_xts, regular_xts)

# Look at the first few rows of merged_xts
head(merged_xts)

# Use the fill argument to fill NA with their previous value
merged_filled_xts <- merge(irregular_xts, regular_xts, fill = na.locf)

# Look at the first few rows of merged_filled_xts
head(merged_filled_xts)

# Low frequency data
# Aggregate DFF to monthly
monthly_fedfunds <- apply.monthly(DFF, mean)

# Convert index to yearmon
index(monthly_fedfunds) <- as.yearmon(index(monthly_fedfunds))

# Merge FEDFUNDS with the monthly aggregate
merged_fedfunds <- merge(FEDFUNDS, monthly_fedfunds)

# Look at the first few rows of the merged object
head(merged_fedfunds)

# Look at the first few rows of merged_fedfunds
head(merged_fedfunds)

# Fill NA forward
merged_fedfunds_locf <- na.locf(merged_fedfunds)

# Extract index values containing last day of month
# And it was the index() part that messed me up here
aligned_last_day <- merged_fedfunds_locf[index(monthly_fedfunds)]

# Fill NA backward
merged_fedfunds_locb <- na.locf(merged_fedfunds, fromLast = TRUE)

# Extract index values containing first day of month
aligned_first_day <- merged_fedfunds_locb[index(FEDFUNDS)]

# Extract index weekdays
index_weekdays <- .indexwday(DFF)

# Find locations of Wednesdays
wednesdays <- which(index_weekdays == 3)

# Create custom end points
end_points <- c(0, wednesdays, nrow(DFF))

# Calculate weekly mean using custom end points
weekly_mean <- period.apply(DFF, end_points, mean)

# Intraday data and timezones
# Create merged object with a Europe/London timezone
tz_london <- merge(london, chicago)

# Look at tz_london structure
str(tz_london)

# Create merged object with a America/Chicago timezone
tz_chicago <- merge(chicago, london)

# Look at tz_chicago structure
str(tz_chicago)

# Create a regular date-time sequence
regular_index <- seq(as.POSIXct("2010-01-04 09:00"), as.POSIXct("2010-01-08 16:00"), by = "30 min")

# Create a zero-width xts object
regular_xts <- xts(, order.by = regular_index)

# Merge irregular_xts and regular_xts, filling NA with their previous value
merged_xts <- merge(irregular_xts, regular_xts, fill = na.locf)

# Subset to trading day (9AM - 4PM)
trade_day <- merged_xts["T09:00/T16:00"]

# Split trade_day into days
daily_list <- split(trade_day , f = "days")

# Use lapply to call na.locf for each day in daily_list
daily_filled <- lapply(daily_list, FUN = na.locf)

# Use do.call to rbind the results
filled_by_trade_day <- do.call(rbind, daily_filled)

# Convert raw prices to 5-second prices
xts_5sec <- to.period(intraday_xts, period = "seconds", k = 5)

# Convert raw prices to 10-minute prices
xts_10min <- to.period(intraday_xts, period = "minutes", k = 10)

# Convert raw prices to 1-hour prices
xts_1hour <- to.period(intraday_xts, period = "hours", k = 1)

### Chapter 5 ###

# Import text files
# Load AMZN.csv
# Might need dir = "file path here" in real life
getSymbols("AMZN", src = "csv")

# Look at AMZN structure
str(AMZN)

# Import AMZN.csv using read.zoo
amzn_zoo <- read.zoo("AMZN.csv", sep = ",", header = TRUE)

# Convert to xts
amzn_xts <- as.xts(amzn_zoo)

# Look at the first few rows of amzn_xts
head(amzn_xts)

# Read data with read.csv
une_data <- read.csv("UNE.csv", nrows = 5)

# Look at the structure of une_data
str(une_data)

# Read data with read.zoo, specifying index columns
une_zoo <- read.zoo("UNE.csv", index.column = c("Date", "Time"), sep = ",", header = TRUE)

# Look at first few rows of data
head(une_zoo)

# Read data with read.csv
two_symbols_data <- read.csv("two_symbols.csv", nrows = 5)

# Look at the structure of two_symbols_data
str(two_symbols_data)

# Read data with read.zoo, specifying index columns
two_symbols_zoo <- read.zoo("two_symbols.csv", split = c("Symbol", "Type"), sep = ",", header = TRUE)

# Look at first few rows of data
head(two_symbols_zoo)

# Checking for weirdness
# Missing values and corporate actions (splits and dividends)
# Dividend should decrease the stock price at the same amount of dividend

# fill NA using last observation carried forward
locf <- na.locf(DGS10)

# fill NA using linear interpolation
approx <- na.approx(DGS10)

# fill NA using spline interpolation
spline <- na.spline(DGS10)

# merge into one object
na_filled <- merge(locf, approx, spline)

# plot combined object
plot(na_filled, col = c("black", "red", "green"))

# Download AAPL data from Yahoo Finance
getSymbols("AAPL", src = "yahoo")

# Plot close price
plot(Cl(AAPL))

# Plot adjusted close price
plot(Ad(AAPL))

# Look at first few rows aapl_yahoo
head(aapl_yahoo)

# Look at first few rows aapl_google
head(aapl_google)

# Plot difference between Yahoo adjusted close and Google close
plot(Ad(aapl_yahoo) - Cl(aapl_google))

# Plot difference between volume from Yahoo and Google
plot(Vo(aapl_yahoo) - Vo(aapl_google))

# Look at first few rows of AAPL
head(AAPL)

# Adjust AAPL for splits and dividends
aapl_adjusted <- adjustOHLC(AAPL)

# Look at first few rows of aapl_adjusted
head(aapl_adjusted)

# Download AAPL split data
splits <- getSplits("AAPL")

# Print the splits object
splits

# Download AAPL dividend data
dividends <- getDividends("AAPL", src = "yahoo")

# Look at the first few rows of dividends
head(dividends)

# Download unadjusted AAPL dividend data
raw_dividends <- getDividends("AAPL", split.adjust = FALSE)

# Look at the first few rows of raw_dividends
head(raw_dividends)

# Calculate split and dividend adjustment ratios
ratios <- adjRatios(splits = splits, dividends = raw_dividends, close = Cl(AAPL))

# Calculate adjusted close for AAPL
aapl_adjusted <- Cl(AAPL) * ratios[, "Split"] * ratios[, "Div"]

# Look at first few rows of Yahoo adjusted close
head(Ad(AAPL))

# Look at first few rows of aapl_adjusted
head(aapl_adjusted)


