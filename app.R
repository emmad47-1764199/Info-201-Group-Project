library(shiny)
library(shinythemes)
source("analysis.R")
source("introduction.R")
source("findings.R")
source("Sleep_and_Work.R")
source("Sleep_and_Health.R")
source("captions.R")
source("about_us.R")


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

    about_us_page
  )
)


server <- function(input, output) {
  
  output$sleep_pie <- renderPlot({
    return(sleep_freq_pie)
  })
  output$workplace_graph <- renderPlot({
    return(get_graph(input$workplace))
  })
  output$workplace_text <- renderText({
    return(get_text(input$workplace))
  })
  output$health_graph <- renderPlot({
    return(get_graph(input$health))
  })
  output$health_text <- renderText({
    return(get_text(input$health))
  })
  
  output$Emma_photo <- renderImage({
    list(src = "photos_of_us/Emma.jpg",
         contentType = "image/jpg",
         width = 400,
         height = 400,
         alt = "This is Emma's photo")
  },
  deleteFile = FALSE)
  
  output$Balqisa_photo <- renderImage({
    list(src = "photos_of_us/Balqisa.JPG",
         contentType = "image/jpg",
         width = 300,
         height = 400,
         alt = "This is Balqisa's photo")
  },
  deleteFile = FALSE)
  
  output$Jocelyn_photo <- renderImage({
    list(src = "photos_of_us/Jocelyn.jpg",
         contentType = "image/jpg",
         width = 800,
         height = 400,
         alt = "This is Jocelyn's photo")
  },
  deleteFile = FALSE)
  
  output$Rae_photo <- renderImage({
    list(src = "photos_of_us/Rae.JPG",
         contentType = "image/jpg",
         width = 550,
         height = 400,
         alt = "This is Rae's photo")
  },
  deleteFile = FALSE)
}


# Run the application
shinyApp(ui = ui, server = server)
