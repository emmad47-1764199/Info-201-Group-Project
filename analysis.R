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

# Gets the graphing function and calls it based on the given input
# ______________________________________________________________________
get_graph <- function(input) {
  # input options
  options <- c(
    "income", "caffine", "quality", "driving",
    "education", "stress", "motivation", "physical",
    "mental", "sex"
  )
  # gets index of input option given
  index <- match(input, options)
  # array of grapher functions in order with the options array
  graphs <- c(
    graph_income, graph_caffine, graph_quality,
    graph_driving, graph_education, graph_stress,
    graph_motivation, graph_physical, graph_mental,
    graph_sex
  )
  # calls grapher function and renders the graph
  graphs[[index]]()
}

# Translates columns of #s into corresponding strings from the multiple
# choice questions for example, 1 -> "Very happy"
# ______________________________________________________________________
translate <- function(col, level_col) {
  for (i in seq(1, length(col))) {
    col[i] <- level_col[as.numeric(col[i])]
  }
  return(col)
}

# Function that filters the performance data for graphs
# ______________________________________________________________________
filter_data1 <- function(col, value) {
  df <- performance %>%
    filter(q7h <= 9, q7h >= 5, performance[, col] <= value) %>%
    select(q7h, col)

  df$hrs <- sapply(df$q7h, toString)
  df$fill <- sapply(df[, col], toString)

  return(df)
}
# Function that filters the pain data for graphs
# ______________________________________________________________________
filter_data2 <- function(col, value) {
  df <- pain %>%
    filter(
      Q6_HoursB <= 9, Q6_HoursB >= 5, pain[, col] <= value,
      pain[, col] >= 1
    ) %>%
    select(Q6_HoursB, col)

  df$hrs <- sapply(df$Q6_HoursB, toString)
  df$fill <- sapply(df[, col], toString)

  return(df)
}

# Function that graphs two categorical variables based on given information
# ______________________________________________________________________
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

# Graph of education levels vs hours of sleep
# ______________________________________________________________________
graph_education <- function() {
  # filter the data
  education <- filter_data1("d6", 7)

  # specify each corresponding option with the multiple
  # choice number given
  level <- c(
    "8th grade or less", "Some high school",
    "Graduated high school", "Vocational/Tech school",
    "Some college", "Graduated college", "Advanced degree"
  )

  # specify order of data when displaying
  order <- c(
    "Advanced degree", "Graduated college",
    "Some college", "Vocational/Tech school",
    "Graduated high school", "Some high school", "8th grade or less"
  )

  # graph the two variables
  graph_two_categoricals(
    education$hrs,
    education$fill,
    level,
    "Typical Workday Hours of Sleep vs Highest Education",
    "Highest Education",
    "GnBu",
    order
  )
}

# Graph of caffeine intake vs hours of sleep
# ______________________________________________________________________
graph_caffine <- function() {
  caffine <- filter_data1("q29", 5)

  caffine$fill <- sapply(as.numeric(caffine$q29) + 1, toString)

  level <- c(
    "0", "1", "2", "3", "4", "5"
  )

  order <- c("5", "4", "3", "2", "1", "0")

  graph_two_categoricals(
    caffine$hrs,
    caffine$fill,
    level,
    "Typical Workday Hours of Sleep vs Caffeinated Beverages",
    "Typical Caffeinated Beverages
Consumed Daily",
    "YlOrBr",
    order
  )
}

# Hours of sleep vs income
# ______________________________________________________________________
graph_income <- function() {
  income <- filter_data1("d8", 7)

  level <- c(
    "Under $15,000", "$15,000 - $25,000",
    "$25,001 - $35,000", "$35,001 - $50,000",
    "$50,001 - $75,000", "$75,001 - $100,000",
    "More than $100,000"
  )
  order <- c(
    "More than $100,000", "$75,001 - $100,000",
    "$50,001 - $75,000", "$35,001 - $50,000",
    "$25,001 - $35,000", "$15,000 - $25,000",
    "Under $15,000"
  )
  graph_two_categoricals(
    income$hrs,
    income$fill,
    level,
    "Typical Workday Hours of Sleep vs Income",
    "Income Range",
    "YlGn",
    order
  )
}

# graph of employment status vs average hrs of sleep
# ______________________________________________________________________
graph_quality <- function() {
  quality <- filter_data2("Q1_B", 5)

  level <- c("Excellent", "Very Good ", "Good", "Fair", "Poor")

  graph_two_categoricals(
    quality$hrs, quality$fill,
    level,
    "Typical Workday Hours of Sleep vs Quality of Life",
    "Quality of Life",
    "RdPu",
    level
  )
}

# graph of falling asleep while driving
# ______________________________________________________________________
graph_driving <- function() {
  # filter data
  driving <- performance %>%
    select(q35) %>%
    filter(q35 <= 2)

  level <- c("Yes", "No")
  driving$q35 <- translate(driving$q35, level)
  # add labels and percentages columns
  driving <- driving %>%
    group_by(q35) %>%
    count() %>%
    ungroup() %>%
    mutate(per = `n` / sum(`n`)) %>%
    mutate(
      label = paste0(
        q35, " (",
        scales::percent(per), ")"
      )
    )
  # make stacked bar graph
  ggplot(driving, aes(x = "", y = per, fill = q35), position = "fill") +
    geom_col() +
    labs(
      title = "Proportion of People Dozing off while driving even
for a brief moment",
      x = "", y = "Percent of People"
    ) +
    guides(fill = guide_legend(title = "Have You Dozed off Driving?
Even for a Brief Moment?")) +
    geom_text(aes(label = label), vjust = 6)
}


# Hours of sleep frequency Pie chart
# ______________________________________________________________________

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

# levels (survey answers)
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
  size = 3.5,
  show.legend = F,
  nudge_x = 1
  ) +
  guides(fill = guide_legend(title = "Hrs of Sleep")) +
  labs(title = "Typical Hours of Sleep on a Workday") +
  scale_fill_brewer(palette = "BuPu")

# make graph of hrs of sleep vs stress levels
# ______________________________________________________________________
graph_stress <- function() {
  stress <- filter_data2("Q13_b", 5)

  level <- c("None", "Mild", "Moderate", "Severe", "Very Severe")
  order <- c("Very Severe", "Severe", "Moderate", "Mild", "None")

  graph_two_categoricals(
    stress$hrs, stress$fill,
    level,
    "Typical Workday Hours of Sleep vs Stress",
    "Typical Stress Level",
    "OrRd",
    order
  )
}

# make graph for hrs of sleep vs motivation for sleep
# ______________________________________________________________________
graph_motivation <- function() {
  motivation <- filter_data2("Q16", 5)

  level <- c(
    "Extremely motivated", "Very motivated",
    "Somewhat motivated", "Not that motivated",
    "Not motivated at all"
  )

  graph_two_categoricals(
    motivation$hrs, motivation$fill,
    level,
    "Typical Workday Hours of Sleep vs Motivation for Sleep",
    "Typical Motivation to get Sleep",
    "BuPu",
    level
  )
}

# make graph for hrs of sleep vs physical health
# ______________________________________________________________________
graph_physical <- function() {
  physical <- filter_data2("Q1_C", 5)

  level <- c("Excellent", "Very Good ", "Good", "Fair", "Poor")

  graph_two_categoricals(
    physical$hrs, physical$fill,
    level,
    "Typical Workday Hours of Sleep vs Physical Health",
    "Physical Health",
    "RdPu",
    level
  )
}

# make graph for hrs of sleep vs mental heatlh
# ______________________________________________________________________
graph_mental <- function() {
  mental <- filter_data2("Q1_D", 5)

  level <- c("Excellent", "Very Good ", "Good", "Fair", "Poor")

  graph_two_categoricals(
    mental$hrs, mental$fill,
    level,
    "Typical Workday Hours of Sleep vs Mental Health",
    "Mental Health",
    "Greens",
    level
  )
}

# make graph for percentages of people who say lack of sleep
# effects their sex life
# ______________________________________________________________________
graph_sex <- function() {
  sex <- filter_data1("q47", 2) %>%
    select(fill)

  level <- c("Yes", "No")
  sex$fill <- translate(sex$fill, level)

  sex <- sex %>%
    group_by(fill) %>%
    count() %>%
    ungroup() %>%
    mutate(per = `n` / sum(`n`)) %>%
    mutate(
      label = paste0(
        fill, " (",
        scales::percent(per), ")"
      )
    )

  ggplot(sex, aes(x = "", y = per, fill = fill), position = "fill") +
    geom_col() +
    labs(
      title = "Proportion of People in Which Lack of Sleep
Effects their Sexual Relationship",
      x = "", y = "Percent of People"
    ) +
    guides(fill = guide_legend(title = "Has your sexual relationship been
affected by lack of sleep?")) +
    geom_text(aes(label = label), vjust = 4)
}


# Interesting stats
# ______________________________________________________________________

# chance of making more than 75,000 on 5 and 7
# hours of sleep on workdays

# get columns for income and hrs of sleep from data
hrs_income <- performance %>%
  select(d8, q7h)
# calculate the number of people that make over 75k
high_pay <- hrs_income %>%
  filter(d8 >= 6) %>%
  summarize(
    total = length(d8)
  ) %>%
  pull(total)
# calculate the chance of making over 75k with 7hrs of sleep
chance_7 <- hrs_income %>% # 35% chance
  filter(d8 >= 6, q7h == 7) %>%
  summarize(
    chance = length(d8) / high_pay
  )
# calculate the chance of making over 75k with 5 hrs of sleep
chance_5 <- hrs_income %>% # 11% chance
  filter(d8 >= 6, q7h == 5) %>%
  summarize(
    chance = length(d8) / high_pay
  )

# calculate the difference between 5 and 7 chances
diff_5_to_7 <- chance_7 - chance_5 # 24% difference with 2 more hrs of sleep

# Get the percent of people that get less than 8 hrs of sleep (79%)
percent_less_than_8 <- sum(
  intervaled_freq[4:7],
  intervaled_freq[2]
) / sum(intervaled_freq)

# get number of hours of sleep most people who went to college get
# (7hrs)
df <- filter_data1("d6", 7) %>%
  select(d6, q7h) %>%
  filter(d6 > 4) %>%
  group_by(q7h) %>%
  summarize(
    freq = length(q7h)
  ) %>%
  filter(freq == max(freq)) %>%
  pull(q7h)

# get number of hours of sleep most people who didnt go to college get
# (6hrs)
df <- filter_data1("d6", 7) %>%
  select(d6, q7h) %>%
  filter(d6 < 4) %>%
  group_by(q7h) %>%
  summarize(
    freq = length(q7h)
  ) %>%
  filter(freq == max(freq)) %>%
  pull(q7h)
