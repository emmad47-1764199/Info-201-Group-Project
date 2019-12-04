sleep_and_health_page <-  tabPanel(
  "Sleep and Health",
  htmlOutput("sleep_health"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Sleep and Health"),
      br(),
      selectInput(
        inputId = "health",
        label = "Typical Hours of Sleep vs...",
        selected = "Stress",
        choices = list("Physical Health" = "physical",
                       "Mental Health" = "mental",
                       "Stress" = "stress",
                       "Motivation" = "motivation",
                       "Sexual Relationship" = "sex")
      )
    ),
    
    mainPanel(
      plotOutput(outputId = "health_graph"),
      h3(),
      textOutput(outputId = "health_text")
    )
  )
)
