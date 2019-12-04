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

get_graph <- function(input) {
  
  options <- c("income", "caffine", "employment",
               "driving",
               "education", "stress")#########
  
  index <- match(input, options)
  graphs <- c(graph_income, graph_caffine, graph_employment,
              graph_driving, graph_education,
              graph_stress)#########

  graphs[[index]]()
}

# Translates columns of #s into corresponding answer strings.
# Makes the asix descriptive
translate <- function(col, level_col) {
  for (i in seq(1, length(col))) {
    col[i] <- level_col[as.numeric(col[i])]
  }
  return(col)
}

#function that filters the data for performance graphs
filter_data1 <- function(col, value) {
  df <- performance %>% 
    filter(q7h <= 9, q7h >= 4, performance[,col] <= value) %>%
    select(q7h, col)
  
  df$hrs <- sapply(df$q7h, toString)
  df$fill <- sapply(df[,col], toString)
  
  return(df)
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

# graph_marital <- function() {
#   marital <- filter_data1("d5", 5)
# 
#   marital <- marital %>%
#     group_by(d5) %>%
#     summarize(
#       average = sum(q7h) / length(q7h)
#     )
#   
#   level <- c("Poor", "Fair",
#              "Good", "Very good",
#              "Excellent")
#   
#   marital$d5 <- translate(marital$d5, level)
#   
# ggplot(marital) + geom_col(aes(x = d5, y = average, fill = d5)) +
#   labs(title = "Typical Sleep on Workdays vs Marital Status",
#        x = "Marital Status", y = "Average Hours of Sleep") +
#   scale_fill_brewer(palette = "BrBG") +
#   guides(fill = guide_legend(title = "Marital Status" ))
# }

#graph of education levels vs hours of sleep 
graph_education <- function() {
  education <- filter_data1("d6", 7)
  
  level <- c(
    "8th grade or less", "Some high school",
    "Graduated high school", "Vocational/Tech school",
    "Some college", "Graduated college", "Advanced degree"
  )
  
  order <- c(
    "Advanced degree", "Graduated college",
    "Some college", "Vocational/Tech school",
    "Graduated high school", "Some high school", "8th grade or less"
  )
  
  graph_two_categoricals(
    education$hrs,
    education$fill,
    level,
    "Typical Workday Hours of Sleep
vs Caffinated Beverages",
    "Typical Caffinated Beverages
Consumed Daily",
    "GnBu",
    order
  )
  
  
}

# graph of caffine intake vs hours of sleep 
graph_caffine <- function() {
  caffine <- filter_data1("q29", 5)

  caffine$fill <- sapply(as.numeric(caffine$q29) + 1, toString)

  level <- c(
    "0", "1", "2", "3", "4", "5"
  )

  translate(caffine$fill, level)

  order <- c("5", "4", "3", "2", "1", "0")

  graph_two_categoricals(
    caffine$hrs,
    caffine$fill,
    level,
    "Typical Workday Hours of Sleep
vs Caffinated Beverages",
    "Typical Caffinated Beverages
Consumed Daily",
    "YlOrBr",
    order
  )
}

# Hours of sleep vs income (performance data)___________

# filter data
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
  
  # create a stacked bar chart
  graph_two_categoricals(
    income$hrs,
    income$fill,
    level,
    "Typical Workday Hours of Sleep
                       vs Income",
    "Income Range",
    "YlGn",
    order
  )
}

# graph of employment status vs average hrs of sleep 
graph_employment <- function() {
  employment <- filter_data1("qs2", 3)

  employment <- employment %>%
      group_by(qs2) %>%
      summarize(
        average = sum(q7h) / length(q7h)
      )

  level <- c("Working more than one job", "Working full-time", "Working part-time")
  
  employment$qs2 <- translate(employment$qs2, level)

  ggplot(employment) + geom_col(aes(x = qs2, y = average, fill = qs2)) +
      labs(title = "Average Sleep on Workdays vs Employment Status",
           x = "Employment Status", y = "Average Hours of Sleep") +
      guides(fill = guide_legend(title = "Employment Status" ))
}

# Graph of falling asleep while driving_________________________________
graph_driving <- function() {
  driving <- performance %>%
    select(q35) %>%
    filter(q35 <= 2)
  
  level <- c("Yes", "No")
  driving$q35 <- translate(driving$q35, level)
  
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

  ggplot(driving, aes(x = "", y = per , fill = q35), position = "fill") +
    geom_col() +
    labs(title = "Proportion of People Dozing off while driving
even for a brief moment",
    x =  "", y = "Percent of People") +
    guides(fill = guide_legend(title = "Have You Dozed off Driving?
Even for a Brief Moment?")) +
    geom_text(aes(label = label), vjust = 6)
}


# Hours of sleep frequency Pie chart (performance)____________________

# function that sums specified columns
take_sum <- function(col) {
  sum(hours_of_sleep_freq[col, "freq"])
}

# # filter the data
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
  size = 3.5,
  show.legend = F,
  nudge_x = 1
  ) +
  guides(fill = guide_legend(title = "Hrs of Sleep")) +
  labs(title = "Typical Hours of Sleep on a Workday") +
  scale_fill_brewer(palette = "BuPu")

# hours of sleep vs stress levels (pain data) ________________

# filter data
graph_stress <- function() {
  hrs_stress <- pain %>%
    filter(Q6_HoursB <= 11, Q6_HoursB >= 3, Q13_b <= 5, Q13_b >= 1)

  hrs <- sapply(hrs_stress$Q6_HoursB, toString)

  stress <- sapply(hrs_stress$Q13_b, toString)

  level <- c("None", "Mild", "Moderate", "Severe", "Very Severe")
  order <- c("Very Severe", "Severe", "Moderate", "Mild", "None")

  df <- data.frame(hrs, stress)

  # create a stacked bar chart
  graph_two_categoricals(
    hrs, stress, level,
    "Typical Workday Hours of Sleep
                      vs Stress",
    "Typical Stress Level",
    "OrRd",
    order
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