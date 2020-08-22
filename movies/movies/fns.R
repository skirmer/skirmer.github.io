
library(ssh)

local_responsepath = 'responses'
local_savepath = '.'
remote_responsepath = '.'

testFilepath <- function(ssh_sesh){
  list1 <- capture.output(scp_download(ssh_sesh, ".", to = ".", verbose = TRUE))
  list2 <- capture.output(ssh_exec_wait(ssh_sesh, command = "cd responses && ls", std_out = stdout(),
                        std_err = stderr()))
  #files <- list.files('.', pattern="*.csv", full.names = TRUE, recursive = TRUE)
  
  return(paste(c(list1,list2), sep=" - ", collapse=" - "))
}


loadData <- function(votes=TRUE, ssh_sesh) {
  
  scp_download(ssh_sesh, remote_responsepath, to = local_savepath)
  
  files <- list.files(local_responsepath, pattern="*.csv", full.names = TRUE, recursive = TRUE)
  
  df = list()
  for(i in 1:length(files)){
    df[[i]] = read.csv(files[[i]], stringsAsFactors = F)
  }
  #Concatenate all data together into one data.frame
  data <- data.table::rbindlist(df) %>%
    as.data.frame()
  
  if(votes){
    tform <- data %>%
      select(c("name", "title", "date")) %>%
      unique() %>%
      filter(title != "") %>%
      group_by("Movie" = title) %>%
      summarize(Votes = n())

  } else {
    tform <- data %>%
      select(c("name", "newtitle", "date", "service")) %>%
      unique() %>%
      filter(newtitle != "") %>%
      group_by("Suggestion" = newtitle, "Service" = service) %>%
      summarize(`Times Suggested` = n())

  }
  #ssh_disconnect(ssh_sesh)
  return(tform)
}

saveData <- function(new_responses, ssh_sesh) {
  # dw <- config::get("conn")
  # ssh_sesh <- ssh::ssh_connect(host = paste0(dw$login,'@dukkhalatte.ddns.net:49500'),
  #                              passwd=dw$pwd)
  
  if (exists("new_responses")) {

    responses = as.data.frame(new_responses)
    # Create a unique file name
    fileName <- paste0(paste(as.integer(Sys.time()), digest::digest(data, algo = "md5"), sep = "_"), ".csv")
    # Write the file to the local system
    write.csv(x = responses, file = file.path(local_responsepath, fileName), row.names = FALSE)
    scp_upload(ssh_sesh,local_responsepath, to = remote_responsepath)
    
  }
  #ssh_disconnect(ssh_sesh)

  return(TRUE)
}

pullResponses <- function(ssh_sesh){
  scp_download(ssh_sesh, remote_responsepath, to = local_savepath)
  
  files <- list.files(local_responsepath, pattern="*.csv", full.names = TRUE, recursive = TRUE)
  
  df = list()
  for(i in 1:length(files)){
    df[[i]] = read.csv(files[[i]], stringsAsFactors = F)
  }
  
  return(df)
}
