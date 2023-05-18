library(tidyverse)

state_vaccinations <- read.csv("us_state_vaccinations.csv") %>% 
  filter(as.Date(date) == "2023-05-10") %>%
  mutate(ratio = total_vaccinations / total_distributed)

top_states <- state_vaccinations %>%
  arrange(desc(ratio)) %>%
  head(10)

# Here is my bar chart
bar_chart <- ggplot(top_states, aes(x = reorder(location, -ratio), y = ratio)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Top 10 States with Highest Vaccination Ratio",
       x = "State",
       y = "Vaccination Ratio") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Display the bar chart
print(bar_chart)
