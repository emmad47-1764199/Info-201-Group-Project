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