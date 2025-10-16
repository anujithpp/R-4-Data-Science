# Load necessary libraries
library(ggplot2)
library(GGally)
library(dplyr)

# Load the Iris dataset
data(iris)

# Display the first few rows of the dataset
head(iris)

# ---- Step 1: Statistical Analysis: Sepal Length Differences Between Species ----

# Perform One-Way ANOVA to check if there are significant differences in Sepal.Length between species
anova_result <- aov(Sepal.Length ~ Species, data = iris)

# Display the ANOVA result
summary(anova_result)

# If the p-value is less than 0.05, we conclude that there are statistically significant differences.

# ---- Step 2: Create a Pair Plot to Visualize Relationships Between All Variables ----

# Create a pair plot (scatterplot matrix) to visualize relationships between all variables
ggpairs(iris, aes(color = Species))

