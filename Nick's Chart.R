library(tidyverse)
library(scales)
state_vacc <- read.csv("us_state_vaccinations.csv", stringsAsFactors = FALSE)
state_vacc$date <- as.Date(state_vacc$date)
state_vacc$location <- tolower(state_vacc$location)
latest_state_vacc <- state_vacc %>%
  group_by(location) %>%
  filter(date == max(date))

state_shape <- map_data("state")
View(state_shape)
combined_vacc_state <- left_join(state_shape, latest_state_vacc, by = c("region" = "location"))

View(combined_vacc_state)
ggplot(combined_vacc_state) + 
  geom_polygon(mapping = aes(x = long,
                             y = lat,
                             group = group,
                             fill = people_fully_vaccinated_per_hundred/100)) +
  scale_fill_continuous(low = 'red',
                        high = 'green',
                        labels = label_number_si()) + 
  labs(title = "Proportion of People Fully Vaccinated",
       fill = "Proportion")
  