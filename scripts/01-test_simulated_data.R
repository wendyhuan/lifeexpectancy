#### Preamble ####
# Purpose: Tests the structure and validity of the simulated life expectancy dataset
# Author: Yanfei Huang
# Date: 26 November 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(arrow)

# load data 
simulated_data <- read_csv("~/lifeexpectancy/data/00-simulated_data/simulated_data.csv")

#### Test data ####

# Test if the data was successfully loaded
test_that("Simulated data has correct structure", {
  if (exists("simulated_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

# Test that the data has 4 columns
expect_equal(ncol(simulated_data), 4)

# Test that the data has the correct column names
expected_columns <- c(
  "Country", "Gender", "Period", "Life Expectancy")
expect_equal(colnames(simulated_data), expected_columns)
})

# Define a smaller test set of predictors for simplicity
test_countries <- c("USA", "Canada")
test_genders <- c("Male", "Female")
test_periods <- 2020:2022

# Initialize an empty list to store test simulated data
test_simulated_data <- list()

# Simulate test data for each combination of country, gender, and period
for (country in test_countries) {
  for (gender in test_genders) {
    for (period in test_periods) {
      # Create a small test dataset for the current combination
      data <- tibble(
        Country = country,
        Gender = gender,
        Period = period,
        `Life Expectancy` = runif(3, 60, 80) # Random values between 60 and 90
      )
      
      # Append the data to the list
      test_simulated_data <- append(test_simulated_data, list(data))
    }
  }
}

# Combine the list into a single data frame
test_final_data <- bind_rows(test_simulated_data)

# Display a preview of the test data
print(test_final_data)

# Check basic statistics to validate the simulation
test_stats <- test_final_data %>%
  summarise(
    Mean = mean(`Life Expectancy`),
    Median = median(`Life Expectancy`),
    SD = sd(`Life Expectancy`),
    Variance = var(`Life Expectancy`),
    Count = n()
  )