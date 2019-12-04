sleep_and_health_page <-  tabPanel(
  "Sleep and Health",
  htmlOutput("sleep_health"),
  sidebarLayout(
    sidebarPanel(
      h2("Sleep and Health"),
      selectInput(
        inputId = "health",
        label = "Typical Hours of Sleep vs...",
        selected = "Stress",
        choices = list("Physical Health" = "physical",
                       "Mental Health" = "mental",
                       "Stress" = "stress",
                       "Motivation" = "motivation",
                       "Sexual Relationship" = "sex"
        )
      ),
      br(),
    ),
    mainPanel(
      plotOutput(outputId = "health_graph"),
      h3(),
      textOutput(outputId = "health_text")
      # p("This graphic displays a stacked bar chart of people's typical
      #       hours of sleep correlated to their stress levels.  As shown in
      #       the chart, there is a trend of getting nearly 7 hours of sleep
      #       a night corresponding to much lower severe stress symptoms. As
      #       sleep time decreases and increases below 5 and above 10, severe
      #       stress levels rise. It can be concluded that with 4 hours of sleep
      #       a night, about 25% of people experience severe stress symptoms,
      #       but at 7/8 hours, only about 10% of people experience these
      #       symptoms. Therefore, adding 4/5 hours of sleep decreases chances
      #       of severe stress by 15%.")
    )
  ),
)
