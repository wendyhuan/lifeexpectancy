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
library(modelsummary) # for summarizing the model

#### Read data ####
lea60 <- read_parquet("data/02-analysis_data/lea60.parquet")
leab <- read_parquet ("data/02-analysis_data/leab.parquet")

# Fit the Bayesian linear regression model using stan_glm
ledata_normal_model <- stan_glm(
  `Life Expectancy` ~ Region + Country + Income_Group + Gender, 
  data = leab, 
  family = gaussian(link = "identity"), 
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 123
)

# Create a model summary with median absolute deviation (mad) for statistics
modelsummary(
  list("Gaussian(Normal)" = ledata_normal_model),
  statistic = "mad",  # Median absolute deviation
  fmt = 2             # Format results to 2 decimal places
)

# Save the linear model
saveRDS(
  ledata_normal_model,
  file = "~/Lifeexpectancy/models/ledata_normal_model.rds"
)
