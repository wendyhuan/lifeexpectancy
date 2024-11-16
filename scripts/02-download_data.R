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
  file = "https://storage.googleapis.com/kagglesdsdata/datasets/12603/17232/Life%20Expectancy%20Data.csv?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=gcp-kaggle-com%40kaggle-161607.iam.gserviceaccount.com%2F20241116%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20241116T194624Z&X-Goog-Expires=259200&X-Goog-SignedHeaders=host&X-Goog-Signature=3625aa8b39faeba57e2605fc4ede1027504871228e573a70f4f705cea9d74260f99d2a360e566d2fba1c03b80eeff5824a7a845caef69a9dca7dfbc22e7b1e34b8786b69fa2416697ca00b63f04e4f99f44a1aa11a1e74857c71ffbddd0653c4bd37759edb8b8515c4c4c0d8b7a0f77e46fb3d4718d7900704e030ed32fd4acf61a70dbefcaca71af63a829c9f84c2aefc832e26fe961de5b577dc39b8b340e77568aac54c5e1ef692ed842a48b77eaf6ce82c6e9bd36ffc0a21cf5657a21179063af495850f0c9a45f47f3eb2f82f102f6525837e51fd269221ef5711b04a4742428bd225098bed5de89a54971001f6ccc2c208eeaf1675a09cd60591bfb463"
)


#### Save data ####
# change raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_expectancy, "data/01-raw_data/raw_data.csv") 

         
