performance <- read.csv("data/workplace_sleep.csv",
  header = TRUE,
  stringsAsFactors = FALSE
)
pain <- read.csv("data/sleep_and_pain.csv",
  header = TRUE,
  stringsAsFactors = FALSE
)
library("dplyr")
library("ggplot2")
library(scales)
library(ggrepel)

options <- c("Income", "Caffine", "Stress")

get_graph <- function(input) {
  index <- match(input, options)
  graphs <- c(graph_income, graph_caffine, graph_stress)

  graphs[[index]]()
}

get_text <- function(input) {
  index <- match(input, options)
  texts <- c(
    "This graphic displays a stacked bar chart of people's typical
            hours of sleep correlated to their household income.  As shown,
            there is a steady increase in income per extra hour of sleep a
            person gets. It can be concluded that at 4 hours of sleep a night,
            50% of people make over $50,000 a year, but at 9 hours of sleep,
            about 85% of people make over $50,000 a year. Therefore, with an
            extra 5 hrs of sleep a night, you have a 35% higher chance of
            making more than $50,000 a year.
",
    "blahh blahh blahh"
  )
  paste0(texts[[index]])
}

# Translates columns of #s into corresponding answer strings.
# Makes the asix descriptive
translate <- function(col, level_col) {
  for (i in seq(1, length(col))) {
    col[i] <- level_col[as.numeric(col[i])]
  }
  return(col)
}

# Function that graphs two categorical variables based on given
# information
graph_two_categoricals <- function(x, fill, fill_level,
                                   title, fill_label, color, order) {
  fill <- translate(fill, fill_level)
  x_level <- c(
    "1", "2", "3", "4", "5", "6", "7",
    "8", "9", "10", "11"
  )

  df <- data.frame(x, fill)

  ggplot(df, aes(
    factor(x, level = x_level),
    ..count..
  )) +
    geom_bar(aes(
      fill = factor(fill,
        level = order
      )
    ), position = "fill") +
    labs(
      title = title,
      x = "Hours of Sleep",
      y = "Percent of People"
    ) +
    guides(fill = guide_legend(title = fill_label)) +
    scale_fill_brewer(palette = color, direction = -1)
}




# Hours of sleep frequency Pie chart (performance)____________________

# function that sums specified columns
take_sum <- function(col) {
  sum(hours_of_sleep_freq[col, "freq"])
}

# filter the data
hours_of_sleep_freq <- performance %>%
  select(q7h) %>%
  filter(q7h <= 11) %>%
  group_by(q7h) %>%
  summarize(
    freq = length(q7h)
  )

# put it into intervals
intervaled_freq <- c(
  take_sum(c(9, 10, 11)), take_sum(c(1, 2, 3)), take_sum(8),
  take_sum(7), take_sum(6), take_sum(5), take_sum(4)
)

# levels (text answers)
ranges <- c(
  "more than 9", "less than 4", "8-9", "7-8", "6-7",
  "5-6", "4-5"
)

# array for specifying what index to start on in
# for loop
counts <- c(
  0, intervaled_freq[1], sum(intervaled_freq[1:2]),
  sum(intervaled_freq[1:3]), sum(intervaled_freq[1:4]),
  sum(intervaled_freq[1:5]), sum(intervaled_freq[1:6])
)

# array to fill
sleep_ranges_initial <- c(1:sum(intervaled_freq))

# translates the numbers that represent the multiple
# choice answer into the text answer
for (i in seq(1, length(intervaled_freq))) {
  for (j in seq(1, intervaled_freq[i])) {
    sleep_ranges_initial[j + counts[i]] <- ranges[i]
  }
}

sleep_ranges <- data.frame(ranges = sleep_ranges_initial)

# add label and freq columns
sleep_ranges <- sleep_ranges %>%
  group_by(ranges) %>%
  count() %>%
  ungroup() %>%
  mutate(per = `n` / sum(`n`)) %>%
  arrange(desc(ranges)) %>%
  mutate(
    label = paste0(
      ranges, " (",
      scales::percent(per), ")"
    )
  )

# create a pie chart
sleep_freq_pie <- ggplot(data = sleep_ranges) +
  geom_bar(aes(x = "", y = per, fill = ranges),
    stat = "identity", width = 1
  ) +
  coord_polar("y", start = 0) +
  theme_void() +
  geom_label_repel(aes(
    x = 1,
    y = cumsum(per) - per / 2,
    label = label
  ),
  size = 4,
  show.legend = F,
  nudge_x = 1
  ) +
  guides(fill = guide_legend(title = "Hrs of Sleep")) +
  labs(title = "Typical Hours of Sleep on a Workday") +
  scale_fill_brewer(palette = "BuPu")

# Hours of sleep vs stress graph (performance data)_______________________

graph_caffine <- function() {
  hrs_caffine <- performance %>%
    select(q29, q7h) %>%
    filter(q7h <= 9, q7h >= 4, q29 <= 5)

  hrs3 <- sapply(hrs_caffine$q7h, toString)

  caffine <- sapply(hrs_caffine$q29 + 1, toString)

  caffine_level <- c(
    "0", "1", "2", "3", "4", "5"
  )

  translate(caffine, caffine_level)

  order_caffine <- c("5", "4", "3", "2", "1", "0")

  graph_two_categoricals(
    hrs3, caffine,
    caffine_level,
    "Typical Workday Hours of Sleep
vs Caffinated Beverages",
    "Typical Caffinated Beverages
Consumed Daily",
    "YlGn",
    order_caffine
  )
}

# Hours of sleep vs income (performance data)___________

# filter data
graph_income <- function() {
  hrs_income <- performance %>%
    filter(q7h <= 9, q7h >= 4, d8 <= 7) %>%
    select(q7h, d8)

  hrs <- sapply(hrs_income$q7h, toString)

  income_range <- sapply(hrs_income$d8, toString)

  income_level <- c(
    "Under $15,000", "$15,000 - $25,000",
    "$25,001 - $35,000", "$35,001 - $50,000",
    "$50,001 - $75,000", "$75,001 - $100,000",
    "More than $100,000"
  )
  order_income <- c(
    "More than $100,000", "$75,001 - $100,000",
    "$50,001 - $75,000", "$35,001 - $50,000",
    "$25,001 - $35,000", "$15,000 - $25,000",
    "Under $15,000"
  )

  # create a stacked bar chart
  graph_two_categoricals(
    hrs, income_range,
    income_level,
    "Typical Workday Hours of Sleep
                       vs Income",
    "Income Range",
    "YlGn",
    order_income
  )
}

# hours of sleep vs stress levels (pain data) ________________

# filter data
graph_stress <- function() {
  hrs_stress <- pain %>%
    filter(Q6_HoursB <= 11, Q6_HoursB >= 3, Q13_b <= 5, Q13_b >= 1)

  hrs2 <- sapply(hrs_stress$Q6_HoursB, toString)

  stress <- sapply(hrs_stress$Q13_b, toString)

  stress_level <- c("None", "Mild", "Moderate", "Severe", "Very Severe")
  order_stress <- c("Very Severe", "Severe", "Moderate", "Mild", "None")

  df <- data.frame(hrs2, stress)

  # create a stacked bar chart
  graph_two_categoricals(
    hrs2, stress, stress_level,
    "Typical Workday Hours of Sleep
                      vs Stress",
    "Typical Stress Level",
    "OrRd",
    order_stress
  )
}
#
# # Interesting stats_______________________________________________________
#
# # chance of making more than 75,000 on 5 and 8
# # hours of sleep on workdays
#
# high_money_count <- hrs_income %>%
#   filter(d8 >= 6) %>%
#   summarize(
#     total = length(d8)
#   ) %>%
#   pull(total)
#
# chance_7 <- hrs_income %>%
#   filter(d8 >= 6, q7h == 7) %>%
#   summarize(
#     chance = length(d8) / high_money_count
#   )
#
# chance_5 <- hrs_income %>%
#   filter(d8 >= 6, q7h == 5) %>%
#   summarize(
#     chance = length(d8) / high_money_count
#   )
#
# diff_5_to_7 <- chance_7 - chance_5
#
# # Percent of people that get less than 8 hrs of sleep (79%)
#
# percent_less_than_8 <- sum(
#   intervaled_freq[4:7],
#   intervaled_freq[2]
# ) / sum(intervaled_freq)