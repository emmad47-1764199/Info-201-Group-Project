findings_page <- tabPanel(
  "Findings",
  htmlOutput("importance"),
  
  sidebarLayout(
    sidebarPanel(
      h4("Fun Facts"),
      h6("* Nearly 80% of people get less than 8hrs of sleep on workdays"),
      h6(),
      h6("* When averaging 7hrs of sleep, you have a 35% chance of making over 75k
         but averaging only 5hrs of sleep you have only an 11% chance"),
      h6(),
      h6("* 36% of people have at dozed off for at least a moment while driving"),
      h6(),
      h6("* People who get average 9hrs of sleep on workdays have the highest percentages
         in income, health, and quality of life"),
      h6(),
      h6("* People with the highest education typically get 7hrs of sleep on workdays")
    ),
    
    mainPanel(
      h5(strong("Questions to consider")),
      h6("1. How does the amount of sleep one gets relate to their 
         work performance and lifestyle? "),
      h6("2. How does the amount of sleep one gets relate to their
         overall health and self-love, and happiness?"),
      br(),
      h5(strong("Quick Analysis:")),
      p("Sleep is essential for human survival, success, and
        maintaining the balance for overall health yet so many 
        still don't view sleep as a basic human right. Due to 
        this fact, this study explores the relationship between sleep, 
        overall success, and health. Sleep is a major part of health and
        wellbeing yet many policies surrounding poverty and workers' rights 
        don't take into account this value.This factor then raises questions
        on what we value and deem as important. While conducting this research, 
        this study utilized pre-existing data sets that illustrate the necessity 
        and importance of sleep.") ,
       p("To start, when it comes to sleep and the workplace,
        there is a steady increase in income as individuals 
        obtain more sleep and vice versa. Individuals with 
        an annual income of less than $15,000 sleep less 
        than 8 hours a day, averaging about 5 hours of 
        sleep a night. Those who had an annual income 
        greater than $150,000 mostly slept around 9 hours 
        of sleep a night. 
        "),
       p("The amount of sleep one gets also influences the
        number of caffeinated beverages consumed daily. Those 
        who slept around 9 hours of sleep a night drank on 
        average 2-3 beverages while those who slept 4-6 hours
        on average drank up to 5 beverages.
        "),
        p("This study recognizes that sleep can be affected by
        outside factors such as stress, environment, health, etc. 
        Stress is a really big indicator of health. Those who slept 
        7/8 hours of sleep saw a reduced amount of severe stress symptoms.
        As sleep levels decrease we see an increased amount of severe and
        very severe stress levels. 
        ")
      )
  )
)
