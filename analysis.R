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
graph_two_categoricals <- function(x, fill, x_level, fill_level,
                                   title, x_label, fill_label) {
  fill <- translate(fill, fill_level)

  df <- data.frame(x, fill)

  ggplot(df, aes(
    factor(x, level = x_level),
    ..count..
  )) +
    geom_bar(aes(
      fill = factor(fill,
        level = fill_level
      )
    ), position = "fill") +
    labs(
      title = title,
      x = x_label,
      y = "Percent of People"
    ) +
    guides(fill = guide_legend(title = fill_label))
}




# Hours of sleep frequency Pie chart (performance)____________________

hours_of_sleep_freq <- performance %>%
  select(q7h) %>%
  filter(q7h <= 11) %>%
  group_by(q7h) %>%
  summarize(
    freq = length(q7h)
  )

take_sum <- function(col) {
  sum(hours_of_sleep_freq[col, "freq"])
}

intervaled_freq <- c(
  take_sum(c(9, 10, 11)), take_sum(c(1, 2, 3)), take_sum(8),
  take_sum(7), take_sum(6), take_sum(5), take_sum(4)
)

ranges <- c(
  "more than 9", "less than 4", "8-9", "7-8", "6-7",
  "5-6", "4-5"
)
counts <- c(
  0, intervaled_freq[1], sum(intervaled_freq[1:2]),
  sum(intervaled_freq[1:3]), sum(intervaled_freq[1:4]),
  sum(intervaled_freq[1:5]), sum(intervaled_freq[1:6])
)

sleep_ranges_initial <- c(1:sum(intervaled_freq))

for (i in seq(1, length(intervaled_freq))) {
  for (j in seq(1, intervaled_freq[i])) {
    sleep_ranges_initial[j + counts[i]] <- ranges[i]
  }
}

sleep_ranges <- data.frame(ranges = sleep_ranges_initial)

sleep_ranges <- sleep_ranges %>%
  group_by(ranges) %>%
  count() %>%
  ungroup() %>%
  mutate(per = `n` / sum(`n`)) %>%
  arrange(desc(ranges))

sleep_ranges$label <- paste0(
  ranges, " (",
  scales::percent(sleep_ranges$per), ")"
)

ggplot(data = sleep_ranges) +
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
  labs(title = "Typical Hours of Sleep on a Workday")

# Percent of people that get less than 8 hrs of sleep (79%)

percent_less_than_8 <- sum(
  intervaled_freq[4:7],
  intervaled_freq[2]
) / sum(intervaled_freq)





# Hours of sleep correlated to income (performance data)___________


hrs_income <- performance %>%
  filter(q7h <= 9, q7h >= 4, d8 <= 7)

hrs <- sapply(hrs_income$q7h, toString)

income_range <- sapply(hrs_income$d8, toString)

hrs_level <- c(
  "1", "2", "3", "4", "5", "6", "7",
  "8", "9", "10", "11"
)

income_level <- c(
  "Under $15,000", "$15,000 - $25,000",
  "$25,001 - $35,000", "$35,001 - $50,000",
  "$50,001 - $75,000", "$75,001 - $100,000",
  "More than $100,000"
)
graph_two_categoricals(
  hrs, income_range, hrs_level,
  income_level,
  "Typical Workday Hours of Sleep
                       Correlated to Income",
  "Hours of Sleep",
  "Income Range"
)

# Interesting stat, chance of making more than 75,000 on 5 and 8
# hours of sleep on workdays

high_money_count <- hrs_income %>%
  filter(d8 >= 6) %>%
  summarize(
    total = length(d8)
  ) %>%
  pull(total)

chance_7 <- hrs_income %>%
  filter(d8 >= 6, q7h == 7) %>%
  summarize(
    chance = length(d8) / high_money_count
  )

chance_5 <- hrs_income %>%
  filter(d8 >= 6, q7h == 5) %>%
  summarize(
    chance = length(d8) / high_money_count
  )

diff_5_to_7 <- chance_7 - chance_5

# hours of sleep correlated to stress levels ________________

# Q6_HoursB
# Q13_b

hrs_stress <- pain %>%
  filter(Q6_HoursB <= 11, Q6_HoursB >= 3, Q13_b <= 5, Q13_b >= 1)

hrs2 <- sapply(hrs_stress$Q6_HoursB, toString)

stress <- sapply(hrs_stress$Q13_b, toString)

hrs2_level <- c(
  "1", "2", "3", "4", "5", "6", "7",
  "8", "9", "10", "11", "12"
)

stress_level <- c("None", "Mild", "Moderate", "Severe", "Very Severe")

graph_two_categoricals(
  hrs2, stress, hrs2_level, stress_level,
  "Typical Workday Hours of Sleep
                       Correlated to Stress",
  "Hours of Sleep",
  "Typical Stress Level"
)

# #Symptoms from lack of sleep in the workplace bar chart
# (performance)___________________

# take_4_5 <- function(dat, col) {
#   filtered <- dat %>%
#     select(col) %>%
#     filter(dat[,col] == 4 | dat[,col] == 5)
# }
#
# effectsA <- nrow(take_4_5(performance, "q44a"))
# effectsB <- nrow(take_4_5(performance, "q44b"))
# effectsC <- nrow(take_4_5(performance, "q44c"))
# effectsD <- nrow(take_4_5(performance, "q44d"))
# effectsE <- nrow(take_4_5(performance, "q44e"))
# effectsF <- nrow(take_4_5(performance, "q44f"))
# effectsG <- nrow(take_4_5(performance, "q44g"))
# effectsH <- nrow(take_4_5(performance, "q44h"))
#
# freq_sleep_effects <- c(effectsA, effectsB, effectsC, effectsD,
#                         effectsE, effectsF, effectsG, effectsH)
#
# names <- c("Find it difficult to concentrate",
# "Have trouble organizing work",
# "Become impatient with others",
# "Avoid interactions with others",
# "Become bored at work",
# "Have to do a job over due to mistakes",
# "Notice your productivity was lower than expected",
# "Fail to finish assigned tasks")
#
# sleep_effects <- data.frame(freq_sleep_effects, names)
#
# ggplot(sleep_effects,
#   mapping = aes(
#     x = factor(names, level = names),
#     y = freq_sleep_effects
#   )
# ) +
#   geom_col() +
#   coord_flip() +
#   labs(
#     title = "The Effects of Sleep on Work Life",
#     y = "Number of People",
#     x = "Consequences from Lack of Sleep"
#   )