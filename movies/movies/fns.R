
library(ssh)

local_responsepath = './responses/'
#local_savepath = '.'
local_savepath = './'#rankorder/'
remote_responsepath = './responses/'

pullResponses = function(ssh_session, path=local_responsepath){
  scp_download(ssh_session, remote_responsepath, to = local_savepath)
  
  files <- list.files(path, pattern="*.csv", full.names = TRUE, recursive = FALSE)
  
  df = list()
  for(i in 1:length(files)){
    df[[i]] = read.csv(files[[i]], stringsAsFactors = F)
  }
  
  return(df)
}


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
      select(c("name", "rank1", "rank2", "rank3", "rank4", "date")) %>%
      unique() %>%
      filter(rank1 != "") %>%
      group_by("Movie" = rank1) %>%
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

# pullResponses <- function(ssh_sesh){
#   scp_download(ssh_sesh, remote_responsepath, to = local_savepath)
# 
#   files <- list.files(local_responsepath, pattern="*.csv", full.names = TRUE, recursive = TRUE)
#   
#   df = list()
#   for(i in 1:length(files)){
#     df[[i]] = read.csv(files[[i]], stringsAsFactors = F)
#   }
#   
#   return(df)
# }

add_suggestion <- function(ssh_sesh){
  df = pullResponses(ssh_sesh)
  data <- data.table::rbindlist(df) %>%
    as.data.frame()
  
  tform <- data %>%
    select(c("name", "newtitle", "date", "service")) %>%
    unique() %>%
    filter(newtitle != "") %>%
    group_by("Suggestion" = newtitle, "Service" = service) %>%
    summarize(`Times Suggested` = n())
  
  return(tform)
}
