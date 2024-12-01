#### Preamble ####
# Purpose: Downloads and saves the data from 'https://www.kaggle.com/datasets/kumarajarshi/life-expectancy-who'
# Author: Yanfei Huang
# Date: 01 December 2024
# Contact: Yanfei Huang
# License: University of Toronto
# Pre-requisites: No
# Any other information needed? N/A


#### Workspace setup ####

library(tidyverse)
library(dplyr)
library(readr)

#### Download data ####

# To Access the WHO dataset: 
# 1. Visit the [WHO website]
# 2. Go to link: 'https://www.who.int/data/gho/data/indicators/indicator-details/GHO/life-expectancy-at-age-60-(years)'
# 3. Select predictors: 
# Year:2015 - 2020; Location Type: Country; by: Sex; Sex: Both Sex, Male, Female; 
# Indicator: Life expectancy at birth(years), Life expectancy at age 60(years); Select all countries in WHO region 
# 4. Download the `.csv` file with selected variables
# 5. Upload, Save and read the csv file 
lfex_data <- read_csv("/Users/wendyhuang/lifeexpectancy/data/01-raw_data/WHOlifeexpectancy.csv")

