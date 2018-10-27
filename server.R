# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  
  output$table1 <- DT::renderDataTable(x[,c("first","last")])
  
  
  
}