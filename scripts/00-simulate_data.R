#### Preamble ####
# Purpose: Simulates the raw dataset of life expectancy, including the 
  #
# Author: Yanfei Huang
# Date: 26 November 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(dplyr)

# Set seed for reproducibility
set.seed(853)

#### Define data columns ####

# Define the list of countries
countries <- c("country_A", "country_B","country_C")

# Define gender
genders <- c("Male", "Female")

#Define period
periods <- 2015:2020

# Initialize an empty list to store simulated data
simulated_data <- list()

# Simulate data for each country, gender, and age group
for (country in countries) {
  for (gender in genders) {
    for (period in periods) {
      # Create a small dataset for the current combination
      data <- tibble(
        Country = country,
        Gender = gender,
        Period = period,
        `Life Expectancy` = runif(5, 40, 90) # Random values between 50 and 100
      )
      
      # Append the data to the list
      simulated_data <- append(simulated_data, list(data))
      
    }
    }
  }


# Combine the data frames in the list into a single data frame
simulated_data <- bind_rows(simulated_data)

# View the first few rows of the simulated data
head(simulated_data)

# Write the simulated data in the csv file
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")

