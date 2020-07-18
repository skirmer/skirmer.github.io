
loadData <- function(votes=TRUE) {
  scp_download(ssh_sesh, "~/responses", to = "../")
  
  files <- list.files('responses', full.names = TRUE)
  df = list()
  for(i in 1:length(files)){
    df[[i]] = read.csv(files[[i]], stringsAsFactors = F)
  }
  #Concatenate all data together into one data.frame
  data <- data.table::rbindlist(df) %>%
    as.data.frame()
  
  if(votes){
    data %>%
      select(c("name", "title", "date")) %>%
      unique() %>%
      filter(title != "") %>%
      group_by("Movie" = title) %>%
      summarize(Votes = n())
  } else {
    data %>%
      select(c("name", "newtitle", "date")) %>%
      unique() %>%
      filter(newtitle != "") %>%
      group_by("Suggestion" = newtitle) %>%
      summarize(`Times Suggested` = n())
  }
}

saveData <- function(new_responses) {
  if (exists("new_responses")) {

    responses = as.data.frame(new_responses)
    # Create a unique file name
    fileName <- paste0(paste(as.integer(Sys.time()), digest::digest(data, algo = "md5"), sep = "_"), ".csv")
    # Write the file to the local system
    write.csv(x = responses, file = file.path("responses", fileName), row.names = FALSE)
    scp_upload(ssh_sesh,'./responses', to = "~/")
    
  }
}
