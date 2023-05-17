library(ggplot2)
library(dplyr)

state_vacc <- read.csv("us_state_vaccinations.csv", stringsAsFactors = FALSE)
state_vacc$date <- as.Date(state_vacc$date)
state_selected <- c("California", "American Samoa", "Washington", "New York State", "Pennsylvania")

state_data_filter <- state_vacc %>% 
  filter(location %in% state_selected & !is.na(total_vaccinations)) %>% 
  group_by(location, date)

ggplot(state_data_filter, aes(x = date, y = total_vaccinations, color = location)) +
  geom_line() +
  labs(title = "Total Vaccinations of COVID-19 in selected states from 2021 to 2023",
       x = "Year",
       y = "Total Vaccinations") +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  scale_color_manual(values = c("California" = "pink", "American Samoa" = "yellow", "Washington" = "blue", "New York State" = "green", "Pennsylvania" = "cyan"))


# highest case: California --> 11983239 cases
# lowest case: American Samoa
# Washington: earliest case state
# Most deaths: New York City, New York
# state highest ratio(death/case): Pennsylvania
