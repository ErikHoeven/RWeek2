# fetch the location on the current working directory
var.directory <- getwd()
# get all files in the data folder an put them in a vector
df.files <- dir(paste(var.directory,"/specdata", sep=""))
#for example fetch the first file in the specdata folder
fileURL <- paste(var.directory,"/specdata/",df.files[23], sep="")



pollutantmean <- function(directory, pollutant, id = 1:332) {
  mean <- 0
  # get the files
  files <- list.files(directory)
  
  for (i in id){
    data <- read.table(var.fileURL, sep =",", header = 1)  
    
    
    
    
    
  }
  
  
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
    df.nitrate <- df.monitor$nitrate
    #Filter the Na of the vector nitrate
    bad <- is.na(df.nitrate)
    df.nitrate <- df.nitrate[!bad] 
    mean <- mean(df.nitrate)
  }
  
  mean
}

pollutantmean(directory = fileURL, pollutant= "nitrate", id=001)
