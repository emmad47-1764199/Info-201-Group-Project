#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
source("analysis.R")
source("introduction.R")
source("findings.R")
source("Sleep_and_Work.R")
source("Sleep_and_Health.R")
source("about_us.R")
source("captions.R")


ui <- fluidPage(
  
  # Theme
  theme = shinytheme("cyborg"),
  
  # Application title
  titlePanel("The Importance of Sleep"),

  # tabs at the top
  tabsetPanel(
    type = "tabs", id = "nav_bar",

    # individual pages
    intro_page,

    findings_page,

    sleep_and_workplace_page,

    sleep_and_health_page,

    about_us_page,

    mainPanel()
  )
)

# server
server <- function(input, output) {
  output$workplace_graph <- renderPlot({
    return(get_graph(input$workplace))
  })
  
  output$workplace_text <- renderText({
    return(get_text(input$workplace))
  })
  output$health_graph <- renderPlot({
    return(get_graph(input$health))
  })
  output$sleep_pie <- renderPlot({
    return(sleep_freq_pie)
  })
}


# Run the application
shinyApp(ui = ui, server = server)
