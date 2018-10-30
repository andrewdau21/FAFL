# Define server logic required to draw a histogram ----
server <- function(input, output) {
  tempplays<-subset(dummyplays,dummyplays$TEAM != "Free Agent")
  tempstandings<-aggregate(tempplays$POINTS,by=list(Team=tempplays$TEAM),FUN=sum)
  tempstandings<-tempstandings[order(tempstandings$x,decreasing = TRUE),]
  
  #output$table1 <- DT::renderDataTable(x[,c("first","last")])
  
  
  output$table1 <- DT::renderDataTable({
    DT::datatable(tempstandings,rownames = FALSE,colnames=c("Team","Points"))
  })
  output$table2 <- DT::renderDataTable({
    DT::datatable(dummylineups[,c("CATEGORY","PLAYER")], options = list(lengthMenu = c(13, 130), pageLength = 13),rownames=FALSE)
  })
  output$table3 <- DT::renderDataTable({
    DT::datatable(dummyroster,rownames=FALSE)
  }) 
  output$table4 <- DT::renderDataTable({
    DT::datatable(dummytransactions,rownames=FALSE)
  })
  output$table5 <- DT::renderDataTable({
    DT::datatable(dummyplays,rownames=FALSE)
  })
}
  
