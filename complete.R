complete <- function(directory, id = 1:332) {
  files <- list.files("specdata", full.names = TRUE)
  start_sequence <- min(id)
  end_squence <- max(id)
  rows <- length(id)
  counter <- 1
  
  dataset <- data.frame()
  df.complete <- data.frame(id=numeric(rows ), nobs=numeric(rows))
  
  for(i in id ){
    print (files[i])
    dataset <- read.table(files[i],sep = ",", header=1 )
    df <- complete.cases(dataset)
    max_nobs <- nrow(dataset[df,])

    # Create a new row and assign value to the variables
    #print(i)
    df.complete$id[counter] <- i
    df.complete$nobs[counter] <- max_nobs
    counter <- counter + 1
   }
  df.complete
}



