# pollutantmean <- function(directory, pollutant, id = 1:332) {
#   mean <- 0
#   # get the files
#   files <- list.files(directory, full.names = TRUE)
#   files[id]
#for (i in id){
#  data <- read.table(var.fileURL, sep =",", header = 1)   

#}


# fetch the csv file into a matrix
#data <- read.table(var.fileURL, sep =",", header = 1)
# Convert it to a dataframe
#df.monitor <- data.frame(data)

#if(pollutant == "sulfate"){
#  df.sulfate <- df.monitor$sulfate
#  #Filter the Na of the vector sulfate
#  bad <- is.na(df.sulfate)
#  df.sulfate <- df.sulfate[!bad] 
#  mean <- mean(df.sulfate)





if(pollutant == "nitrate"){
  df.nitrate <- df.monitor$nitrate
  #Filter the Na of the vector nitrate
  bad <- is.na(df.nitrate)
  df.nitrate <- df.nitrate[!bad] 
  mean <- mean(df.nitrate)