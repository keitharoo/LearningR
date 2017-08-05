# Let's create a small table of data
shoes <- matrix(c(7, 4, 1, 3), ncol = 1, byrow = TRUE)
colnames(shoes) <- c("Shoe count")
rownames(shoes) <- c("Nike", "Adidas", "Jimmy Choo", "Converse")
shoes <- as.table(shoes)
shoes
sum(shoes)

# And then make a simple plot
plot(shoes)