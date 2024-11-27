# Global Life Expectancy: Unraveling Health and Economic Determinants (2000-2015) 

## Overview

This repository provides provides a comprehensive view of health-related statistics and factors for countries worldwide.We analyze life expectancy and its determinants on a global scale. Data regarding life expectancy and critical health-related factors from 193 countries were combined with corresponding economic data from the United Nations, focusing on the years 2000 to 2015. Our finding reveals that the developed countries tend to live longer life as assumed. Econoic factor like personal expenditure on health influences the upper limit of the predicted age of life. Socio-economic factors such as schooling, income composition of resources, general government expenditure on health as well significantly influence the life expectancy. According to our prediction, the average age of persons in developed country is 80, while those in underdeveloped countries are 75.

The data used in this analysis originates from The World Health Organization’s (WHO) and Global Health Observatory (GHO). The dataset provides insights into global health indicators such as life expectancy, adult mortality, and various socio-economic factors influencing health outcomes. This repository analysis utilizes R and its robust suite of libraries to explore the relationships between these variables. 

## File Structure

The repo is structured as:

-   `data/01-raw_data` contains the raw data as obtained providing by The Global Health Observatory (GHO) data repository under World Health Organization (WHO).
-   `data/02-analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models, specifically the Multiple Linear Regression model aimed to discuss the relationship between the life expectancy and 6 relevent predictors
-   `other` contains details about relevant literature, details about LLM (Large-Language Model) chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts` contains the R scripts used to simulate, download, clean, test and finally model the data.
-   `README.md` is the current file, which is a file that describes the key information of the project, including the abstract, a description of the files included, and statement on LLM usage.

## Statement on LLM usage

ChatGPT4o (4o-mini) was used as an LLM for this project. Debugging, formatting, and commenting were done using LLM. All chat history for the LLM usage can be found in the `inputs/llm/usage.txt` folder.

