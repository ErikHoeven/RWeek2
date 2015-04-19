# fetch the location on the current working directory
var.directory <- getwd()
# get all files in the data folder an put them in a vector
df.files <- dir(paste(var.directory,"/specdata", sep=""))
#for example fetch the first file in the specdata folder
fileURL <- paste(var.directory,"/specdata/",df.files[1], sep="")



pollutantmean <- function(directory, pollutant, id = 1:332) {
  mean <- 0
  # get the fileURL 
  var.fileURL <- directory
  # fetch the csv file into a matrix
  data <- read.table(var.fileURL, sep =",", header = 1)
  # Convert it to a dataframe
  df.monitor <- data.frame(data)
  
  if(pollutant == "sulfate"){
    df.sulfate <- df.monitor$sulfate
    #Filter the Na of the vector sulfate
    bad <- is.na(df.sulfate)
    df.sulfate <- df.sulfate[!bad] 
    mean <- mean(df.sulfate)
  }
  
  if(pollutant == "nitrate"){
    df.sulfate <- df.monitor$nitrate
    #Filter the Na of the vector nitrate
    bad <- is.na(df.nitrate)
    df.sulfate <- df.nitrate[!bad] 
    mean <- mean(df.nitrate)
  }
  
  mean
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
}

pollutantmean(directory = fileURL, pollutant= "sulfate", id=001)
