library(ggplot2)
library(dplyr)
library(scales)
library(tidyverse)
# Read the dataset
state_vacc <- read_csv("us_state_vaccinations.csv")


aggregate_data <- state_vacc %>% 
  filter(date == max(date)) %>% 
  group_by(location) %>% 
  select(date, location, total_vaccinations, people_fully_vaccinated, share_doses_used) %>%
  group_by(date) %>% 
  summarize("Average Total Doses Administered " = mean(total_vaccinations, na.rm = TRUE), 
            "Average People Fully Vaccinated" = mean(people_fully_vaccinated, na.rm = TRUE),
            "Average Shared Doses Used" = mean(share_doses_used, na.rm = TRUE))