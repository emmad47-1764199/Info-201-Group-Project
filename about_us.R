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
      img(src = "photos_of_us/Emma.JPG", alt = "Emma's Photo", height = 100, width = 100),
      p(h5(("Emma Dickenson")),
      p(strong("Hours of Sleep: "), "7"),
      p(strong("Major: "), "Pre-Informatics"),
      p(h6("Bio: "), "Aside from taking lots of naps, I love spending time with friends
        and teaching kids how to code. Sometimes, I feel like I have to make a 
        sacrifice between sleep, schoolwork, work, and doing things that I enjoy.
        Usually sleep is the first to go. But, when I find myself not sleeping as
        much as I should,  I start performing not as well in other aspects of my 
        life, and I definitely become very cranky."),
      br(),
      p(h6("Reflection: "), "I hope to build my own application one day and building a 
        shiny application through trial and error as well as using lots of online
        sources, helped me learn the process of good design. One of the most 
        difficult aspects of our sleep analysis process was being able to design 
        the application the way we wanted it to look without having a great amount
        of experience with Shiny. This required using a lot of outside sources to
        find the proper functions to use.  "),
      br(),
      img(src = "photos_of_us/Balqisa.JPG", alt = "Balqisa's Photo", height = 100, width = 100),
      p(h5("Balqisa Omar Hassan")),
      p(strong("Hours of Sleep: "), "8"),
      p(h6("Bio: "), "As a self diagnosed insomniac, nothing makes me happier than having 
        8 hours of sleep. I found that the more sleep I get, the happier and less 
        stressed I feel. During the day, I am a student researcher in a lab that 
        focuses on social policy and diversity. I am also really passionate about 
        inequality. Having the opportunity to focus our project on sleep really 
        inspired me to look into the sleep patterns of disadvantaged communities. "),
      p(h6("Reflection: "), "As a research assistant I was really excited to take this course
      and develop data science skills. Working on this project allowed me to think 
      outside of the box and outside of my comfort zone. Previously, I didn't know
      what career path I wanted to follow after college but this project inspired me 
      to look into potential career fields within user experience research."),
      br(),
      img(src = "photos_of_us/Jocelyn.JPG", alt = "Jocelyn's Photo", height = 100, width = 100),
      p(h5("Jocelyn Borovich")),
      p(strong("Hours of Sleep: "), "7"),
      p(strong("Major: "), "Informatics Hopeful"),
      p(h6("Bio: "), "I always find myself questioning sleep and why I have to do it for
        what feels like half my life. I always have all these things I want to do
        or have to do so why must I spend so much time doing absolutely nothing? 
        As a result, sleep has been the one thing that I can say had the biggest
        impact on my transition to a prestegious college from an average high school.
        It dropped my grades, my weight, my confidence, and my social life. Two horrible
        quarters later, I resort to improving my sleep schedule in complete disbelief
        that it would help anything at all. Well I was sure wrong after recieving great
        grades and having the most fun I'd ever had in college the next quarter"),
      p(),
      p(h6("Reflection: "), "Throughout this project I learned a great deal of data analysis, 
        application design, and visualizations of data. This type of coding is very
        different than what I was used to previously so this threw an initial challenge.
        As I progressed, I can say that I've begun to really like it. Data science
        fascinates me with its capabilities and power and I would love to explore the
        field much more!" ),
      br(),
      img(src = "photos_of_us/Rae.JPG", alt = "Rae's Photo", height = 100, width = 100),
      p(h5("Rae Ouyang")),
      p(strong("Hours of Sleep: "), "6"),
      p(strong("Major:"), "Pre-Sciences"),
      p(h6("Bio: "), "I used to consider sleeping a complete waste of time and thus am always
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

