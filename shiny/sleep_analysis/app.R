#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
input_list <- c("career path", "education level", "health", "self-love")

ui <- fluidPage(

    # Application title
    titlePanel("Why Sleep when you have Netflix?"),

    # tabs at the top
    tabsetPanel(
        type = "tabs", id = "nav_bar",
        
        # individual page
        tabPanel(
            "Introduction",
            htmlOutput("intro"),
            h2("Introduction"),
            p("This is our project blah blah")
        ),
        
        tabPanel(
            "University of Washington",
            htmlOutput("UW")
        ),
        
        tabPanel(
            "About",
            htmlOutput("about")
        ),
        
        
        
        # Show a plot of the generated distribution
        mainPanel(
         
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
