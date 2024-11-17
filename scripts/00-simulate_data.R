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
set.seed(853)


#### Simulate data ####
# Define Country Name
country <- c(
  "Canada",
  "Australia",
  "Argentina",
  "Brazil",
  "United States of America",
  "Portugal",
  "Qatar",
  "Republic of Korea"
)

# Political parties
parties <- c("Labor", "Liberal", "Greens", "National", "Other")

# Create a dataset by randomly assigning states and parties to divisions
analysis_data <- tibble(
  division = paste("Division", 1:151),  # Add "Division" to make it a character
  state = sample(
    states,
    size = 151,
    replace = TRUE,
    prob = c(0.25, 0.25, 0.15, 0.1, 0.1, 0.1, 0.025, 0.025) # Rough state population distribution
  ),
  party = sample(
    parties,
    size = 151,
    replace = TRUE,
    prob = c(0.40, 0.40, 0.05, 0.1, 0.05) # Rough party distribution
  )
)


#### Save data ####
write_csv(simulated_expectancy, "data/00-simulated_data/simulated_data.csv")
