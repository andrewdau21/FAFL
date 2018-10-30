loadfunc <- function(data_standings,data_lineups,data_transactions,data_roster,data_plays,
                     data_out_standings,data_out_lineups,data_out_transactions,
                     data_out_roster,data_out_plays,versionname,versionnum){
  ##BEGIN LOAD DATA PROCESS##
  print("You are entering the function: loadfunc")
  print("Data load process beginning...")
  a <- Sys.time()
  assign(paste(data_out_standings),fread(paste0('./Data/',data_standings),integer64 = "numeric"),envir=.GlobalEnv)
  assign(paste(data_out_lineups),fread(paste0('./Data/',data_lineups),integer64 = "numeric"),envir=.GlobalEnv)
  assign(paste(data_out_transactions),fread(paste0('./Data/',data_transactions),integer64 = "numeric"),envir=.GlobalEnv)
  assign(paste(data_out_roster),fread(paste0('./Data/',data_roster),integer64 = "numeric"),envir=.GlobalEnv)
  assign(paste(data_out_plays),fread(paste0('./Data/',data_plays),integer64 = "numeric"),envir=.GlobalEnv)
  print("Data load process ending...")
  b <- Sys.time()
  print(paste0("Data load process complete.  Load took ",round(as.numeric(difftime(time1 = a, time2 = b, units = "secs")), 3), " Seconds"))
  #print(paste0("Output resides in data.table: ", data_out))
  print("You are exiting the function: loadfunc")
  ##END LOAD DATA PROCESS## 
  
  
}

print("loadfunc.func")