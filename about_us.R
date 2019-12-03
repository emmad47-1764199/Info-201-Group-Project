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