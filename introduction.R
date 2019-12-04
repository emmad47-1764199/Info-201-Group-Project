intro_page <- tabPanel(
  "Introduction",
  htmlOutput("intro"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Overview"),
      p("Over three-fourths of the American population gets less than
         8 hours of sleep on workdays, yet a lack of sleep can have 
         serious effects such as poor health and a tougher lifestyle.
         Oftentimes, people prioritize other responsibilities, such as
         work, school, exercise and socialization over sleep, but at a
         certain level of lack of sleep, performance in these tasks are
         diminished. This study will assess the tradeoff between getting
        enough sleep and accomplishing these other activities."),
      p("Use this application to learn about the importance of sleep on 
         health, work performance, and happiness."),
      p("This application uses the following two datasets: ",
        a("2015 Sleep and Pain",
          href =
            "https://www.sleepfoundation.org/professionals/sleep-america-polls/2015-sleep-and-pain"
        ),
        " and ",
        a("2008 Sleep Performance and the Workplace",
          href =
            "https://www.sleepfoundation.org/professionals/sleep-america-polls/2008-sleep-performance-and-workplace"
        ),
        "."
      )
    ),
    
    mainPanel(
      plotOutput(outputId = "sleep_pie"),
      h6("This graphic displays a pie chart of the proportion of people
         that get various hours of sleep on workdays. From the chart it
         can be concluded that over 75% of people average less than 8
         hours of sleep on work nights.")
    )
  )
)