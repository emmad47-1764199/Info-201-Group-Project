importance_page <- tabPanel(
  "Importance",
  htmlOutput("importance"),
  sidebarLayout(
    sidebarPanel(
      h2("Importance"),
      p("Sleep is essential for human survival, success, and maintaining
            the balance for overall health yet so many still dont view
            sleep as a basic human right. As a result, this study will look
            at the relationship between sleep, overall success and health.
            Sleep is a major part of health and wellbeing yet many policies
            surrounding poverty and workers rights don't take into account
            this value. This factor then raises questions on what we value
            and deem as important.
"),
      p("Sleep is essential to human life. Therefore, it should be
              prioritized to people so they can enjoy their lives at full
              potential. According to NHS, without the right amount of sleep
              people experience short term effects such as short tempers,
              lack of focus, and fatigue. They can also experience numerous
              long term effects including depression, anxiety, obesity,
              heart disease, and shortened life expectancy. When people
              suffer these consequences, it affects their daily life in
              many places such as relationships, work ethic, performance,
              and even overall self love and confidence.")
    ),
    mainPanel(
      strong("Questions to consider"),
      
      p("1. How does the amount of sleep one gets correlate to their
              work performance and lifestyle? "),
      p("2. How does the amount of sleep one gets correlate to their
              overall health and self-love, and happiness?")
    )
  )
)