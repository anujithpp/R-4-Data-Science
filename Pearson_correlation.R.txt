# Load the mtcars dataset
data(mtcars)

# Perform Pearson correlation test between hp and mpg
correlation_result <- cor.test(mtcars$hp, mtcars$mpg, method = "pearson")

# Print the result
print(correlation_result)
