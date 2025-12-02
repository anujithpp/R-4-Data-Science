# Core packages for data manipulation, visualization, and modeling
install.packages("ggplot2")      # For plots
install.packages("GGally")       # For ggpairs plots (pairwise relationships)
install.packages("corrplot")     # For correlation matrix plots
install.packages("dplyr")        # For data manipulation
install.packages("tidyr")        # For data tidying
install.packages("Metrics")      # For regression evaluation (e.g., RMSE, MAE)
install.packages("car")          # For VIF/multicollinearity check
# Install and load necessary packages
install.packages("MASS")
library(MASS)

# Load the Boston dataset
data("Boston")
# Display the first few rows
head(Boston)

# Summary statistics
summary(Boston)

# Structure of the dataset
str(Boston)
# Check for missing values
colSums(is.na(Boston))

# Load ggplot2 for visualization

library(ggplot2)

# Histogram of median value of owner-occupied homes
ggplot(Boston, aes(x = medv)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Median Home Values", x = "Median Value (in $1000s)", y = "Frequency")

# Pairwise scatter plots
pairs(Boston[, 1:5], main = "Pairwise Scatter Plots")

library(corrplot)

# Calculate correlation matrix
cor_matrix <- cor(Boston)

# Plot correlation heatmap
corrplot(cor_matrix, method = "color", type = "upper", tl.cex = 0.8, tl.col = "black",
         title = "Correlation Heatmap of Boston Dataset", mar = c(0,0,1,0))
ggplot(Boston, aes(x = rm, y = medv)) +
  geom_point(alpha = 0.6, color = "darkblue") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Rooms vs Median Home Value", x = "Average Number of Rooms (rm)", y = "Median Home Value (medv)")



# Define the target variable and predictors
target <- Boston$medv
predictors <- Boston[, -14]  # Exclude the target variable
# Fit the linear regression model
model <- lm(target ~ ., data = Boston)

# Display the model summary
summary(model)
# Residuals vs Fitted plot
plot(model, which = 1)

# Q-Q plot for residuals
plot(model, which = 2)

# Residuals histogram
hist(residuals(model), main = "Histogram of Residuals", xlab = "Residuals")
# New data point (example)
new_data <- data.frame(
  crim = 0.1, zn = 0, indus = 6.5, chas = 0, nox = 0.5,
  rm = 6, age = 40, dis = 4, rad = 5, tax = 300,
  ptratio = 15, b = 380, lstat = 5
)
# Predict using the trained model
predicted_value <- predict(model, new_data)
predicted_value
