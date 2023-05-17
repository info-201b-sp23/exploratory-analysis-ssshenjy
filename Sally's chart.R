library(ggplot2)
library(dplyr)

state_vacc <- read.csv("us_state_vaccinations.csv", stringsAsFactors = FALSE)
state_vacc$date <- as.Date(state_vacc$date)
state_selected <- c("California", "American Samoa", "Washington", "New York State", "Pennsylvania")

state_filter <- state_vacc %>% 
  filter(location %in% state_selected & !is.na(total_vaccinations)) %>% 
  group_by(location, date)

ggplot(state_filter, aes(x = date, y = total_vaccinations, color = location)) +
  geom_line() +
  labs(title = "Total Vaccinations",
       x = "Date",
       y = "Total Vaccinations") +
  scale_x_date(date_labels = "%Y-%m", date_breaks = "6 months") +
  scale_color_manual(values = c("California" = "red", "American Samoa" = "yellow", "Washington" = "blue", "New York State" = "green", "Pennsylvania" = "cyan"))


# highest case: California --> 11983239 cases
# lowest case: American Samoa
# Washington: earliest case state
# Most deaths: New York City, New York
# sate highest ratio(death/case): Pennsylvania