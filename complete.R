
## Function that reads directory and reports number of complete cases in each
## id file.

complete <- function(directory, id = 1:332)  {
  main_dir <- getwd()     
  setwd(directory)
  
  ## initial parameters
  idd <- id[1]
  sumup1 <- data.frame()
  a <- 0
  i <- 1
  id_length <- length(id)
  
  ## while loop executed for every id file
  while(i <= id_length) {
    
    if (id[i] <10) {
      filename <- paste("00",id[i], ".csv", sep =  "")
    }
    
    if (id[i] >9 & id[i] <100 ) {
      filename <- paste("0",id[i], ".csv", sep =  "")
    }
    
    if (id[i] >=100) {
      filename <- paste(id[i], ".csv", sep =  "")
    }
    
    read_file <- read.csv(filename)
    count_sulfate <-c(!is.na(  read_file ["sulfate"]))
    count_nitrate <-c(!is.na(  read_file ["nitrate"]))
    
    
    check_complete <- ( count_sulfate == TRUE ) & (count_nitrate == TRUE)
    nobs <- sum(check_complete)
    
    sumup2 <- data.frame(id = id[i], nobs = nobs)
    sumup1 <- rbind(sumup1, sumup2)
    
    i <- i+1
    idd <- idd +1
  }
  
  setwd(main_dir)  
  print(sumup1)
}
