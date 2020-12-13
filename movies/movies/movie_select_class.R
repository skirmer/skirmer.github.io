library(R6)
library(dplyr)

MovieSelection <- R6Class("MovieSelection",
                  public = list(
                    ssh_session = NULL,
                    path = NULL,
                    df = NULL,
                    cleandf = NULL,
                    denominator = NULL,
                    initialize = function(ssh_session, path) {
                      self$path = path
                      self$ssh_session = ssh_session
                      
                      startdata = self$pull_responses()
                      self$df = startdata
                      self$cleandf = self$get_original_data()$data
                      self$denominator = self$get_original_data()$total_firsts
                      
                    },
                    pull_responses = function(){
                      scp_download(self$ssh_session, remote_responsepath, to = local_savepath)
                      
                      files <- list.files(self$path, pattern="*.csv", full.names = TRUE, recursive = FALSE)
                      
                      df = list()
                      for(i in 1:length(files)){
                        df[[i]] = read.csv(files[[i]], stringsAsFactors = F)
                      }
                      return(df)
                    },
                    get_original_data = function(){
                      data <- data.table::rbindlist(self$df) %>%
                        as.data.frame() %>%
                        mutate(rank1 = stringr::str_trim(rank1),
                               rank2 = stringr::str_trim(rank2),
                               rank3 = stringr::str_trim(rank3),
                               rank4 = stringr::str_trim(rank4)) %>%
                        unique()
                      
                      total_firsts = nrow(data)
                      
                      return(list('data'=data, 'total_firsts'=total_firsts))
                    },
                    tabulate_nround = function(data=NA, col, cstr, losers){
                      
                      if(cstr == 'rank1'){
                        vround <- self$cleandf %>%
                          select(c("name",cstr, "date")) %>%
                          unique() %>%
                          filter(!!col != "") %>%
                          group_by("Movie" = !!col) %>%
                          summarize(Votes = n(), .groups = "drop") 
                        
                      } else if(cstr %in% c("rank2", "rank3", "rank4")){
                        vround <- data %>%
                          unique() %>%
                          group_by(Movie) %>%
                          summarize(Votes = n(), .groups = "drop") 
                        
                        # if(nrow(losers)>0){
                        #   vround <- vround %>%
                        #     filter(!(Movie %in% losers$Movie))
                        # }
                      }
                      
                      losers = vround[vround$Votes == min(vround$Votes, na.rm=T),]
                      colnames(losers) = c("Movie", "Votes")
                      return(list("votes" = vround, 'losers' = losers))
                    },
                    calculate_rounds=function(){
                      
                      ### Run calculations for first round
                      firstrd = self$tabulate_nround(
                        col=quo(rank1), 
                        cstr="rank1", 
                        losers=NA
                      )
                      
                      winners1 = self$cleandf[!(self$cleandf$rank1 %in% firstrd$losers$Movie), c('name', 'rank1')]
                      losers1 = self$cleandf[self$cleandf$rank1 %in% firstrd$losers$Movie, c('name', 'rank2')]

                      colnames(winners1) = c("name", "Movie")
                      colnames(losers1) = c("name", "Movie")
                      round2_votes = rbind(winners1, losers1)
                      
                      ### Run calculations for second round
                      secondrd = self$tabulate_nround(
                        data = round2_votes,
                        col=quo(rank2), 
                        cstr="rank2", 
                        losers=firstrd$losers
                      )
                      
                      losers_r2 = rbind(firstrd$losers, secondrd$losers)
                      winners2 = round2_votes[!(round2_votes$Movie %in% losers_r2$Movie), ]
                      losers2 = self$cleandf[self$cleandf$rank1 %in% losers_r2$Movie &
                                               self$cleandf$rank2 %in% losers_r2$Movie, c('name', 'rank3')]
                      colnames(losers2) = c("name", "Movie")

                      round3_votes = rbind(winners2, losers2)
                      
                      ### Run calculations for third round
                      thirdrd = self$tabulate_nround(
                        data = round3_votes,
                        col = quo(rank3),
                        cstr = "rank3",
                        losers = losers_r2
                      )
                      
                      losers_r3 = rbind(losers_r2, thirdrd$losers)
                      winners3 = round3_votes[!(round3_votes$Movie %in% losers_r3$Movie), ]
                      
                      losers3 = self$cleandf[self$cleandf$rank1 %in% losers_r3$Movie &
                                               self$cleandf$rank2 %in% losers_r3$Movie &
                                               self$cleandf$rank3 %in% losers_r3$Movie, c('name', 'rank4')]
                      
                      colnames(losers3) = c("name", "Movie")
                      round4_votes = rbind(winners3, losers3)
                      
                      ### Run calculations for fourth round
                      fourthrd = self$tabulate_nround(
                        data = round4_votes,
                        col=quo(rank4),
                        cstr="rank4",
                        losers=losers_r3
                      )
                      
                      return(list("firstrd"=firstrd, "secondrd"=secondrd,
                                  "thirdrd"=thirdrd, "fourthrd"=fourthrd))
                    },
                    tie_catcher = function(){
                      allresults= self$calculate_rounds()
                      tieresults = list()
                      
                      for(i in allresults){
                        
                        if((nrow(i$votes) - nrow(i$losers)) == 0){
                          result = "Total Tie"
                        }
                        
                        else if((nrow(i$votes) - nrow(i$losers)) == 1){
                          result = "Winner"
                        }
                        
                        else if((nrow(i$votes) - nrow(i$losers)) == 2){
                          result = "Two Way Tie"
                        }
                        
                        else {result = "Multi Way Tie"}
                        
                        tieresults = append(tieresults, result)
                      }
                      return(tieresults)
                    },
                    result_completion = function(){
                      allrounds = self$calculate_rounds()
                      ties = self$tie_catcher()
                      
                      for(i in 1:length(allrounds)){
                        if(ties[i] == 'Winner'){
                          votes = allrounds[[i]][1]
                          winner = votes$votes[votes$votes$Votes == max(votes$votes$Votes, na.rm=T),]
                          output = paste("Winner in Round", i, "is", winner$Movie)
                        }
                      }
                      
                      if(!exists('output')){
                        for(i in 1:length(allrounds)){
                          if(ties[i] == "Two Way Tie"){
                            votes = allrounds[[i]][1]
                            status = votes$votes[votes$votes$Votes == max(votes$votes$Votes, na.rm=T),]
                            output = paste("Tie in Round", i, "between", c(status$Movie), sep = " and ", collapse = " and ")
                            
                          }
                        }
                      }
                      
                      if(!exists('output')){
                        output = "No conclusive solution yet."
                      }
                      
                      return(output)
                      
                    }
                    
                  )
)