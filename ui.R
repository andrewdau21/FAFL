ui <- dashboardPagePlus(
  header = dashboardHeaderPlus(),
  sidebar = dashboardSidebar(disable=TRUE,collapsed=TRUE ),
  
  body = dashboardBody(titlePanel("Film Awards Fantasy League"),
    useShinyjs(),
    setShadow(class = "dropdown-menu"),
    
    tabBox(title="FAFL 2018-2019",
      id = "tabset1",height = "1000px",width=30,
      #tabPanel("Scatter Plot",plotlyOutput("plot1")),
      #tabPanel("Box Plot",plotlyOutput("plot2")),
      tabPanel(value  = "listing", "Standings",DT::dataTableOutput("table1")),
      tabPanel(value = "lineups","Lineups",sidebarLayout(
        sidebarPanel(radioButtons("button", "", choices=c("Ally and Chris Singh",
                                                          "Jennifer Richards",
                                                          "Anthony Fischer",
                                                          "Nicole Timmons and Cory Hudson",
                                                          "Rachel Sloan",
                                                          "Amanda and Andrew Dau",
                                                          "John Richards",
                                                          "Jamie and Matt Gregg",
                                                          "Jeff Lemmons",
                                                          "Joshua Bates"))),
        mainPanel(DT::dataTableOutput("table2")))),
      tabPanel(value="roster","Roster",sidebarLayout(
        sidebarPanel(radioButtons("buttonr", "", choices=c("All","Available")),
                     radioButtons("buttonp", "", choices=c("All","Picture",
                                                           "Actor",
                                                           "Actress",
                                                           "Director",
                                                           "Screenplay",
                                                           "Animated",
                                                           "Foreign",
                                                           "Documentary",
                                                           "Editor",
                                                           "Cinematography",
                                                           "Prod Design",
                                                           "Costume Design",
                                                           "Makeup",
                                                           "Score",
                                                           "Song",
                                                           "Sound",
                                                           "Visual Effects"))),
        mainPanel(DT::dataTableOutput("table3")))),
      tabPanel(value="transactions","Transactions",DT::dataTableOutput("table4")),
      tabPanel(value="plays","Plays",DT::dataTableOutput("table5"))
  #    tabPanel(value="email","Email", pageWithSidebar(headerPanel("Email commissioner"),
  #             
  #             sidebarPanel(
  #               textInput("from", "From:", value="from"),
  #               textInput("to", "To:", value="jdrich9999@gmail.com"),
  #               textInput("subject", "Subject:", value=""),
  #               actionButton("send", "Send mail")
  #             ),
  #             
  #             mainPanel(    
  #               aceEditor("message", value="Write message to commissioner here")
  #             ))
  #    )
    )

    # Main panel for displaying outputs ----
    #mainPanel(
      
      # Output: table
     #DT::dataTableOutput('table1')
      
   # )
  
)
)