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

intro_page <- tabPanel(
  "Introduction",
  htmlOutput("intro"),
  sidebarLayout(
    sidebarPanel(
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
      p("Use this application to learn about the
              importance of sleep on health, work performance, and
              happiness."),
      p(
        "This application uses the following two datasets: ",
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
      p("This graphic displays a pie chart of the proportion of people
            that get various hours of sleep on workdays. From the chart it
            can be concluded that over 75% of people average less than 8
            hours of sleep on work nights.
")
    )
  ),
)

importance_page <- tabPanel(
  "Importance",
  htmlOutput("importance"),
  sidebarLayout(
    sidebarPanel(
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
              and even overall self love and confidence.")
    ),
    mainPanel(
      strong("Questions to consider"),
      
      p("1. How does the amount of sleep one gets correlate to their
              work performance and lifestyle? "),
      p("2. How does the amount of sleep one gets correlate to their
              overall health and self-love, and happiness?")
    )
  )
)

sleep_and_workplace_page <-  tabPanel(
  "Sleep and Work",
  htmlOutput("sleep_workplace"),
  sidebarLayout(
    sidebarPanel(
      h2("Sleep and the Workplace"),
      selectInput(
        inputId = "workplace",
        label = "Typical Hours of Sleep vs...",
        selected = "Income",
        choices = list("Income" = "Income", "Caffine" = "Caffine")
      ),
      br(),
    ),
    mainPanel(
      plotOutput(outputId = "workplace_graph"),
      textOutput(outputId = "workplace_text"),
    )
  ),
)

sleep_and_health_page <-  tabPanel(
  "Sleep and Health",
  htmlOutput("sleep_health"),
  sidebarLayout(
    sidebarPanel(
      h2("Sleep and Health"),
      br(),
    ),
    mainPanel(
      plotOutput(outputId = "stress_graph"),
      p("This graphic displays a stacked bar chart of people's typical
            hours of sleep correlated to their stress levels.  As shown in
            the chart, there is a trend of getting nearly 7 hours of sleep
            a night corresponding to much lower severe stress symptoms. As
            sleep time decreases and increases below 5 and above 10, severe
            stress levels rise. It can be concluded that with 4 hours of sleep
            a night, about 25% of people experience severe stress symptoms,
            but at 7/8 hours, only about 10% of people experience these
            symptoms. Therefore, adding 4/5 hours of sleep decreases chances
            of severe stress by 15%.
")
    )
  ),
)

about_us_page <- tabPanel(
  "About Us",
  htmlOutput("about_us"),
  sidebarLayout(
    sidebarPanel(
      h2("About Us"),
      br(),
      p("View our technical report", a("here", href = "https://github.com/emmad47-1764199/Info-201-Group-Project/wiki/Technical-Report")),
      br(),
      p("Info-201: Technical Foundations of Informatics"),
      p("The Information School"),
      p("University of Washington"),
      p("Autumn 2019")
    ),
    mainPanel(
      h4(strong("Team")),
      p("Emma Dickenson"),
      p("Balqisa Omar Hassan"),
      p("Jocelyn Borovich"),
      p("Rae Ouyang")
    )
  ),
)

ui <- fluidPage(

  # Application title
  titlePanel("The Importance of Sleep"),

  # tabs at the top
  tabsetPanel(
    type = "tabs", id = "nav_bar",

    # individual page
    intro_page,

    importance_page,

    sleep_and_workplace_page,

    sleep_and_health_page,

    about_us_page,

    mainPanel()
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$workplace_graph <- renderPlot({
    return(get_graph(input$workplace))
  })
  
  output$workplace_text <- renderText({
    return(get_text(input$workplace))
  })
  output$stress_graph <- renderPlot({
    return(get_graph("Stress"))
  })
  output$sleep_pie <- renderPlot({
    return(sleep_freq_pie)
  })
  output$intro <- renderUI({

  })
}


# Run the application
shinyApp(ui = ui, server = server)
