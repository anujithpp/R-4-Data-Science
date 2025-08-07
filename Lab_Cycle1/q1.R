# Select the file to process
file_path <- file.choose()

# Load required library
library(stringr)

# Read the file and combine lines into a single paragraph
paragraph <- paste(readLines(file_path), collapse = " ")
cat("Original Paragraph:\n", paragraph, "\n\n")

# Remove punctuation
clean_paragraph <- str_replace_all(paragraph, "[[:punct:]]", "")
cat("Clean Paragraph:\n", clean_paragraph, "\n\n")

# Split into words
words <- unlist(strsplit(clean_paragraph, "\\s+"))
cat("Number of words:", length(words), "\n")

# Calculate average word length
word_lengths <- nchar(words)
avg_word_length <- mean(word_lengths)
cat("Average word length:", avg_word_length, "\n")

# Find the longest word(s)
max_length <- max(word_lengths)
longest_words <- words[word_lengths == max_length]
cat("Longest word(s):", paste(longest_words, collapse = ", "), "\n")

# Replace 'and' with '&'
replaced_paragraph <- str_replace_all(clean_paragraph, "\\band\\b", "&")
cat("Paragraph with 'and' replaced by '&':\n", replaced_paragraph, "\n")
