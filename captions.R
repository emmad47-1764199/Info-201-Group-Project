get_text <- function(input) {
  options <- c("income", "caffine", "quality", "driving",
               "education", "stress", "motivation",
               "physical", "mental", "sex")
  index <- match(input, options)
  texts <- c(
    
    "This graphic displays a stacked bar chart of people's typical
    hours of sleep in relation to their household income. As shown,
    there is a steady increase in income per extra hour of sleep a
    person gets. It can be concluded that at 4 hours of sleep a night,
    50% of people make over $50,000 a year, but at 9 hours of sleep,
    about 85% of people make over $50,000 a year. Therefore, with an
    extra 5 hrs of sleep a night, you have a 35% higher chance of
    making more than $50,000 a year.",
    
    "caffine caption",
    "quality caption",
    "driving caption",
    "education caption",
    
    "This graphic displays a stacked bar chart of people's typical
    hours of sleep in relation to their stress levels.  As shown in
    the chart, there is a trend of getting nearly 7 hours of sleep
    a night corresponding to much lower severe stress symptoms. As
    sleep time decreases and increases below 5 and above 10, severe
    stress levels rise. It can be concluded that with 4 hours of sleep
    a night, about 25% of people experience severe stress symptoms,
    but at 7/8 hours, only about 10% of people experience these
    symptoms. Therefore, adding 4/5 hours of sleep decreases chances
    of severe stress by 15%.",
    
    "motivation caption",
    "physical caption",
    "mental caption",
    "sex caption"
  )
  paste0(texts[[index]])
}
