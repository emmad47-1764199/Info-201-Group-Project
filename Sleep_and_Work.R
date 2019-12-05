# Sleep and Work page containing visual graphs and captions
sleep_and_workplace_page <- tabPanel(
  "Sleep and Work",
  htmlOutput("sleep_workplace"),

  sidebarLayout(
    sidebarPanel(
      h3("Sleep and Work"),
      br(),
      selectInput(
        inputId = "workplace",
        label = "Typical Hours of Sleep vs...",
        selected = "Highest Education",
        choices = list(
          "Highest Education" = "education",
          "Income" = "income",
          "Sleeping and Driving" = "driving",
          "Caffeine" = "caffine",
          "Quality of Life" = "quality"
        )
      )
    ),

    mainPanel(
      plotOutput(outputId = "workplace_graph"),
      h3(),
      textOutput(outputId = "workplace_text")
    )
  ),
)
