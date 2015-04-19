corr <- function(directory, threshold = 0) {
  files <- list.files(directory, full.names = TRUE)
  countFiles <- length(files)
  dataset <- data.frame()
  df.compleet <- data.frame()
  rowsInFrame <-  0
  rowsComplete <- 0
  
  complete.cases(dataset[1,])
  dataset[1,( complete.cases(dataset[1,]))]
  
  for(file in files ){
    print (file)
    dataset <- read.table(files[file],sep = ",", header=1 )
    df.good <- complete.cases(dataset)
    df.good2 <- dataset[df.good,]
    rowsInFrame <- nrow(df.good2)
    
    if (nrow(df.compleet) <= threshold  ) {
    
        for (r in 1: rowsInFrame - rowsComplete ){
          df.compleet[r,] <- df.good2[r,]    
        }
        
    }
      
      print (i)
      dataset <-
      #Clean the data
      df.good <- complete.cases(dataset)
      df.complete <- dataset[df.good,]
      rowsInFrame <- nrow(df.complete) 
      }
   
  df.complete
}


corr("specdata", threshold = 2500)
