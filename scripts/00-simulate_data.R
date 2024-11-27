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
library(countrycode)
set.seed(853)


#### Define data columns ####
# Set numbers of rows in simulated data
n<-50

# Create a mapping of countries to status
country_status_map <- tibble(
  country = c(
  "Canada", "Australia", "Argentina", "Brazil", "United States of America", "Portugal", "Qatar", "Republic of Korea"),
  status = c(
    'Developing', 'Developed', 'Developing', 'Developing', 'Developed', 'Developed', 'Developing', 'Developing')
  )

# Define Year 
year <- 2000:2015


#### Simulate data
simulated_expectancy <- tibble(
  #randomly select countries from the 10 countries above
  country = as.character(sample(country_status_map, n, replace = TRUE)) )%>%
  
  # Add the fixed status based on the country
  left_join(country_status_map, by = "country") %>%  
  
  mutate(
  #randomly select years from 2000 to 2015
  year = sample(year, n, replace = TRUE),
  
  life_expectancy = ifelse(status == "Developed",
                           #for developed countries, draw normal distribution with mean 80 and standard deviation of 5
                           rnorm(n, mean = 80, sd = 5),
                           #for developing countries, draw normal distribution with mean 65 and standard deviation of 10
                           rnorm(n, mean = 65, sd = 10)),
  
  #random value between 1 to 100,000 of Expenditure on health as a percentage of Gross Domestic Product per capita(%)
  percentage_expenditure = runif(n, min = 1, max = 100000),
  
  #uniform distribution of value of general government expenditure as a  between 1 and 20
  total_expenditure = runif(n, min = 1, max = 20),
  
  #uniform distribution of random values of human development index of income composition between 0.3 and 0.9
  income_composition_resources = runif(n, min = 0.3, max = 0.9),
  
  schooling = ifelse(status == "Developed",
                     #for developed countries, draw normal distribution with mean 15 and standard deviation of 2
                     rnorm(n, mean = 15, sd = 2),
                     #for developing countries, draw normal distribution with mean 8 and standard deviation of 3
                     rnorm(n, mean = 8, sd = 3))
)

# Ensure no negative values exist for life expectancy, BMI, GDP or Schooling
simulated_expectancy <- simulated_expectancy %>%
  mutate(
    life_expectancy = ifelse(life_expectancy < 0, 0, life_expectancy),
    schooling = ifelse(schooling < 0, 0, schooling)
  )



#### Save data ####
write_csv(simulated_expectancy, "data/00-simulated_data/simulated_data.csv")
