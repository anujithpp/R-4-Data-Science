house_data <- read.csv("/content/sample_data/california_housing_train.csv")
head(house_data)
names(house_data)

# Fit linear regression model
model <- lm(median_house_value ~ median_income, data = house_data)

#Slope and intercept
coefficients <- coef(model)
intercept <- coefficients[1]
slope <- coefficients[2]

cat("Intercept:", intercept, "\n")
cat("Slope:", slope, "\n")
#Plot scatter plot
plot(house_data$median_income, house_data$median_house_value,
     main = "House Price vs Median Income",
     xlab = "Median Income",
     ylab = "Median House Value",
     pch = 19, col = "blue")

abline(model, col = "red", lwd = 2)
