library(shiny)
library(shinydashboard)
library(plotly)
library(data.table)
library(shinyjs)
library(shinyWidgets)
library(shinydashboardPlus)



#set global variables
versionname = c('FAFL')
versionnum = c(1.0)
data_standings = c('Points.csv')
data_out_standings = c('dummystandings')
data_lineups = c('Lineups.csv')
data_out_lineups = c('dummylineups')
data_transactions = c('Transactions.csv')
data_out_transactions = c('dummytransactions')
data_roster = c('Roster.csv')
data_out_roster = c('dummyroster')
data_plays = c('Plays.csv')
data_out_plays = c('dummyplays')

print("loading source functions...")
cat("\n")
print("the following functions were loaded...")
source('functions.R')
cat("\n")
print("source functions loaded...")

loadfunc(paste(data_standings), paste(data_lineups),paste(data_transactions),
         paste(data_roster),paste(data_plays),paste(data_out_standings),paste(data_out_lineups),
         paste(data_out_transactions),paste(data_out_roster),paste(data_out_plays),paste(versionname),paste(versionnum))



#x <- read.csv('./data/FAFL_movies.csv', allowEscapes = TRUE)

#x$first<- gsub("[^[:alnum:]///' ]", "", x$first)
#x$last <- gsub("[^[:alnum:]///' ]", "", x$last)
#x$MOVIE1 <- gsub("[^[:alnum:]///' ]", "", x$MOVIE1)
#x$MOVIE2 <- gsub("[^[:alnum:]///' ]", "", x$MOVIE2)
#x$MOVIE3 <- gsub("[^[:alnum:]///' ]", "", x$MOVIE3)
#x$MOVIE4 <- gsub("[^[:alnum:]///' ]", "", x$MOVIE4)
#x$MOVIE5 <- gsub("[^[:alnum:]///' ]", "", x$MOVIE5)

#freeagent <- fread('./data/FAFL_movies.csv', integer64 = "numeric",encoding = 'Latin-1')

#freeagent3 <-read.table('./data/FAFL_movies.csv', encoding = 'UTF-8', fileEncoding = 'ISO8859-1')
