#install.packages("RCurl")
library(ssh)
# Input #

protocol <- "sftp"

dw <- config::get("conn")
ssh_sesh <- ssh::ssh_connect(host = paste0(dw$login,'@192.168.130.8'),
                             passwd=dw$pwd)

ssh_exec_wait(ssh_sesh, command = "ls", std_out = stdout(),
              std_err = stderr())

### Cleanup after a watch
ssh_exec_wait(ssh_sesh, command = "cd remote_responses && ls", std_out = stdout(),
              std_err = stderr())

ssh_exec_wait(ssh_sesh, command = "rm -r remote_responses", std_out = stdout(),
              std_err = stderr())

ssh_exec_wait(ssh_sesh, command = "mkdir remote_responses", std_out = stdout(),
              std_err = stderr())

scp_upload(ssh_sesh, c("remote_responses/summarized_results_9_7.csv"), to = "remote_responses/")



#####
ssh_exec_wait(ssh_sesh, command = "cd responses && rm -r responses", std_out = stdout(),
              std_err = stderr())

ssh_exec_wait(ssh_sesh, command = "rm remote_responses/1610853714_7d7ecf2b3d79591965010013a37ac841.csv", std_out = stdout(),
              std_err = stderr())




scp_upload(ssh_sesh, c("local_responses/summarized_results_9_7.csv"), to = "remote_responses/")
scp_download(ssh_sesh, "~/responses", to = "./")

ssh_exec_wait(ssh_sesh, command = "rm rankorder/responses/Copy*.csv")

ssh_exec_wait(ssh_sesh, command = "rm -Rf responses")
ssh_disconnect(ssh_sesh)
