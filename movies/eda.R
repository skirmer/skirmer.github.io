movielist <- data.frame("name"="person", "title"="Knives Out", "newtitle" = "Terminator")
write.csv(movielist, "./movies/responses/data.csv", row.names = FALSE)
