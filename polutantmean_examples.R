source("polutantmean.R")

pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 1:2)
pollutantmean("specdata", "sulfate", c(1, 3))
pollutantmean("specdata", "nitrate", c(58, 105))
pollutantmean("specdata", "nitrate")
pollutantmean("specdata", "nitrate", c(105))
