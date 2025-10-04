password <- function() {
  len <- as.integer(readline(prompt = "Enter the length of password: "))

  # Validate password length
  while (is.na(len) || len < 6) {
    cat("Please enter a valid length (at least 6):\n")
    len <- as.integer(readline(prompt = "Enter length: "))
  }

  # Character sets
  upper <- LETTERS
  lower <- letters
  digits <- as.character(0:9)
  special <- c('!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+', '~')

  # Combine all characters
  full <- c(upper, lower, digits, special)

  # Generate password
  pass <- sample(full, len, replace = TRUE)
  pass <- paste0(pass, collapse = "")

  # Print password
  cat(sprintf("The generated password is: %s\n", pass))
}

# Run the function
password()
