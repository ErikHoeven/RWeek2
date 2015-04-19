# 1) Download the data and unpack the zip in the working directory

setwd("/home/erik/git/RWeek2/PracticeAssignment")
dataset.url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset.url,"diet_data.zip")
#unzip voor het uitpakken van de bestanden // exdir = (voor het aanmaken van mappen)
unzip("diet_data.zip", exdir ="diet_data" )

# 2) Opvragen van Meta gegvens van de Dataset 

# list files om de bestanden in een bepaalde map te tonen.
list.files("diet_data")

dataset.andy <- read.table("diet_data/Andy.csv", sep=",", header = 1)
head(dataset.andy)
#Both underlying statements give the rows of the dataset
length(dataset.andy$Day)
nrow(dataset.andy)

#Dim Andy
dim(dataset.andy)

#str (tel us something about the dataset) datatypes
str(dataset.andy)

#Summary (tell us somethng about the content of the dataset per variable)
summary(dataset.andy)

#Names (Kolom namen van de dataset)
names(dataset.andy)

# 3) Subset
dataset.andy[(dataset.andy$Day == 30), "Weight"]
dataset.andy[which(dataset.andy$Day == 30), "Weight"]
#Subsetting with multiple columns
subset(x = dataset.andy,select = c(Patient.Name,Weight), subset = dataset.andy$Day == 30)


andy_start <- dataset.andy[1, "Weight"]
andy_end <- dataset.andy[30,"Weight"]
andy_los <- andy_start - andy_end


files <- list.files("diet_data", full.names = TRUE)

files[1:3]

