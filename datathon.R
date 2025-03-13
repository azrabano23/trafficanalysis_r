# Load necessary libraries
library(tidyverse)
library(viridis)
library(gridExtra)

# Create sample dataframe from the provided data
accidents <- read.csv("traffic_accidents.csv")

# Data cleaning and preparation
accidents <- accidents %>%
  mutate(
    # Convert crash_date to date only (not using for time analysis since we have crash_hour)
    crash_date = as.Date(substr(crash_date, 1, 10), format = "%m/%d/%Y"),
    # Use existing numeric fields for time analysis
    crash_hour = as.numeric(crash_hour),
    crash_day_of_week = as.numeric(crash_day_of_week),
    crash_month = as.numeric(crash_month),
    # Convert day of week to factor with labels
    day = factor(crash_day_of_week, 
                 levels = 1:7, 
                 labels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")),
    # Convert month to factor with labels
    month = factor(crash_month, 
                   levels = 1:12, 
                   labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")),
    # Create severity category for easier visualization
    severity = case_when(
      injuries_fatal > 0 ~ "Fatal",
      injuries_incapacitating > 0 ~ "Incapacitating",
      injuries_non_incapacitating > 0 ~ "Non-incapacitating",
      injuries_reported_not_evident > 0 ~ "Reported, not evident",
      injuries_no_indication > 0 ~ "No indication",
      TRUE ~ "Unknown"
    ),
    # Create a damage category
    damage_category = case_when(
      damage == "$500 OR LESS" ~ "Low (<$500)",
      damage == "$501 - $1,500" ~ "Medium ($501-$1,500)",
      damage == "OVER $1,500" ~ "High (>$1,500)",
      TRUE ~ "Unknown"
    )
  )

# 1. Crash types visualization
crash_type_plot <- accidents %>%
  count(first_crash_type) %>%
  arrange(desc(n)) %>%
  mutate(first_crash_type = factor(first_crash_type, levels = first_crash_type)) %>%
  ggplot(aes(x = first_crash_type, y = n, fill = first_crash_type)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_minimal() +
  labs(title = "Frequency of Crash Types",
       x = "Crash Type",
       y = "Count") +
  theme(legend.position = "none") +
  scale_fill_viridis_d()

# 2. Time of day distribution
time_of_day_plot <- accidents %>%
  ggplot(aes(x = crash_hour)) +
  geom_histogram(binwidth = 1, fill = "steelblue", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Crashes by Hour of Day",
       x = "Hour of Day (24h format)",
       y = "Number of Crashes") +
  scale_x_continuous(breaks = seq(0, 23, 3))

# 3. Weather and lighting conditions
weather_light_plot <- accidents %>%
  ggplot(aes(x = weather_condition, fill = lighting_condition)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Crashes by Weather and Lighting Conditions",
       x = "Weather Condition",
       y = "Count",
       fill = "Lighting Condition") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_viridis_d()

# 4. Contributing causes
cause_plot <- accidents %>%
  count(prim_contributory_cause) %>%
  arrange(desc(n)) %>%
  mutate(prim_contributory_cause = factor(prim_contributory_cause, levels = prim_contributory_cause)) %>%
  ggplot(aes(x = prim_contributory_cause, y = n, fill = prim_contributory_cause)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_minimal() +
  labs(title = "Primary Contributing Causes",
       x = "Cause",
       y = "Count") +
  theme(legend.position = "none") +
  scale_fill_viridis_d()

# 5. Injury severity by crash type
injury_by_type_plot <- accidents %>%
  ggplot(aes(x = first_crash_type, fill = severity)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Injury Severity by Crash Type",
       x = "Crash Type",
       y = "Count",
       fill = "Injury Severity") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_viridis_d()

# 6. Road conditions and crash types
road_crash_plot <- accidents %>%
  ggplot(aes(x = roadway_surface_cond, fill = first_crash_type)) +
  geom_bar(position = "dodge") +
  theme_minimal() +
  labs(title = "Crash Types by Road Surface Conditions",
       x = "Road Surface Condition",
       y = "Count",
       fill = "Crash Type") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_viridis_d()

# 7. Heatmap of crashes by day and hour
day_hour_heatmap <- accidents %>%
  count(day, crash_hour) %>%
  ggplot(aes(x = crash_hour, y = day, fill = n)) +
  geom_tile() +
  scale_fill_viridis() +
  theme_minimal() +
  labs(title = "Heatmap of Crashes by Day and Hour",
       x = "Hour of Day",
       y = "Day of Week",
       fill = "Number of Crashes") +
  scale_x_continuous(breaks = seq(0, 23, 3))

# 8. Damage amount by crash type
damage_plot <- accidents %>%
  ggplot(aes(x = first_crash_type, fill = damage_category)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Damage Amount by Crash Type",
       x = "Crash Type",
       y = "Count",
       fill = "Damage Category") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_viridis_d()

# 9. Crashes by month
month_plot <- accidents %>%
  ggplot(aes(x = month)) +
  geom_bar(fill = "darkgreen") +
  theme_minimal() +
  labs(title = "Distribution of Crashes by Month",
       x = "Month",
       y = "Number of Crashes")

# 10. Crashes by day of week
day_plot <- accidents %>%
  ggplot(aes(x = day)) +
  geom_bar(fill = "darkblue") +
  theme_minimal() +
  labs(title = "Distribution of Crashes by Day of Week",
       x = "Day of Week",
       y = "Number of Crashes")

# Display plots
print(crash_type_plot)
print(time_of_day_plot)
print(weather_light_plot)
print(cause_plot)
print(injury_by_type_plot)
print(road_crash_plot)
print(day_hour_heatmap)
print(damage_plot)
print(month_plot)
print(day_plot)

# You can also combine plots into a grid
grid.arrange(crash_type_plot, time_of_day_plot, ncol = 2)
grid.arrange(month_plot, day_plot, ncol = 2)
grid.arrange(cause_plot, injury_by_type_plot, ncol = 2)

# Additional analysis: Correlation between conditions and severity
# Create a contingency table
weather_severity_table <- table(accidents$weather_condition, accidents$severity)
print(weather_severity_table)

# Chi-square test to check for significance
chisq_result <- chisq.test(weather_severity_table)
print(chisq_result)

# Summary statistics
summary_stats <- accidents %>%
  group_by(first_crash_type) %>%
  summarize(
    count = n(),
    avg_injuries = mean(injuries_total, na.rm = TRUE),
    max_injuries = max(injuries_total, na.rm = TRUE)
  ) %>%
  arrange(desc(count))

print(summary_stats)