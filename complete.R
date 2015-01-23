complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # set working directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # find all files in the specdata folder
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  
  #idvect <- c()
  #nobsvect <- c()
  
  df2 <- data.frame()
  #idd<-id
  
  for(i in id) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    
    nobs <- sum(complete.cases(current_file))
    id= i
    
    df2<-rbind(df2,data.frame("id"=id,"nobs"=nobs))
  }
  
  return(df2)
  
}