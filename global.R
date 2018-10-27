library(shiny)
library(data.table)
library(DT)
#library(readr)


x <- read.csv('./data/FAFL_movies.csv', allowEscapes = TRUE)


x$first<- gsub("[^[:alnum:]///' ]", "", x$first)
x$last <- gsub("[^[:alnum:]///' ]", "", x$last)
x$MOVIE1 <- gsub("[^[:alnum:]///' ]", "", x$MOVIE1)
x$MOVIE2 <- gsub("[^[:alnum:]///' ]", "", x$MOVIE2)
x$MOVIE3 <- gsub("[^[:alnum:]///' ]", "", x$MOVIE3)
x$MOVIE4 <- gsub("[^[:alnum:]///' ]", "", x$MOVIE4)
x$MOVIE5 <- gsub("[^[:alnum:]///' ]", "", x$MOVIE5)

#freeagent <- fread('./data/FAFL_movies.csv', integer64 = "numeric",encoding = 'Latin-1')

#freeagent3 <-read.table('./data/FAFL_movies.csv', encoding = 'UTF-8', fileEncoding = 'ISO8859-1')
