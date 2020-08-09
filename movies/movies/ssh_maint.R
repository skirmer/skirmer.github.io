#install.packages("RCurl")
library(ssh)
# Input #

protocol <- "sftp"

dw <- config::get("conn")
ssh_sesh <- ssh::ssh_connect(host = paste0(dw$login,'@192.168.130.8'),
                             passwd=dw$pwd)

ssh_exec_wait(ssh_sesh, command = "ls", std_out = stdout(),
              std_err = stderr())

#ssh_exec_wait(ssh_sesh, command = "mkdir responses", std_out = stdout(),
#              std_err = stderr())

ssh_exec_wait(ssh_sesh, command = "cd responses && ls", std_out = stdout(),
              std_err = stderr())


ssh_exec_wait(ssh_sesh, command = "cd responses && rm 1596133575_7d7ecf2b3d79591965010013a37ac841.csv", std_out = stdout(),
              std_err = stderr())

ssh_exec_wait(ssh_sesh, command = "cd responses && mkdir sept12 && ls", std_out = stdout(),
               std_err = stderr())

ssh_exec_wait(ssh_sesh, command = "cd responses && mv *.csv sept12", std_out = stdout(),
              std_err = stderr())

ssh_exec_wait(ssh_sesh, command = "cd responses && mv aug1 ../", std_out = stdout(),
              std_err = stderr())

scp_upload(ssh_sesh, c("./responses"), to = "responses/")
scp_download(ssh_sesh, "~/responses", to = "./")
ssh_exec_wait(ssh_sesh, command = "rm -Rf responses")
ssh_disconnect(ssh_sesh)
