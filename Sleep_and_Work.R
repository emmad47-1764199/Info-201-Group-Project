sleep_and_workplace_page <-  tabPanel(
  "Sleep and Work",
  htmlOutput("sleep_workplace"),
  sidebarLayout(
    sidebarPanel(
      h2("Sleep and the Workplace"),
      selectInput(
        inputId = "workplace",
        label = "Typical Hours of Sleep vs...",
        selected = "Highest Education",
        choices = list("Highest Education" = "education",
                       "Income" = "income",
                       "Sleeping and Driving" = "driving",
                       "Caffine" = "caffine",
                       "Quality of Life" = "quality"
                       )
      ),
      br(),
    ),
    mainPanel(
      plotOutput(outputId = "workplace_graph"),
      h3(),
      textOutput(outputId = "workplace_text"),
    )
  ),
)
