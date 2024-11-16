#### Preamble ####
# Purpose: Downloads and saves the data from 'https://www.kaggle.com/datasets/kumarajarshi/life-expectancy-who'
# Author: Yanfei Huang
# Date: 27 November 2024
# Contact: Yanfei Huang
# License: University of Toronto
# Pre-requisites: No
# Any other information needed? Thanks to Kaggle opendataset


#### Workspace setup ####

library(tidyverse)
library(dplyr)

#### Download data ####
raw_expectancy <- read.csv(
  file = ""
)



#### Save data ####
# change raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_expectancy, "data/01-raw_data/raw_data.csv") 

         
