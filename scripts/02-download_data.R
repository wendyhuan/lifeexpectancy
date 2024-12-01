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

# go to link
# select predictors
#
lfex_data <- read_csv("/Users/wendyhuang/lifeexpectancy/data/01-raw_data/WHOlifeexpectancy.csv")
