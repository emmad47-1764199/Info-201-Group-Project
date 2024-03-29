# Findigs page that describes overall findings, facts, trends and patterns.
findings_page <- tabPanel(
  "Findings",
  htmlOutput("importance"),

  sidebarLayout(
    sidebarPanel(
      h4("Fun Facts"),
      h6("* Nearly 80% of people get less than 8hrs of sleep on workdays"),
      h6(),
      h6("* When averaging 7hrs of sleep, you have a 35% chance of making
      over 75k but averaging only 5hrs of sleep you have only an 11% chance"),
      h6(),
      h6("* 36% of people have at dozed off for at least a moment while
         driving"),
      h6(),
      h6("* People who get average 9hrs of sleep on workdays have the highest
      percentages in income, health, and quality of life"),
      h6(),
      h6("* People with the highest education typically get 7hrs of sleep on
         workdays")
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
        still don't view sleep as a main priority. Due to
        this fact, this study explores the relationship between sleep,
        overall success, and health. Sleep is a major part of health and
        wellbeing which then affects lifestyle, yet many people, especially
        those surrounding poverty, don't take into account these effects.
        This then raises question: what are the effects of different levels
        of sleep? While conducting this research, this study utilized
        pre-existing data sets that illustrate the necessity and importance
        of sleep."),

      p("Overall, we concluded that people averaging 9 hours of sleep on
        worknights typically make the most money, have the best physical
        health, consume the least caffeine, and have the best quality of
        life. Interestingly, people who average 7 hours of sleep typically
        are the highest educated and have the best mental heath. This is
        likely due to the fact that going through school tends to make
        students sacrifice sleep and improve mental health. Therefore,
        resulting in higher rates than people with 8 and 9 hours."),

      p("To start, when it comes to sleep and the workplace,
        there is a steady increase in income as individuals
        obtain more sleep and vice versa. Individuals with
        an annual income of less than $15,000 sleep less
        than 8 hours a day, averaging about 5 hours of
        sleep a night. Those who had an annual income
        greater than $150,000 mostly slept around 9 hours
        of sleep a night."),

      p("The amount of sleep one gets also influences the number of caffeinated
         beverages consumed daily, coherence and everyday function. Those who
         slept around 9 hours of sleep a night drank on average 2-3 beverages
         while those who slept 4-6 hours on average drank up to 5 beverages.
         It was reported that 36% of people have fallen asleep at the wheel.
         As a result, lack of sleep can be attributed to the most common causes
         of fatal car accidents. Furthermore, sleep is also related to quality
         of life. The more sleep one gets the better they perceive their own
         lives."),

      p("This study recognizes that sleep can be affected by outside
       factors such as stress, environment, health, etc. Stress is
       a really big indicator of health. Those who slept 7/8 hours
       of sleep saw a reduced amount of severe stress symptoms.
       As sleep levels decrease we see an increased amount of
       severe and very severe stress levels. With motivation levels,
       individuals who obtain about 8 hours of sleep reported feeling
       more motivated. To continue, motivation may also influence a boost
       in mental and physical health. On average, those who slept 7 hours
       or more hours reported having very good or excellent levels of mental
       and physical health. Simultaneously, with interpersonal relationships
       22 percent of people reported that their lack of sleep affects their
       sexual relationships. ")
    )
  )
)
