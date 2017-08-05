# Load required packages
library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)

# Let's get some tweets containing the word "treason".
treason_tweets <- searchTwitter("collusion", n = 500, lang = "en")

# Extract the text in a vector
treason_text <- sapply(treason_tweets, function(x) x$getText())

# To remove emojis
treason_text <- iconv(treason_text, 'UTF-8', 'ASCII')

# Create a Corpus
treason_corpus <- Corpus(VectorSource(treason_text))

# Create document term matrix applying some transformations

tdm <- TermDocumentMatrix(treason_corpus,
                          control = list(removePunctuation = TRUE,
                          stopwords = c('collusion', 'https', stopwords("english")),
                          removeNumbers = TRUE, tolower = TRUE))

# Obtain words and their frequencies

# Define tdm as a matrix
m <- as.matrix(tdm)

# Get word counts in decreasing order
word_freqs <- sort(rowSums(m), decreasing = TRUE)

# Create a data frame with words and their frequencies
dm <- data.frame(word = names(word_freqs), freq = word_freqs)

# Plot the word cloud
wordcloud(dm$word, dm$freq, random.order = FALSE, colors = brewer.pal(8, "Dark2"))

# Save as a png
png("Collusion.png", width = 12, height = 8, units = "in", res = 300)
wordcloud(dm$word, dm$freq, random.order=FALSE, colors=brewer.pal(8, "Dark2"))
dev.off()
