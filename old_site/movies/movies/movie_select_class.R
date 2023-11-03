library(R6)
library(dplyr)

MovieSelection <- R6Class("MovieSelection",
                  public = list(
                    ssh_session = NULL,
                    path = NULL,
                    df = NULL,
                    cleandf = NULL,
                    denominator = NULL,
                    last_round = NULL,
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
                          filter(Movie != "NA") %>%
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
                      
                      for(i in 1:length(allresults)){
                        
                        item = allresults[[i]]
                        if((nrow(item$votes) - nrow(item$losers)) == 0){
                          result = "Total Tie"
                        }
                        
                        else if((nrow(item$votes) - nrow(item$losers)) == 1){
                          result = "Winner"
                        }
                        
                        else if((nrow(item$votes) - nrow(item$losers)) == 2){
                          result = "Two Way Tie"
                          
                          max_hit = item$votes[item$votes$Votes == max(item$votes$Votes, na.rm=T),]
                          
                          if(i == 4 & nrow(max_hit == 1)){
                            result = "Win by Majority in Fourth Round"
                          }
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
                          if(ties[i] %in% c('Winner', "Win by Majority in Fourth Round")){
                              votes = allrounds[[i]][1]
                              winner = votes$votes[votes$votes$Votes == max(votes$votes$Votes, na.rm=T),]
                              winner = winner[winner$Votes >= floor((self$denominator)/2),]
                              
                              if(!exists('output')){
                                output = paste("Winner in Round", i, "is", winner$Movie)
                                self$last_round = i
                              }
                          }
                      }
                      
                      if(!exists('output')){
                          if(ties[4] %in% c("Two Way Tie", "Multi Way Tie")){
                            votes = allrounds[[4]][1]
                            status = votes$votes[votes$votes$Votes == max(votes$votes$Votes, na.rm=T),]
                            
                            options = status$Movie
                            tallies = list()
                            for(i in options){
                              t1 = sum(nrow(self$cleandf[self$cleandf$rank1 == i,]),
                                  nrow(self$cleandf[self$cleandf$rank2 == i,]),
                                  nrow(self$cleandf[self$cleandf$rank3 == i,]),
                                  nrow(self$cleandf[self$cleandf$rank4 == i,]))
                              
                              tallies = append(tallies, t1)
                            }
                            winner = options[which.max(tallies)]
                            output = paste0("Tie in Round ", 4, " between ", 
                                           paste(options, sep=" and ", collapse=" and "),
                                           ". Tie break results in win for ", winner)
                          }
                        }
                      
                      if(!exists('output')){
                        output = "No conclusive solution yet."
                      }
                      
                      return(list(output, self$last_round))
                      
                    },
                    clean_results = function(){
                      allrounds = self$calculate_rounds()
                      conclusion = self$result_completion()
                      
                      if(conclusion[[2]] == 1){
                        allrounds$secondrd$votes = "Round 2 not required"
                        allrounds$thirdrd$votes = "Round 3 not required"
                        allrounds$fourthrd$votes = "Round 4 not required"
                        
                        allrounds$secondrd$losers$Movie = " "
                        allrounds$thirdrd$losers$Movie = " "
                        allrounds$fourthrd$losers$Movie = " "
                        
                      } else if (conclusion[[2]] == 2){
                        allrounds$thirdrd$votes = "Round 3 not required"
                        allrounds$fourthrd$votes = "Round 4 not required"
                        
                        allrounds$thirdrd$losers$Movie = " "
                        allrounds$fourthrd$losers$Movie = " "
                        
                      } else if (conclusion[[2]] == 3){
                        allrounds$fourthrd$votes = "Round 4 not required"
                        
                        allrounds$fourthrd$losers$Movie = " "
                      }
                      
                      return(allrounds)
                    }
                    
                  )
)