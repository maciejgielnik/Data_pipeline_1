
## Function that calculates mean of a pollutant.
## Two pollutants available: "sulfate" and "nitrate".
## Function reads  files from numbers of monitors. Each monitor is represented
## by a different id. Each id file contains number of measurements in function of
## time. Those id files are in a specified directory.
## Function calculates mean value of the pollutant, ignoring missing values. 

pollutantmean <- function(directory, pollutant, id = 1:332)  {
  main_dir <- getwd()     
  setwd(directory)        
  
  ## initial parameters
  i <- 1  
  idd <- id[1] 
  id_length <- length(id)   
  
  sumup1 <- data.frame()
  ## while loop executed for every id file
  while(i <= id_length) { 
    
    # conditions for loading file names
    if (id[i] <10) {
      filename <- paste("00",id[i], ".csv", sep =  "")
    }
    
    if (id[i] >9 & id[i] <100 ) {
      filename <- paste("0",id[i], ".csv", sep =  "")
    }
    
    if (id[i] >=100) {
      filename <- paste(id[i], ".csv", sep =  "")
    }
    
    z <- read.csv(filename)
    y <- z[pollutant]
    y_clean <- y[!is.na(y)]
    suma <- sum(y_clean)
    noTRUE <- !is.na(y)
    no <- sum(noTRUE)
    
    sumup2 <- data.frame(no = no, suma = suma)
    sumup1 <- rbind(sumup1, sumup2)
    
    i <- i+1
    idd <- idd +1
  } 
  
  data_ave <- colSums(sumup1)
  fin1 <- data_ave[2]/data_ave[1]
  fin2 <-as.vector (fin1)
  print(fin2)
  
  setwd(main_dir)
}
