#### Preamble ####
# Purpose: Conducts data quality tests on cleaned_expectancy dataset to insure quality and validity of data being 
           # used for furture model
# Author: Yanfei Huang
# Date: 26 November 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: R packages(tidyverse, janitor, lubridate, arrow, testthat), cleaned_expectancy
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(testthat)
library(arrow)

cleaned_expectancy <- read_csv("data/02-analysis_data/analysis_data.parquet")


#### Test data ####
# Test 1: Check for Required Columns
test_required_columns <- function(data) {
  required_columns <- c("state", "start_date", "end_date", "pollster", 
                        "numeric_grade", "transparency_score", 
                        "Trump_pct", "Harris_pct")
  missing_columns <- setdiff(required_columns, colnames(data))
  if (length(missing_columns) > 0) {
    stop(paste("Test Failed: Missing columns:", paste(missing_columns, collapse = ", ")))
  } else {
    message("Test Passed: All required columns are present.")
  }
}

# Run the test
test_required_columns(clean_poll_data)

# Test 2: Check Data Types
test_data_types <- function(data) {
  expected_types <- list(
    state = "character",
    start_date = "Date",
    end_date = "Date",
    pollster = "character",
    numeric_grade = "numeric",
    transparency_score = "numeric",
    Trump_pct = "numeric",
    Harris_pct = "numeric"
  )
  
  for (col in names(expected_types)) {
    if (!inherits(data[[col]], expected_types[[col]])) {
      stop(paste("Test Failed: Column", col, "is not of type", expected_types[[col]]))
    }
  }
  message("Test Passed: All columns have expected data types.")
}

# Run the test
test_data_types(clean_poll_data)

# Test 3: Check for NA Values in Critical Columns
test_na_values <- function(data) {
  critical_columns <- c("state", "start_date", "end_date", "Trump_pct", "Harris_pct")
  na_counts <- sapply(data[critical_columns], function(x) sum(is.na(x)))
  if (any(na_counts > 0)) {
    stop(paste("Test Failed: NA values found in columns:", 
               paste(names(na_counts[na_counts > 0]), collapse = ", ")))
  } else {
    message("Test Passed: No NA values in critical columns.")
  }
}

# Run the test
test_na_values(clean_poll_data)

# Test 4: Check Percentage Range
test_percentage_range <- function(data) {
  if (any(data$Trump_pct < 0 | data$Trump_pct > 100)) {
    stop("Test Failed: Trump_pct values are outside the range [0, 100].")
  }
  if (any(data$Harris_pct < 0 | data$Harris_pct > 100)) {
    stop("Test Failed: Harris_pct values are outside the range [0, 100].")
  }
  message("Test Passed: Percentages for Trump and Harris are within the expected range.")
}

# Run the test
test_percentage_range(clean_poll_data)

# Test 5: Check Numeric Grades and Transparency Scores
test_grades_and_scores <- function(data) {
  if (any(data$numeric_grade < 2.5)) {
    stop("Test Failed: Some numeric_grade values are below the minimum threshold of 2.5.")
  }
  if (any(data$transparency_score <= 5)) {
    stop("Test Failed: Some transparency_score values are not greater than 5.")
  }
  message("Test Passed: All numeric grades and transparency scores meet the required thresholds.")
}

# Run the test
test_grades_and_scores(clean_poll_data)














# Test that the dataset has 3 columns
test_that("dataset has 3 columns", {
  expect_equal(ncol(analysis_data), 3)
})

# Test that the 'division' column is character type
test_that("'division' is character", {
  expect_type(analysis_data$division, "character")
})

# Test that the 'party' column is character type
test_that("'party' is character", {
  expect_type(analysis_data$party, "character")
})

# Test that the 'state' column is character type
test_that("'state' is character", {
  expect_type(analysis_data$state, "character")
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})

# Test that 'division' contains unique values (no duplicates)
test_that("'division' column contains unique values", {
  expect_equal(length(unique(analysis_data$division)), 151)
})

# Test that 'state' contains only valid Australian state or territory names
valid_states <- c("New South Wales", "Victoria", "Queensland", "South Australia", "Western Australia", 
                  "Tasmania", "Northern Territory", "Australian Capital Territory")
test_that("'state' contains valid Australian state names", {
  expect_true(all(analysis_data$state %in% valid_states))
})

# Test that there are no empty strings in 'division', 'party', or 'state' columns
test_that("no empty strings in 'division', 'party', or 'state' columns", {
  expect_false(any(analysis_data$division == "" | analysis_data$party == "" | analysis_data$state == ""))
})

# Test that the 'party' column contains at least 2 unique values
test_that("'party' column contains at least 2 unique values", {
  expect_true(length(unique(analysis_data$party)) >= 2)
})