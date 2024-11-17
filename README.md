# Global Life Expectancy: Unraveling Health and Economic Determinants (2000-2015)"
-- Analyzing Critical Factors Shaping Mortality and Well-Being Across 193 Nations

## Overview

This repository provides provides a comprehensive view of health-related statistics and factors for countries worldwide. Using open dataset provided by The World Health Organization’s (WHO) from Global Health Observatory (GHO), we analyze life expectancy and its determinants on a global scale. Data regarding life expectancy and critical health-related factors from 193 countries were combined with corresponding economic data from the United Nations, focusing on the years 2000 to 2015.
analyze the crime type and crime target under different districts of Toronto between 2014 and 2024. Our finding reveals that the crime types shift around time, with a marked rise in property-related crimes within ten years. These insights can help shape a comprehensive understanding of crime dynamics in Toronto during the 2014-2024 period and contribute to discussions on improving public safety and crime prevention strategies.

## File Structure

The repo is structured as:

-   `data/01-raw_data` contains the raw data as obtained from Kaggle providing by The Global Health Observatory (GHO) data repository under World Health Organization (WHO).
-   `data/02-analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models, specifically the Multiple Linear Regression model aimed to discuss the relationship between the life expectancy and 6 relevent predictors
-   `other` contains details about relevant literature, details about LLM (Large-Language Model) chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts` contains the R scripts used to simulate, download, clean, test and finally model the data.
-   `README.md` is the current file, which is a file that describes the key information of the project, including the abstract, a description of the files included, and statement on LLM usage.

## Statement on LLM usage

ChatGPT4o (4o-mini) was used as an LLM for this project. Debugging, formatting, and commenting were done using LLM. All chat history for the LLM usage can be found in the `inputs/llm/usage.txt` folder.

