install.packages("Rcpp")
install.packages("RcppArmadillo", dependencies = TRUE)
install.packages("forecast", dependencies = TRUE)
install.packages("ggplot2")
install.packages("dplyr")

library(forecast)
library(ggplot2)
library(dplyr)

#Load the dataset from GitHub 
url <- "https://raw.githubusercontent.com/datasets/covid-19/master/data/time-series-19-covid-combined.csv"
covid_data <- read.csv(url)

#Filter data for India and the required date range
covid_india <- covid_data %>%
  filter(Country.Region == "India" & Date >= "2020-01-22" & Date <= "2020-12-15")

# Step 3: Aggregate weekly total confirmed cases and deaths 
covid_india$Date <- as.Date(covid_india$Date)
covid_weekly <- covid_india %>%
  group_by(week = format(Date, "%Y-%U")) %>%
  summarise(Total_Cases = max(Confirmed), Total_Deaths = max(Deaths))

# a) UNIVARIATE TIME SERIES ANALYSIS 
# i. Create time series object for total positive cases
cases_ts <- ts(covid_weekly$Total_Cases, frequency = 52, start = c(2020, 4))

# ii. Visualize the time series data
plot(cases_ts,
     main = "Weekly Total COVID-19 Positive Cases in India (2020)",
     xlab = "Weeks (2020)", ylab = "Total Confirmed Cases",
     col = "blue", lwd = 2)

# b) MULTIVARIATE TIME SERIES ANALYSIS
# ii. Create multivariate time series object
multi_ts <- ts(cbind(covid_weekly$Total_Cases, covid_weekly$Total_Deaths),
               frequency = 52, start = c(2020, 4))

# iii. Plot both series together
matplot(multi_ts, type = "l", lty = 1, col = c("blue", "red"), lwd = 2,
        xlab = "Weeks (2020)", ylab = "Count",
        main = "COVID-19 Cases and Deaths in India (Weekly, 2020)")
legend("topleft", legend = c("Confirmed Cases", "Deaths"),
       col = c("blue", "red"), lty = 1, bty = "n")

#c) TIME SERIES FORECASTING
# i. Fit ARIMA model using auto.arima()
model_arima <- auto.arima(cases_ts)

# ii. Forecast next 5 data points
forecast_result <- forecast(model_arima, h = 5)

# iii. Plot forecasted values
plot(forecast_result,
     main = "Forecast of COVID-19 Weekly Cases (Next 5 Weeks)",
     xlab = "Weeks", ylab = "Total Confirmed Cases",
     col = "darkblue")

