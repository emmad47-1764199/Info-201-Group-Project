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
    
    "This graphic displays a stacked bar chart of people's typical
    hours of sleep in relation to their daily caffeine consumption
    (number of drinks per day).The graphic shows that the highest
    proportion of people who consume five caffeinated beverages per
    day are those who get the lowest amount of sleep, five hours per 
    night; whereas the smallest proportion of people who drink five
    caffeinated beverages per day is those who get the most sleep, 
    9 hours. Around 10% of people who get five hours of sleep per 
    night drink five caffeinated beverages, and for the people who
    get nine hours, of sleep the percentage of people who drink five
    cups of coffee is nearly 0%. In addition, the highest proportion
    of people who drink 0-2 caffeinated beverages per day also get 
    the most sleep. Close to 95% of people who get 9 hours of sleep 
    drink less than two cups of coffee per day. There seems to be a
    strong relationship between getting less sleep and drinking more
    coffee according to the graphic.",
    
    "This graphic displays a stacked bar chart of people's typical
    hours of sleep in relation to how they rate their quality of life.
    There is a direct relationship between getting less sleep and 
    having a more poor quality lifestyle. From 5-9 hours of sleep per
    night, with each extra hour of sleep that a person gets, a smaller
    proportion of people rate their life as being 'poor'. Around 5% of
    people who get five hours of sleep consider their lifesyle as being
    'poor'; whereas less than 1% of people with nine hours of sleep 
    consider their life to be 'poor'. The reverse trend occurs with 
    people who rate their lives as being the highest quality, 
    'excellent'. People who get more hours of sleep are more likely to 
    rate their lives as excellent than those who get less with the 
    exception of those who get six hours of sleep who have a smaller 
    proportion of people who are living an 'excellent' lifestyle than
    those who get five hours of sleep.",
    
    "This graphic displays a stacked bar chart of the percentages of 
    people who have dozed off (even if just for a second or two) while
    they were driving. Over a quarter of all drivers (35.9 %) have 
    addmitted to dozing off while driving. This is extremely dangerous
    as falling asleep at the wheel is a common cause of deadly car
    accidents.",
    
    "This graphic displays a stacked bar chart of people's typical
    hours of sleep in relation to the highest level of education
    that they have recieved. The graphic shows a relationship where
    the highest proportion of the highest level of education 
    (advanced degree) is at the median number of sleep hours (7 hours)
    as people get more or less hours of sleep than 7, there is a 
    lower proportion of people with advances degrees. Almost 25% of 
    people who get 7 hours of sleep have advanced degrees where about
    only 10% of people who get 5 hours of sleep and 10% of people who 
    get 9 hours of sleep have advanced degrees. The opposite trend 
    occurs with people who have recieved the least amount of education.
    People with 7 hours of sleep are less likely to drop out before 
    eighth grade than those with more or less hours of sleep.",
    
    "This graphic displays a stacked bar chart of people's typical
    hours of sleep in relation to their stress levels. As shown in
    the chart, there is a trend of getting nearly 7 hours of sleep
    a night corresponding to much lower severe stress symptoms. As
    sleep time decreases and increases below 5 and above 10, severe
    stress levels rise. It can be concluded that with 4 hours of sleep
    a night, about 25% of people experience severe stress symptoms,
    but at 7/8 hours, only about 10% of people experience these
    symptoms. Therefore, adding 4/5 hours of sleep decreases chances
    of severe stress by 15%.",
    
    "This graphic displays a stacked bar chart of people's typical
    hours of sleep in relation to their motivation of getting sleep. 
    The graphic shows an apparent trend that the more sleeping hours 
    people get per day, the higher motivation for sleep they possess. 
    The groups of getting 5 and 6 typical workday hours of sleep have 
    the highest percent (nearly 20%) of 'Not motivated at all', while 
    for the group of getting 8 and 9 hours of sleep per workday, only 
    about 10% of people feel 'Not motivated at all' and more than 50% 
    of the people in these groups get high motivation for sleep 
    ('Extremly motivated' and 'Very motivated').",
    
    "This graphic displays a stacked bar chart of the relationship 
    between the typical hours of sleep people get and their physical 
    health situation. There is a pretty clear trend that the more hours 
    of sleep people get, the better physical health they can possess, as 
    there is about 10% of people reported 'Poor' physical health in 5 
    typical workday hours of sleep group, but there is 0% of people 
    reported 'Poor' physical health in the group of getting 9 hours of 
    sleep per workday. What's more, the high percent of people reporting 
    'Excellent' physical health concentrates on 7 to 9 hours sleeping 
    hours group.",
    
    "This graphic displays a stacked bar chart of people's typical hours
    of sleep in relation to their mental health situation. As shown in 
    the graphic, the better mental health situation has a direct 
    relationship with getting enough hours of sleep per night (>= 7 hours). 
    However, the relationship is not as simple as the more sleep you get,
    the better mental health you possess. As the group of 7 hours of sleep
    has the highest percent of people reported 'Excellent' and 'Very Good'
    mental health sitaution, it can be concluded that the core of having
    good mental health is getting appropriate and just enough hours of 
    sleep--not too less and neither too much.",
    
    "This graphic displays a stacked bar chart of whether the lacking of
    sleep affects people's sexual relationship or not. The result turns out
    that there is not big relationship between the hours of sleep people 
    get and their sexual relationship, as 77.9% of people reported 'No' to
    the problem and only 22.1% of people reported 'Yes'."
  )
  paste0(texts[[index]])
}
