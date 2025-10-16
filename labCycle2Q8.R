# Load necessary libraries
library(ggplot2)

# Load Titanic dataset from GitHub
url <- "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
titanic_df <- read.csv(url)

# Display the first few rows of the dataset
head(titanic_df)

# ---- Step 1: Plot Histogram of 'Parch' (Number of parents/children aboard) ----

ggplot(titanic_df, aes(x = Parch)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Number of Parents/Children Aboard (Parch)",
       x = "Number of Parents/Children Aboard",
       y = "Frequency") +
  theme_minimal()

# ---- Step 2: Perform Detailed EDA ----

# Summary statistics of the dataset
summary(titanic_df)

# Correlation matrix for numeric variables
cor(titanic_df[, sapply(titanic_df, is.numeric)], use = "complete.obs")

# Check for missing values
colSums(is.na(titanic_df))

# Visualize survival by class and gender
ggplot(titanic_df, aes(x = factor(Pclass), fill = factor(Survived))) +
  geom_bar(position = "fill") +
  labs(title = "Survival by Class", x = "Passenger Class", y = "Proportion of Survivors") +
  scale_fill_manual(values = c("red", "green"), labels = c("Did not survive", "Survived")) +
  theme_minimal()

# ---- Step 3: Create Customized Box Plot for Age Distribution of Survivors vs Non-Survivors ----

ggplot(titanic_df, aes(x = factor(Survived), y = Age)) +
  geom_boxplot(fill = c("red", "green")) +
  labs(title = "Age Distribution of Survivors vs Non-Survivors", 
       x = "Survival (0 = No, 1 = Yes)", 
       y = "Age") +
  theme_minimal()
