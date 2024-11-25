#### Preamble ####
# Purpose: Cleans the raw life expectancy data and recorded by 10 columns
# Author:Yanfei Huang
# Date: 25 November 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: raw data downloaded and saved from Kaggle
# Any other information needed? No

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(janitor)
library(arrow)

#### Clean data ####
#Load the dataset
raw_expectancy <- read_csv("data/01-raw_data/raw_data.csv")

# Data cleaning by Filter and select relevant columns, renaming complex names, 
# filtering invalid entries, 
cleaned_expectancy <-raw_expectancy |> 
  select(Country, Year, Status, Life.expectancy, percentage.expenditure, BMI, Total.expenditure, GDP,
         Income.composition.of.resources, Schooling) |>
  rename(LifeExpectancy = Life.expectancy,
         PercentageExpenditure = percentage.expenditure,
         TotalExpenditure = Total.expenditure,
         IncomeComposition = Income.composition.of.resources) |>
  filter (
    !is.na(GDP), 
    !is.na(Year),
    !is.na(Status),
    !is.na(LifeExpectancy),
    !is.na(PercentageExpenditure),
    !is.na(BMI),
    !is.na(TotalExpenditure),
    !is.na(IncomeComposition),
    !is.na(Schooling) )
  
  
#### Save data ####
write_csv(cleaned_expectancy, "data/02-analysis_data/analysis_data.parquet")
