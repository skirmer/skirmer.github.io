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
                    tabulate_nround = function(col, cstr, losers){
                      
                      if(cstr == 'rank1'){
                        vround <- self$cleandf %>%
                          select(c("name",cstr, "date")) %>%
                          unique() %>%
                          filter(!!col != "") %>%
                          group_by("Movie" = !!col) %>%
                          summarize(Votes = n(), .groups = "drop") 
                        
                      } else if(cstr %in% c("rank2", "rank3", "rank4")){
                        vround <- self$cleandf %>%
                          select(c("name",cstr, "date")) %>%
                          unique() %>%
                          filter(!!col != "") %>%
                          group_by("Movie" = !!col) %>%
                          summarize(Votes = n(), .groups = "drop") 
                        
                        if(!is.na(losers)){
                          vround <- vround %>%
                            filter(!("Movie" %in% losers$Movie))
                        }
                      }
                      
                      losers = vround[vround$Votes == min(vround$Votes, na.rm=T),]
                      return(list("votes" = vround, 'losers' = losers))
                    },
                    calculate_rounds=function(){
                      
                      firstrd = self$tabulate_nround(
                        col=quo(rank1), 
                        cstr="rank1", 
                        losers=NA
                      )
                      
                      secondrd = self$tabulate_nround(
                        col=quo(rank2), 
                        cstr="rank2", 
                        losers=firstrd$losers
                      )
                      
                      thirdrd = self$tabulate_nround(
                        col=quo(rank3), 
                        cstr="rank3",
                        losers=rbind(firstrd$losers, secondrd$losers)
                      )
                      
                      fourthrd = self$tabulate_nround(
                        col=quo(rank4), 
                        cstr="rank4",
                        losers=rbind(firstrd$losers, secondrd$losers, thirdrd$losers)
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
                    }
                  )
)