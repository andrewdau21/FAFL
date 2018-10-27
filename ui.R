ui <- fluidPage(
  
  # App title ----
  titlePanel("FAFL8"),
  

    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: table
     DT::dataTableOutput('table1')
      
    )
  
)