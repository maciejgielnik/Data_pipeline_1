
## Function that takes a directory full of files and a threshold of complete
## cases. Then function calculates the correlation between sulfate and nitrate 
## only if the number of cases is greater then the threshold.

corr <- function(directory, threshhold = 0)  {
  main_dir <- getwd()     
  setwd(directory)   
  
  ## initial parameters
  i <- 1
  a <- 1
  above_threshold <- c()
  
  ## while loop executed for every id file
  while(i <= 332) {
    
    if (i <10) {
      filename <- paste("00",i, ".csv", sep =  "")
    }
    
    if (i >9 & i <100 ) {
      filename <- paste("0",i, ".csv", sep =  "")
    }
    
    if (i >=100) {
      filename <- paste(i, ".csv", sep =  "")
    }
    
    read_file <- read.csv(filename)
    count_sulfate <-c(!is.na(  read_file ["sulfate"]))
    count_nitrate <-c(!is.na(  read_file ["nitrate"]))
    
    check_complete <- ( count_sulfate == TRUE ) & (count_nitrate == TRUE)
    nobs <- sum(check_complete)
    
    if (nobs > threshhold){
      
      read_file_clean <- read_file[complete.cases(read_file),]
      read_file_clean2 <- read_file_clean[, 2:3]
      count_corr <-cor(read_file_clean2[[2]], read_file_clean2[[1]])
      above_threshold[a] <- c(count_corr)
      a <- a +1
      
    }
    i<- i +1
  }
  
  setwd(main_dir)
  if (a > 1 ) {
    print(above_threshold)
  } else {above_threshold <- as.integer(c()) }
  
}
