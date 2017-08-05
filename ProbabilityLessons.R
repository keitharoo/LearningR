# 1 is heads and 0 is tails

# Coin flip, 5 coins flipped
rbinom(5, 1, .5)

# Coin flip, 1 draw with 10 flips. Gives number of heads in return
rbinom(1, 10, .5)

# 10 flips of 10 coins
rbinom(10, 10, .5)

# 80 percent chance of heads, unfair coin
rbinom(1, 1, .8)
rbinom(10, 10, .8)

# Density
flips <- rbinom(100000, 10, .5)
hist(flips)
flips == 5
mean(flips == 5)

# Another way of doing the above
dbinom(5, 10, .5)

# Calculate the probability of getting 6 heads
dbinom(6, 10, .5)

# Calculate the probability of getting 10 heads
dbinom(10, 10, .5)

# Cumulative density
mean(flips <= 4)

# Another way of the above
pbinom(4, 10, .5)

# In a trial of 10,000 coin flips of 10 coins with a 30% chance of heads,
# this is the probability that at least 5 are heads
mean(rbinom(10000, 10, .3) >= 5)

# Variance is the average squared distance of each value from the mean of 
# the sample
# var(x)

# Calculate the expected value using the exact formula
25 * .3

# Confirm with a simulation using rbinom
mean(rbinom(10000, 25, .3))

# var
25 * .3 * (1 - .3)
var(rbinom(10000, 25, .3))

# Probability of A and B
# Pr(A) * Pr(B)
# Assumes events are indpenedent

# You've already simulated 100,000 flips of coins A and B
A <- rbinom(100000, 1, .4)
B <- rbinom(100000, 1, .2)

# Simulate 100,000 flips of coin C (70% chance of heads)
C <- rbinom(100000, 1, .7)

# Estimate the probability A, B, and C are all heads
mean(A & B & C)

# Probability of A OR B
# Pr(A) + Pr(B) - Pr(A and B)
mean(A | B)

# For three events
# Pr(A) + Pr(B) + Pr(C) - Pr(A and B) - Pr(A and C) - Pr(A and B) + Pr(A and B and C)
mean(A | B | C)

# Use rbinom to simulate 100,000 draws from each of X and Y
X <- rbinom(100000, 10, .6)
Y <- rbinom(100000, 10, .7)

# Estimate the probability either X or Y is <= to 4
mean(X <= 4 | Y <= 4)

# Use pbinom to calculate the probabilities separately
prob_X_less <- pbinom(4, 10, .6)
prob_Y_less <- pbinom(4, 10, .7)

# Combine these to calculate the exact probability either <= 4
prob_X_less + prob_Y_less - (prob_X_less * prob_Y_less)

# Multiplying random variables
# Simulate 100,000 draws of a binomial with size 20 and p = .1
X <- rbinom(100000, 20, .1)

# Estimate the expected value of X
mean(X)

# Estimate the expected value of 5 * X
mean(5 * X)

# X is simulated from 100,000 draws of a binomial with size 20 and p = .1
X <- rbinom(100000, 20, .1)

# Estimate the variance of X
var(X)

# Estimate the variance of 5 * X
var(5 * X)

# Updating with evidence
# Simulate 50000 cases of flipping 20 coins from fair and from biased
fair <- rbinom(50000, 20, .5)
biased <- rbinom(50000, 20, .75)

# How many fair cases, and how many biased, led to exactly 11 heads?
fair_11 <- sum(fair == 11)
biased_11 <- sum(biased == 11)

# Find the fraction of fair coins that are 11 out of all coins that were 11
fair_11 / (fair_11 + biased_11)

# Simulate 50000 cases of flipping 20 coins from fair and from biased
fair <- rbinom(50000, 20, .5)
biased <- rbinom(50000, 20, .75)

# How many fair cases, and how many biased, led to exactly 16 heads?
fair_16 <- sum(fair == 16)
biased_16 <- sum(biased == 16)

# Find the fraction of fair coins that are 16 out of all coins that were 16
fair_16 / (fair_16 + biased_16)

# Prior probability
# Simulate 80,000 draws from fair coin, 10,000 from each of high and low coins
flips_fair <- rbinom(80000, 20, .5)
flips_high <- rbinom(10000, 20, .75)
flips_low <- rbinom(10000, 20, .25)

# Compute the number of coins that resulted in 14 heads from each of these piles
fair_14 <- sum(flips_fair == 14)
high_14 <- sum(flips_high == 14)
low_14 <- sum(flips_low == 14)

# Compute the posterior probability that the coin was fair
fair_14 / (fair_14 + high_14 + low_14)

# Use dbinom to calculate the probability of 11/20 heads with fair or biased coin
probability_fair <- dbinom(11, 20, .5)
probability_biased <-dbinom(11, 20, .75)

# Calculate the posterior probability that the coin is fair
probability_fair / (probability_fair + probability_biased)

# Find the probability that a coin resulting in 14/20 is fair
prob_fair <- dbinom(14, 20, .5)
prob_bias <- dbinom(14, 20, .75)
prob_fair / (prob_fair + prob_bias)

# Find the probability that a coin resulting in 18/20 is fair
prob_fair2 <- dbinom(18, 20, .5)
prob_bias2 <- dbinom(18, 20, .75)
prob_fair2 / (prob_fair2 + prob_bias2)

# Use dbinom to find the probability of 16/20 from a fair or biased coin
probability_16_fair <- dbinom(16, 20, .5)
probability_16_biased <- dbinom(16, 20, .75)

# Use Bayes' theorem to find the posterior probability that the coin is fair
(probability_16_fair * .99) / ((probability_16_fair * .99) + (probability_16_biased) * .01)

# Simulating the binomial and the normal
# Draw a random sample of 100,000 from the Binomial(1000, .2) distribution
binom_sample <- rbinom(100000, 1000, .2)

# Draw a random sample of 100,000 from the normal approximation
normal_sample <- rnorm(100000, (1000 * .2), sqrt(160))
# The above includes sqrt(160) where 160 is the variance (1000 * .2 * (1 - .2))

# Compare the two distributions with the compare_histograms function
compare_histograms(binom_sample, normal_sample)

# Simulations from the normal and binomial distributions
binom_sample <- rbinom(100000, 1000, .2)
normal_sample <- rnorm(100000, 200, sqrt(160))

# Use binom_sample to estimate the probability of <= 190 heads
mean(binom_sample <= 190)

# Use normal_sample to estimate the probability of <= 190 heads
mean(normal_sample <= 190)

# Calculate the probability of <= 190 heads with pbinom
pbinom(190, 1000, .2)

# Calculate the probability of <= 190 heads with pnorm
pnorm(190, 200, sqrt(160))

# Draw a random sample of 100,000 from the Binomial(10, .2) distribution
binom_sample <- rbinom(100000, 10, .2)

# Draw a random sample of 100,000 from the normal approximation
normal_sample <- rnorm(100000, 2, sqrt(1.6))

# Compare the two distributions with the compare_histograms function
compare_histograms(binom_sample, normal_sample)

# Poisson distribution
# Draw a random sample of 100,000 from the Binomial(1000, .002) distribution
binom_sample <- rbinom(100000, 1000, .002)

# Draw a random sample of 100,000 from the Poisson approximation
poisson_sample <- rpois(100000, 2) # Where 2 is the mean

# Compare the two distributions with the compare_histograms function
compare_histograms(binom_sample, poisson_sample)

# Density of the poisson distribution
# Simulate 100,000 draws from Poisson(2)
poisson_sample <- rpois(100000, 2)

# Find the percentage of simulated values that are 0
mean(poisson_sample == 0)

# Use dpois to find the exact probability that a draw is 0
dpois(0, 2)

# Sum of two poisson distributions
# Simulate 100,000 draws from Poisson(1)
X <- rpois(100000, 1)

# Simulate 100,000 draws from Poisson(2)
Y <- rpois(100000, 2)

# Add X and Y together to create Z
Z <- X + Y

# Use compare_histograms to compare Z to the Poisson(3)
compare_histograms(Z, rpois(100000, 3))

# Geometric distribution
# Simulating waiting for heads

# Waiting for first coin flip
# Simulate 100 instances of flipping a 20% coin
flips <- rbinom(100, 1, .2)

# Use which to find the first case of 1 ("heads")
which(flips == 1)[1]

# Using replicate
# Existing code for finding the first instance of heads
which(rbinom(100, 1, .2) == 1)[1]

# Replicate this 100,000 times using replicate()
replications <- replicate(100000, which(rbinom(100, 1, .2) == 1)[1])

# Histogram the replications with qplot
qplot(replications)

# Simulating from the geometric distribution
# Replications from the last exercise
replications <- replicate(100000, which(rbinom(100, 1, .2) == 1)[1])

# Generate 100,000 draws from the corresponding geometric distribution
geom_sample <- rgeom(100000, .2)

# Compare the two distributions with compare_histograms
compare_histograms(replications, geom_sample)

# Does the machine still work?
# Find the probability the machine breaks on 5th day or earlier
pgeom(4, .1) # Where there's a 10% chance it breaks each day

# Find the probability the machine is still working on 20th day
1 - pgeom(19, .1)

# Graphing the probability that the machine still works  over a month
# Calculate the probability of machine working on day 1-30
still_working <- 1 - pgeom(0:29, .1)

# Plot the probability for days 1 to 30
qplot(1:30, still_working)
