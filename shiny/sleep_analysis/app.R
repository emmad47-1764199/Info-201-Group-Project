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
            p("Use this application to learn about the 
              importance of sleep on health, work performance, and happiness."),
            p("This application uses the following two datasets: ",
            a("2015 Sleep and Pain", href = 
                  "https://www.sleepfoundation.org/professionals/sleep-america-polls/2015-sleep-and-pain"),
            " and ",
            a("2008 Sleep Performance and the Workplace", href = 
                  "https://www.sleepfoundation.org/professionals/sleep-america-polls/2008-sleep-performance-and-workplace"),
            "."
            )
            # image
            # img("description", src = "path")
        ),
        
        tabPanel(
            "Importance",
            htmlOutput("importance"), 
            h2("Importance"),
            p("Sleep is essential for human survival, success, and maintaining the balance for overall health yet so many still don’t view sleep as a basic human right. As a result, this study will look at the relationship between sleep, overall success and health. Sleep is a major part of health and wellbeing yet many policies surrounding poverty and workers rights don't take into account this value. This factor then raises questions on what we value and deem as important.
"),
            p("Sleep is essential to human life. Therefore, it should be prioritized to people so they can enjoy their lives at full potential. According to NHS, without the right amount of sleep people experience short term effects such as short tempers, lack of focus, and fatigue. They can also experience numerous long term effects including depression, anxiety, obesity, heart disease, and shortened life expectancy. When people suffer these consequences, it affects their daily life in many places such as relationships, work ethic, performance, and even overall self love and confidence."),
            strong("Questions to consider"),
            p("1. How does the amount of sleep one gets correlate to their work performance and lifestyle? "),
            p("2. How does the amount of sleep one gets correlate to their overall health and self-love, and happiness?")
        ),
        
        tabPanel(
            "Sleep and Workplace",
            h2("Sleep and the Workplace"),
            br(),
            htmlOutput("sleep_workplace"),
        ),
        
        tabPanel(
            "Sleep and Health",
            h2("Sleep and Health"),
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
        
        mainPanel(
         
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$intro <- renderUI({
      
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

