# Load the dataset
data("mtcars")

# Convert 'gear' to a factor (since it's categorical)
mtcars$gear <- as.factor(mtcars$gear)

# Perform One-Way ANOVA
anova_result <- aov(disp ~ gear, data = mtcars)

# Display the ANOVA summary table
summary(anova_result)
