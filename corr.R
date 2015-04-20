#NAME : Erik van der Hoeven
#FILE : corr.R
#PURPUSE:
# Write a function that takes a directory of data files and a threshold for complete cases and calculates 
# the correlation between sulfate and nitrate for monitor locations where the number of completely observed 
# cases (on all variables) is greater than the threshold. The function should return a vector of correlations 
# for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the 
# function should return a numeric vector of length 0. A prototype of this function follows 


corr <- function(directory, threshold = 0) {
  #Load files into a vector with the FQDN
  files <- list.files(directory, full.names = TRUE)
  #Count elements in vector
  countFiles <- length(files)
  #Create an empty array for loading an csv file
  dataset <- data.frame()
  #Create an empty array for storing complete cases
  df.compleet <- data.frame()
  #initialize counters
  rowsInFrame <-  0
  rowsComplete <- 0
  
  complete.cases(dataset[1,])
  dataset[1,( complete.cases(dataset[1,]))]
  #loop through files untill the threshold is reached!
  for(file in files ){
    #print (file)
    #Load file into data frame dataset
    dataset <- read.table(file,sep = ",", header=1 )
    df.good <- complete.cases(dataset)
    #Filter the complete cases
    df.good2 <- dataset[df.good,]
    rowsInFrame <- nrow(df.good2)
    
    #When the ammount of loaded complete cases is less or equeal to thresshold fill the data frame df.compleet 
    if (nrow(df.compleet) <= threshold  ) {
      if (threshold >= (rowsInFrame + rowsComplete) ){
        print(paste (file," Load compleet frame:[Completed Cases Loaded: ",rowsComplete,"Rows ready for loading:", rowsInFrame,"]" ))
        df.compleet <- rbind(df.compleet,df.good2)
        rowsComplete <- nrow(df.compleet)
        }

  cor(df.compleet$sulfate,df.compleet$nitrate)
}

#Check the answer
corr("specdata", threshold = 150)

#The right anwer must be
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589

