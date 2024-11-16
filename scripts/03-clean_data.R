#### Preamble ####
# Purpose: Cleans the raw life expectancy data and recorded by six predictors
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
#Load  the dataset
raw_expectancy <- read_csv("data/01-raw_data/raw_data.csv") |> clean_names()

# Filter and select relevant columns
cleaned_expectancy <-raw_expectancy |> 
  select(Country, Year, Status, Life.expectancy, percentage.expenditure, BMI, Total.expenditure, GDP,
         Income.composition.of.resources, Schooling) |>
  filter (
    !is.na(GDP), 
    !is.na(Year),
    !is.na(Status),
    !is.na(Life.expectancy),
    !is.na(percentage.expenditure),
    !is.na(BMI),
    !is.na(Total.expenditure),
    !is.na(Income.composition.of.resources),
    !is.na(Schooling)
  )
  
  
  
  
  
  
  
  raw_data |>
  janitor::clean_names() |>
  select(wing_width_mm, wing_length_mm, flying_time_sec_first_timer) |>
  filter(wing_width_mm != "caw") |>
  mutate(
    flying_time_sec_first_timer = if_else(flying_time_sec_first_timer == "1,35",
                                   "1.35",
                                   flying_time_sec_first_timer)
  ) |>
  mutate(wing_width_mm = if_else(wing_width_mm == "490",
                                 "49",
                                 wing_width_mm)) |>
  mutate(wing_width_mm = if_else(wing_width_mm == "6",
                                 "60",
                                 wing_width_mm)) |>
  mutate(
    wing_width_mm = as.numeric(wing_width_mm),
    wing_length_mm = as.numeric(wing_length_mm),
    flying_time_sec_first_timer = as.numeric(flying_time_sec_first_timer)
  ) |>
  rename(flying_time = flying_time_sec_first_timer,
         width = wing_width_mm,
         length = wing_length_mm
         ) |> 
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_expectancy, "data/02-analysis_data/analysis_data.parquet")
