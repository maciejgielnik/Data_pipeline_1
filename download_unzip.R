if (!file.exists("specdata.zip")) {
  URL <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
  download.file(URL, destfile = "./specdata.zip")
  unzip("specdata.zip")
}

