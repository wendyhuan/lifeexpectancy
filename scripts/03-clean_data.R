#### Preamble ####
# Purpose: Cleans the raw life expectancy data and recorded by 10 columns
# Author:Yanfei Huang
# Date: 25 November 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: raw data downloaded and saved from Kaggle
# Any other information needed? No

#### Workspace setup ####
install.packages("countrycode")
library(tidyverse)
library(dplyr)
library(janitor)
library(arrow)
library(countrycode)

#### Clean data ####
#Load the dataset
raw_expectancy <- read_csv("data/01-raw_data/raw_data.csv")

# Data cleaning by Filter and select relevant columns, renaming complex names, 
# filtering invalid entries, round columns into specific decimals 
cleaned_expectancy <- tryCatch(
  {
    raw_expectancy |> 
  select(Country, Year, Status, Life.expectancy, percentage.expenditure, BMI, Total.expenditure, GDP,
         Income.composition.of.resources, Schooling) |>
  rename(LifeExpectancy = Life.expectancy,
         PercentageExpenditure = percentage.expenditure,
         TotalExpenditure = Total.expenditure,
         IncomeComposition = Income.composition.of.resources) |>
  filter (
    # filtering invalid entries 
    !is.na(GDP), 
    !is.na(Year),
    !is.na(Status),
    !is.na(LifeExpectancy),
    !is.na(PercentageExpenditure),
    !is.na(BMI),
    !is.na(TotalExpenditure),
    !is.na(IncomeComposition),
    !is.na(Schooling) ) |>
  mutate(
    #Round specific columns to varying decimal places
    LifeExpectancy = round(LifeExpectancy, 2),
    PercentageExpenditure = round(PercentageExpenditure, 4),
    TotalExpenditure = round(TotalExpenditure, 2),
    GDP = round(GDP, 4),
    IncomeComposition = round(IncomeComposition, 3),
    Schooling = round(Schooling, 1)) |>
  mutate(
    #Change the name of South Korea avoiding misunderstanding
    Country = ifelse(Country == "Republic of Korea",
                           "South Korea", Country) )|>
  mutate(
    #create continent variable and check the continent of each country
    Continent = countrycode(Country, "country.name", "continent")) %>%
      ungroup() 
    cleaned_expectancy}, # error handling to mitigate any cleaning issues
  error = function(e) { 
    message("An error occurred during data cleaning: ", e)
    NULL  # Return NULL if error occurs
    })

  
  
#### Save data ####
write_csv(cleaned_expectancy, "data/02-analysis_data/analysis_data.parquet")
