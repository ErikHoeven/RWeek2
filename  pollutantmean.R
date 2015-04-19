
pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- list.files("specdata", full.names = TRUE)
  start_sequence <- min(id)
  end_squence <- max(id)
  mean <- 0

  dataset <- data.frame()
  df.mean <- data.frame()

  for(i in start_sequence : end_squence ){
    print (files[i])
    dataset <- rbind(dataset,read.table(files[i],sep = ",", header=1 ))
  }
  
  if (pollutant == "sulfate"){
    df.sulfant <- dataset$sulfate
    df.sulfant_bad <- is.na(df.sulfant)
    df.mean <- df.sulfant[!df.sulfant_bad]
  }
  
  if (pollutant == "nitrate"){
    df.nitrate <- dataset$nitrate
    df.nitrate_bad <- is.na(df.nitrate)
    df.mean <- df.nitrate[!df.nitrate_bad]  
  }
  
  mean(df.mean)
}