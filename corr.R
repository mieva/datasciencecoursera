corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  # set working directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # find all files in the specdata folder
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  
  correlations <- vector()
  
  for(i in 1:length(file_paths)) {
    
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    
    nobs <- sum(complete.cases(current_file))
    
    if(nobs > threshold) {
            #correlations <- cor(current_file$nitrate, current_file$sulfate, use="complete.obs")
            #correlations<-rbind(correlations,cor(current_file$nitrate, current_file$sulfate, use="complete.obs"))
            correlations <- c(correlations,cor(current_file$nitrate, current_file$sulfate, use="complete.obs"), recursive = TRUE)
    }
  }
  
  return(correlations)
  
  
}