ui <- dashboardPagePlus(
  header = dashboardHeaderPlus(title = "Film Awards Fantasy League"),
  sidebar = dashboardSidebar(disable=TRUE),
  
  body = dashboardBody(
    useShinyjs(),
    setShadow(class = "dropdown-menu"),
    
    tabBox(
      id = "tabset1",height = "500px",width=10,
      #tabPanel("Scatter Plot",plotlyOutput("plot1")),
      #tabPanel("Box Plot",plotlyOutput("plot2")),
      tabPanel(value  = "listing", "Standings",DT::dataTableOutput("table1")),
      tabPanel(value = "lineups","Lineups",DT::dataTableOutput("table2")),
      tabPanel(value="roster","Roster",DT::dataTableOutput("table3")),
      tabPanel(value="transactions","Transactions",DT::dataTableOutput("table4")),
      tabPanel(value="plays","Plays",DT::dataTableOutput("table5"))
      
    )

    # Main panel for displaying outputs ----
    #mainPanel(
      
      # Output: table
     #DT::dataTableOutput('table1')
      
   # )
  
)
)