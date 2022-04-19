Pipelines for measuring air pollution.

download_unzip.R 
## downloads and unzip the data.

complete.R 
## Function that reads directory of unziped files and reports number of complete cases in each id file.

complete_examples.R
## Examples of using complete function.

polutantmean.R 
## Function that calculates mean of a pollutant.
## Two pollutants available: "sulfate" and "nitrate".
## Function reads files from numbers of monitors. Each monitor is represented
## by a different id. Each id file contains number of measurements in function of
## time. Those id files are in a specified directory.
## Function calculates mean value of the pollutant, ignoring missing values. 

polutantmean_examples.R
## Examples of using pollutantmean function.

corr.R
## Function that takes a directory full of files and a threshold of complete
## cases. Then function calculates the correlation between sulfate and nitrate 
## only if the number of cases is greater then the threshold.

corr_examples.R
## Examples of using corr function.
