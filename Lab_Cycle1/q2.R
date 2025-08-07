# Import the stringr library for string manipulation
library(stringr)

# Prompt user to enter a sentence
sentence <- readline(prompt = "Enter a sentence: ")

# Remove all punctuation from the sentence
clean_sentence <- str_replace_all(sentence, "[[:punct:]]", "")
cat("Cleaned sentence:", clean_sentence, "\n")

# Convert the cleaned sentence to ASCII values
ascii_values <- as.integer(charToRaw(clean_sentence))
cat("ASCII Values:\n")
print(ascii_values)

# Get the shift value for Caesar cipher from user
shift_value <- as.integer(readline(prompt = "Enter the shift value: "))

# Encrypt the sentence using Caesar cipher logic
for (i in seq_along(ascii_values)) {
  # Skip spaces (ASCII 32)
  if (ascii_values[i] != 32) {
    # Uppercase letters
    if (ascii_values[i] >= 65 && ascii_values[i] <= 90) {
      ascii_values[i] <- ((ascii_values[i] - 65 + shift_value) %% 26) + 65
    }
    # Lowercase letters
    if (ascii_values[i] >= 97 && ascii_values[i] <= 122) {
      ascii_values[i] <- ((ascii_values[i] - 97 + shift_value) %% 26) + 97
    }
  }
}

# Convert ASCII values back to characters
encrypted_sentence <- rawToChar(as.raw(ascii_values))

cat("Encrypted sentence:\n")
cat(encrypted_sentence, "\n")
