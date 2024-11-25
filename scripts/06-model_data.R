#### Preamble ####
# Purpose: Multiple Linear Regression Model of life expectancy of developing and developed country
# Author: Yanfei Huang
# Date: 26 November 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: Cleaned data 
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(car)
library(arrow)
library(dplyr)

#### Read data ####
cleaned_expectancy <- read_csv("data/02-analysis_data/analysis_data.parquet")

#Convert the columns into appropriate data types
cleaned_expectancy <- cleaned_expectancy %>%
  mutate(
    LifeExpectancy = as.numeric(LifeExpectancy),
    State = as.factor(State),
    PercentageExpenditure = as.numeric(PercentageExpenditure),
    BMI = as.numeric(BMI),
    TotalExpenditure = as.numeric(TotalExpenditure),
    GDP = as.numeric(GDP),
    IncomeComposition = as.numeric(IncomeComposition),
    Schooling = as.numeric(Schooling)
  )


### Model for developing country based on various predictors ###
lm_model_developing <-
  lm(LifeExpectancy ~ PercentageExpenditure + BMI + TotalExpenditure + GDP + IncomeComposition + Schooling,
     data = cleaned_expectancy %>% filter (Status == 'Developing') )

### Model for developed country based on various predictors###
lm_model_developed <-
  lm(LifeExpectancy ~ PercentageExpenditure + BMI + TotalExpenditure + GDP + IncomeComposition + Schooling,
     data = cleaned_expectancy %>% filter (Status == 'Developed') )


#### Save modified data for model as a CSV + parquet and save model as RDS ####
write_csv(cleaned_expectancy, here::here("data/02-analysis_data/analysis_data.csv"))
write_parquet(cleaned_expectancy, here::here('data/02-analysis_data/analysis_data.parquet'))
saveRDS(lm_model_developing, file = "models/lm_model_developing.rds")
saveRDS(lm_model_developed, file = "models/lm_model_developed.rds")






