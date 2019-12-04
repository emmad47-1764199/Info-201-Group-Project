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
      #!(img)[](photos_of_us/Emma.jpg),
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
      p("Bio: As a self diagnosed insomniac, nothing makes me happier than having 
        8 hours of sleep. I found that the more sleep I get, the happier and less 
        stressed I feel. During the day, I am a student researcher in a lab that 
        focuses on social policy and diversity. I am also really passionate about 
        inequality. Having the opportunity to focus our project on sleep really 
        inspired me to look into the sleep patterns of disadvantaged communities. "),
      p("Reflection: As a research assistant I was really excited to take this course
      and develop data science skills. Working on this project allowed me to think 
      outside of the box and outside of my comfort zone. Previously, I didn't know
      what career path I wanted to follow after college but this project inspired me 
      to look into potential career fields within user experience research."),
      br(),
      p(strong("Jocelyn Borovich")),
      p("Hours of Sleep: 7"),
      p("Major: Pre-Sciences"),
      p("Bio: "),
      br(),
      p(strong("Rae Ouyang")),
      p("Hours of Sleep: 6"),
      p("Major: Pre-Sciences"),
      p("Bio: I used to consider sleeping a complete waste of time and thus am always
        willing to sacrifice my sleeping time to do other things like schoolwork and 
        entertainment. No matter how many times my teacher or parents warn me that the 
        less you sleep the lower your score is, I never believe them and keep 
        despising sleeping. However, as I grew up, I gradually realized how stupid I
        was all the time. Lack of sleeping makes me hard to focus, so in fact, most 
        of the time I put in studying or doing any serious things were just a 
        waste--low efficiency, low accuracy, and incorrect cognition have always 
        made the thing I want to achieve a mess."),
    )
  ),
)
)

