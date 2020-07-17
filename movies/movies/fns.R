saveData <- function(basic_data) {
  if (exists("responses")) {
    responses <<- rbind(as.data.frame(responses), as.data.frame(basic_data))
  } else {
    responses <<- as.data.frame(basic_data)
  }
  
  # Create a unique file name
  fileName <- paste0(paste(as.integer(Sys.time()), digest::digest(data, algo = "md5"), sep = "_"), ".csv")
  # Write the file to the local system
  write.csv(x = responses, file = file.path("responses", fileName), row.names = FALSE)
}

loadData <- function() {
  # Read all the files into a list
  files <- list.files('responses', full.names = TRUE)
  df = list()
  for(i in 1:length(files)){
    df[[i]] = read.csv(files[[i]], stringsAsFactors = F)
  }
  # Concatenate all data together into one data.frame
  data <- data.table::rbindlist(df) %>%
    as.data.frame()
  
  data %>%
    unique() %>%
    group_by(title) %>%
    summarize(votes = n())
  
}