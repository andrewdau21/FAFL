# Define server logic required to draw a histogram ----
server <- function(input, output) {
  #tempplays<-subset(dummyplays,dummyplays$TEAM != "Free Agent")
  tempplays<-subset(dummyplays,dummyplays$STATUS != "Bench")
  tempstandings<-aggregate(tempplays$POINTS,by=list(Team=tempplays$TEAM),FUN=sum)
  tempstandings<-tempstandings[order(tempstandings$x,decreasing = TRUE),]
  singh<-subset(dummylineups,dummylineups$TEAM=="Ally and Chris Singh")
  jennifer<-subset(dummylineups,dummylineups$TEAM=="Jennifer Richards")
  fischer<-subset(dummylineups,dummylineups$TEAM=="Anthony Fischer")
  timmons<-subset(dummylineups,dummylineups$TEAM=="Nicole Timmons and Cory Hudson")
  sloan<-subset(dummylineups,dummylineups$TEAM=="Rachel Sloan")
  dau<-subset(dummylineups,dummylineups$TEAM=="Amanda and Andrew Dau")
  john<-subset(dummylineups,dummylineups$TEAM=="John Richards")
  gregg<-subset(dummylineups,dummylineups$TEAM=="Jamie and Matt Gregg")
  lemmons<-subset(dummylineups,dummylineups$TEAM=="Jeff Lemmons")
  bates<-subset(dummylineups,dummylineups$TEAM=="Joshua Bates")
  
  avail<-subset(dummyroster,dummyroster$STATUS=="Waivers" | dummyroster$STATUS=="Free Agent" )
  

  #output$table1 <- DT::renderDataTable(x[,c("first","last")])
  observe({
    if(is.null(input$send) || input$send==0) return(NULL)
    from <- isolate(input$from)
    to <- isolate(input$to)
    subject <- isolate(input$subject)
    msg <- isolate(input$message)
    sendmail(from, to, subject, msg)
  })
  
  output$table1 <- DT::renderDataTable({
    DT::datatable(tempstandings,rownames = FALSE,colnames=c("Team","Points"))
  })
  output$table2 <- DT::renderDataTable({
    if(input$button == "Ally and Chris Singh"){
      DT::datatable(singh[,c("CATEGORY","PLAYER")], options = list(lengthMenu = c(17, 130), pageLength = 17),rownames=FALSE)
    }
    else if(input$button == "Jennifer Richards"){
      DT::datatable(jennifer[,c("CATEGORY","PLAYER")], options = list(lengthMenu = c(17, 130), pageLength = 17),rownames=FALSE)
    }
    else if(input$button == "Anthony Fischer"){
      DT::datatable(fischer[,c("CATEGORY","PLAYER")], options = list(lengthMenu = c(17, 130), pageLength = 17),rownames=FALSE)
    }
    else if(input$button == "Nicole Timmons and Cory Hudson"){
      DT::datatable(timmons[,c("CATEGORY","PLAYER")],options = list(lengthMenu = c(17, 130), pageLength = 17),rownames=FALSE)
    }
    else if(input$button == "Rachel Sloan"){
      DT::datatable(sloan[,c("CATEGORY","PLAYER")], options = list(lengthMenu = c(17, 130), pageLength = 17),rownames=FALSE)
    }
    else if(input$button == "Amanda and Andrew Dau"){
      DT::datatable(dau[,c("CATEGORY","PLAYER")], options = list(lengthMenu = c(17, 130), pageLength = 17),rownames=FALSE)
    }
    else if(input$button == "John Richards"){
      DT::datatable(john[,c("CATEGORY","PLAYER")], options = list(lengthMenu = c(17, 130), pageLength = 17),rownames=FALSE)
    }
    else if(input$button == "Jamie and Matt Gregg"){
      DT::datatable(gregg[,c("CATEGORY","PLAYER")], options = list(lengthMenu = c(17, 130), pageLength = 17),rownames=FALSE)
    }
    else if(input$button == "Jeff Lemmons"){
      DT::datatable(lemmons[,c("CATEGORY","PLAYER")], options = list(lengthMenu = c(17, 130), pageLength = 17),rownames=FALSE)
    }
    else if(input$button == "Joshua Bates"){
      DT::datatable(bates[,c("CATEGORY","PLAYER")], options = list(lengthMenu = c(17, 130), pageLength = 17),rownames=FALSE)
    }
  })
  output$table3 <- DT::renderDataTable({
    if(input$buttonr == "All" & input$buttonp=="All"){
      DT::datatable(dummyroster,options=list(scrollX=TRUE),rownames=FALSE)
    }	
    else if(input$buttonr == "Available" & input$buttonp=="All"){
      DT::datatable(avail,options=list(scrollX=TRUE),rownames=FALSE)
    }	
    else if(input$buttonr == "All" & input$buttonp=="Picture"){
      DT::datatable(dummyroster[grep("PICTURE",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Picture"){
      DT::datatable(avail[grep("PICTURE",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Actor"){
      DT::datatable(dummyroster[grep("ACTOR",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Actor"){
      DT::datatable(avail[grep("ACTOR",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Actress"){
      DT::datatable(dummyroster[grep("ACTRESS",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Actress"){
      DT::datatable(avail[grep("ACTRESS",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Director"){
      DT::datatable(dummyroster[grep("DIRECTOR",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Director"){
      DT::datatable(avail[grep("DIRECTOR",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Screenplay"){
      DT::datatable(dummyroster[grep("SCREENPLAY",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Screenplay"){
      DT::datatable(avail[grep("SCREENPLAY",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Animated"){
      DT::datatable(dummyroster[grep("ANIMATED",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Animated"){
      DT::datatable(avail[grep("ANIMATED",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Foreign"){
      DT::datatable(dummyroster[grep("FOREIGN",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Foreign"){
      DT::datatable(avail[grep("FOREIGN",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Documentary"){
      DT::datatable(dummyroster[grep("DOCUMENTARY",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Documentary"){
      DT::datatable(avail[grep("DOCUMENTARY",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Editor"){
      DT::datatable(dummyroster[grep("EDITOR",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Editor"){
      DT::datatable(avail[grep("EDITOR",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Cinematography"){
      DT::datatable(dummyroster[grep("CINEMATOGRAPHY",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Cinematography"){
      DT::datatable(avail[grep("CINEMATOGRAPHY",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Prod Design"){
      DT::datatable(dummyroster[grep("PRODUCTION DESIGN",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Prod Design"){
      DT::datatable(avail[grep("PRODUCTION DESIGN",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Costume Design"){
      DT::datatable(dummyroster[grep("COSTUME DESIGN",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Costume Design"){
      DT::datatable(avail[grep("COSTUME DESIGN",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Makeup"){
      DT::datatable(dummyroster[grep("MAKEUP",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Makeup"){
      DT::datatable(avail[grep("MAKEUP",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Score"){
      DT::datatable(dummyroster[grep("SCORE",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Score"){
      DT::datatable(avail[grep("SCORE",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Song"){
      DT::datatable(dummyroster[grep("SONG",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Song"){
      DT::datatable(avail[grep("SONG",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Sound"){
      DT::datatable(dummyroster[grep("SOUND",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Sound"){
      DT::datatable(avail[grep("SOUND",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "All" & input$buttonp=="Visual Effects"){
      DT::datatable(dummyroster[grep("VISUAL EFFECTS",dummyroster$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
    else if(input$buttonr == "Available" & input$buttonp=="Visual Effects"){
      DT::datatable(avail[grep("VISUAL EFFECTS",avail$Position)],options=list(scrollX=TRUE),rownames=FALSE)
    }
  })
  #output$table3 <- DT::renderDataTable({
  #  DT::datatable(dummyroster,options=list(scrollX=TRUE),rownames=FALSE)
  #}) 
  output$table4 <- DT::renderDataTable({
    DT::datatable(dummytransactions,rownames=FALSE)
  })
  output$table5 <- DT::renderDataTable({
    DT::datatable(dummyplays,options=list(scrollX=TRUE),rownames=FALSE)
  })
}
 