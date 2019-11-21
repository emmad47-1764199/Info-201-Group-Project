#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("analysis.R")

input_list <- c("career path", "education level", "health", "self-love")
get_text_from_md_file <- function(fn) {
  return(div(HTML(markdown::markdownToHTML(fn))))
}

ui <- fluidPage(

  # Application title
  titlePanel("The Importance of Sleep"),

  # tabs at the top
  tabsetPanel(
    type = "tabs", id = "nav_bar",

    # individual page
    tabPanel(
      "Introduction",
      htmlOutput("intro"),
      h2("Overview"),
      p("Approximately one-third of the American population does not
            get enough sleep, yet a lack of sleep can have serious effects
            such as poor physical and mental health (Marcin 2017).
            Oftentimes, people prioritize other responsibilities, such as
            work, school, exercise and socialization over sleep, but at a
            certain level of lack of sleep, performance in these tasks are
            diminished. This study will assess the tradeoff between getting
            enough sleep and accomplishing these other activities.
"),
      plotOutput(outputId = "sleep_pie"),
      p("This graphic displays a pie chart of the proportion of people
            that get various hours of sleep on workdays. From the chart it
            can be concluded that over 75% of people average less than 8
            hours of sleep on work nights.
"),
      p("Use this application to learn about the
              importance of sleep on health, work performance, and
              happiness."),
      p(
        "This application uses the following two datasets: ",
        a("2015 Sleep and Pain",
          href =
            "https://www.sleepfoundation.org/professionals/sleep-
              america-polls/2015-sleep-and-pain"
        ),
        " and ",
        a("2008 Sleep Performance and the Workplace",
          href =
            "https://www.sleepfoundation.org/professionals/sleep-
              america-polls/2008-sleep-performance-and-workplace"
        ),
        "."
      )
    ),

    tabPanel(
      "Importance",
      htmlOutput("importance"),
      h2("Importance"),
      p("Sleep is essential for human survival, success, and maintaining
            the balance for overall health yet so many still dont view
            sleep as a basic human right. As a result, this study will look
            at the relationship between sleep, overall success and health.
            Sleep is a major part of health and wellbeing yet many policies
            surrounding poverty and workers rights don't take into account
            this value. This factor then raises questions on what we value
            and deem as important.
"),
      p("Sleep is essential to human life. Therefore, it should be
              prioritized to people so they can enjoy their lives at full
              potential. According to NHS, without the right amount of sleep
              people experience short term effects such as short tempers,
              lack of focus, and fatigue. They can also experience numerous
              long term effects including depression, anxiety, obesity,
              heart disease, and shortened life expectancy. When people
              suffer these consequences, it affects their daily life in
              many places such as relationships, work ethic, performance,
              and even overall self love and confidence."),
      strong("Questions to consider"),
      p("1. How does the amount of sleep one gets correlate to their
              work performance and lifestyle? "),
      p("2. How does the amount of sleep one gets correlate to their
              overall health and self-love, and happiness?")
    ),

    tabPanel(
      "Sleep and Workplace",
      h2("Sleep and the Workplace"),
      plotOutput(outputId = "income_graph"),
      p("This graphic shows a stacked bar chart of people's typical
            hours of sleep correlated to their household income.  As shown,
            there is a steady increase in income per extra hour of sleep a
            person gets. It can be concluded that at 4 hours of sleep a night,
            50% of people make over $50,000 a year, but at 9 hours of sleep,
            about 85% of people make over $50,000 a year. Therefore, with an
            extra 5 hrs of sleep a night, you have a 35% higher chance of
            making more than $50,000 a year.
"),
      br(),
      htmlOutput("sleep_workplace"),
    ),

    tabPanel(
      "Sleep and Health",
      h2("Sleep and Health"),
      plotOutput(outputId = "stress_graph"),
      p("This graphic shows a stacked bar chart of people's typical
            hours of sleep correlated to their stress levels.  As shown in
            the chart, there is a trend of getting nearly 7 hours of sleep
            a night corresponding to much lower severe stress symptoms. As
            sleep time decreases and increases below 5 and above 10, severe
            stress levels rise. It can be concluded that with 4 hours of sleep
            a night, about 25% of people experience severe stress symptoms,
            but at 7/8 hours, only about 10% of people experience these
            symptoms. Therefore, adding 4/5 hours of sleep decreases chances
            of severe stress by 15%.
"),
      br(),
      htmlOutput("sleep_health"),
    ),

    tabPanel(
      "About Us",
      h2("About Us"),
      br(),
      htmlOutput("about_us"),
      h4(strong("Team")),
      p("Emma Dickenson"),
      p("Balqisa Omar Hassan"),
      p("Jocelyn Borovich"),
      p("Rae Ouyang"),
      br(),
      p("Info-201: Technical Foundations of Informatics"),
      p("The Information School"),
      p("University of Washington"),
      p("Autumn 2019")
    ),

    mainPanel()
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$income_graph <- renderPlot({
    return(income_vs_sleep_bar)
  })
  output$stress_graph <- renderPlot({
    return(stress_vs_sleep_bar)
  })
  output$sleep_pie <- renderPlot({
    return(sleep_freq_pie)
  })
  output$intro <- renderUI({

  })
}

# Run the application
shinyApp(ui = ui, server = server)
