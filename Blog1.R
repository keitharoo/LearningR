# From: http://keithtidwell.org/2017/07/some-basic-statistics-concepts/

# Makes sure you have the R Datasets package loaded
library(datasets)

# Assigns the beaver1 data to the variable beaver_temp
beaver_temp <- beaver1

# Creates a dotplot of the temp data found in beaver1
plot(beaver_temp$temp)

# Make it prettier, give it a title, etc.
plot(beaver_temp$temp, type = 'p', col = 'dark red', main = "How hot is your beaver?", sub = "A dot plot of R's default beaver1 data", xlab = "", ylab = "Beaver temp in C")

# Post a comment below with what you would do to make this better