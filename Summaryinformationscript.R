library(ggplot2)
library(dplyr)
library(scales)
library(tidyverse)
# Read the dataset
state_vacc <- read_csv("us_state_vaccinations.csv")

# Calculate summary statistics
mean_total_vaccinations <- mean(state_vacc$total_vaccinations, na.rm = TRUE)
mean_people_fully_vaccinated <- mean(state_vacc$people_fully_vaccinated_per_hundred, na.rm = TRUE)
max_total_vaccinations_per_hundred <- max(state_vacc$total_vaccinations_per_hundred, na.rm = TRUE)
max_daily_vaccinations <- max(state_vacc$daily_vaccinations, na.rm = TRUE)
mean_share_doses_used <- mean(state_vacc$share_doses_used, na.rm = TRUE) * 100

# Generate summary information
summary_information <- paste("The average total vaccinations administered across all states is", round(mean_total_vaccinations), "doses. On average,", round(mean_people_fully_vaccinated, 2), "percent of the population is fully vaccinated per hundred people. The highest total vaccinations per hundred people is", round(max_total_vaccinations_per_hundred, 2), "in any state. The maximum number of daily vaccinations administered in a single day is", max_daily_vaccinations, "doses. On average,", round(mean_share_doses_used, 2), "percent of the distributed vaccine doses have been used.")

# Print the summary paragraph
cat(summary_information)


