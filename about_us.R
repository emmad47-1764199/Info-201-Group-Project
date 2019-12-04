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
      p(strong(("Emma Dickenson")),
      p("Hours of Sleep: 7"),
      p("Major: Pre-Informatics"),
      p("Bio: Aside from taking lots of naps, I love spending time with friends
        and teaching kids how to code. Sometimes, I feel like I have to make a 
        sacrifice between sleep, schoolwork, work, and doing things that I enjoy.
        Usually sleep is the first to go. But, when I find myself not sleeping as
        much as I should,  I start performing not as well in other aspects of my 
        life, and I definitely become very cranky."),
      br(),
      p("Reflection:  I hope to build my own application one day and building a 
        shiny application through trial and error as well as using lots of online
        sources, helped me learn the process of good design. One of the most 
        difficult aspects of our sleep analysis process was being able to design 
        the application the way we wanted it to look without having a great amount
        of experience with Shiny. This required using a lot of outside sources to
        find the proper functions to use.  "),
      br(),
      p(strong("Balqisa Omar Hassan")),
      p("Hours of Sleep: 8"),
      br(),
      p(strong("Jocelyn Borovich")),
      p("Hours of Sleep: 7"),
      p("Major: Pre-Sciences"),
      br(),
      p(strong("Rae Ouyang")),
      p("Hours of Sleep: 6"),
      p("Major: Pre-Sciences"),
    )
  ),
)
)

