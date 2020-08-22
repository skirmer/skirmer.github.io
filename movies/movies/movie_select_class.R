library(R6)

MovieSelection <- R6Class("MovieSelection",
                  public = list(
                    ssh_session = NULL,
                    df = NULL,
                    initialize = function(ssh_session) {
                      
                    },
                    get_results = function(ssh_session){
                      
                      self$df = self$pullResponses(self$ssh_session, 
                                              path = "../../movies/movies/rankchoice/responses/")#path='./responses')
                      
                      first_round_outcome = self$calculate_firstround(ssh_session)
                      message1 = (paste("Round 1:", first_round_outcome$result))
                      
                      second_round_outcome = self$calculate_secondround(ssh_session, first_round_outcome)
                      message2 = (paste("Round 2:", second_round_outcome$result))
                      
                      third_round_outcome = self$calculate_thirdround(ssh_session, first_round_outcome, second_round_outcome)
                      message3 = (paste("Round 3:", third_round_outcome$result))
                      
                      final_outcome = self$calculate_fourthround(ssh_session, first_round_outcome, second_round_outcome, third_round_outcome)
                      message4 = (paste("Round 4:", final_outcome$result))
                      
                      message5 = (self$tie_break_finale(ssh_session, final_outcome))
                      
                      return(list("Round1" = message1, 
                                  "Round2" = message2, 
                                  "Round3" = message3, 
                                  "Round4" = message4, 
                                  "Tiebreak" = message5))
                      
                    },
                    get_detailed_results = function(ssh_session){
                      
                      self$df = self$pullResponses(self$ssh_session, 
                                                   path = "../../movies/movies/rankchoice/responses/")#path='./responses')
                      
                      first_round_outcome = self$calculate_firstround(ssh_session)
                      message1 = first_round_outcome$first_round_remaining_votes
                      
                      second_round_outcome = self$calculate_secondround(ssh_session, first_round_outcome)
                      message2 = second_round_outcome$second_round_remaining_votes
                      
                      third_round_outcome = self$calculate_thirdround(ssh_session, first_round_outcome, second_round_outcome)
                      message3 = third_round_outcome$third_round_remaining_votes
                      
                      final_outcome = self$calculate_fourthround(ssh_session, first_round_outcome, second_round_outcome, third_round_outcome)
                      message4 = final_outcome$candidates
                      
                      message5 = (self$tie_break_finale(ssh_session, final_outcome))
                      
                      return(list("Round1" = message1, 
                                  "Round2" = message2, 
                                  "Round3" = message3, 
                                  "Round4" = message4, 
                                  "Tiebreak" = message5))
                      
                    },
                    pullResponses = function(ssh_session=NA, path){
                      #scp_download(ssh_session, ".", to = "./responses")
                      
                      files <- list.files(path, pattern="*.csv", full.names = TRUE, recursive = FALSE)
                      
                      df = list()
                      for(i in 1:length(files)){
                        df[[i]] = read.csv(files[[i]], stringsAsFactors = F)
                      }
                      
                      return(df)
                    },
                    get_original_data = function(ssh_session){
                      data <- data.table::rbindlist(self$df) %>%
                        as.data.frame() %>%
                        mutate(rank1 = stringr::str_trim(rank1),
                               rank2 = stringr::str_trim(rank2),
                               rank3 = stringr::str_trim(rank3),
                               rank4 = stringr::str_trim(rank4))
                      
                      return(data)
                    },
                    tabulate_firstround = function(data, col, cstr){
                      vround <- data %>%
                        select(c("name", cstr, "date")) %>%
                        unique() %>%
                        filter(!!col != "") %>%
                        group_by("Movie" = !!col) %>%
                        summarize(Votes = n(), .groups = "drop")
                      
                      total_firsts <- sum(vround$Votes)
                      immediate_win <- vround[vround$Votes >= ceiling(total_firsts/2), "Movie"]
                      return(list("denominator" = total_firsts, 
                                  "outright_winner" = immediate_win, 
                                  "vote_tally" = vround))
                    },
                    tabulate_nround = function(data, col, cstr, prevcol, total_firsts, losers){
                      vround <- data %>%
                        filter(!!prevcol %in% losers$Movie) %>%
                        select(c("name",cstr, "date")) %>%
                        unique() %>%
                        group_by("Movie" = !!col) %>%
                        summarize(Votes = n(), .groups = "drop") 
                      
                      immediate_win <- vround[vround$Votes >= ceiling(total_firsts/2), "Movie"]
                      return(list("outright_winner" = immediate_win, 
                                  "vote_tally" = vround))
                    },
                    calculate_firstround = function(ssh_session){
                      data <- self$get_original_data(ssh_session = ssh_session)
                      tabbed_firstround = self$tabulate_firstround(data, quo(rank1), "rank1")
                      
                      first_round <- tabbed_firstround$vote_tally
                      
                      if(nrow(tabbed_firstround$outright_winner) > 0){
                        result = tabbed_firstround$outright_winner
                      } else {
                        result = "No outright winner: must continue to next round."
                        first_loser <- first_round[first_round$Votes == min(first_round$Votes), "Movie"]
                        first_round <- filter(first_round, !(Movie %in% first_loser$Movie))
                        if(nrow(first_round) == 0){
                          result = "Complete first round tie, need more votes to get a result."
                        }
                      }
                      return(list("result" = result,
                                  "first_round_loser" = first_loser,
                                  "first_round_remaining_votes" = first_round, 
                                  "denominator" = tabbed_firstround$denominator, 
                                  "immediate_winner" = tabbed_firstround$outright_winner))
                    },
                    calculate_secondround = function(ssh_session, first_round_outcome){
                      
                      data = self$get_original_data(ssh_session = ssh_session)
                      tabbed_secondround <- self$tabulate_nround(data, quo(rank2), "rank2",
                                                            quo(rank1),
                                                            first_round_outcome$denominator,
                                                            first_round_outcome$first_round_loser)
                      
                      second_round <- tabbed_secondround$vote_tally %>%
                        rbind(first_round_outcome$first_round_remaining_votes) %>%
                        group_by(Movie) %>%
                        summarize(Votes = sum(Votes), .groups = "drop")
                      
                      winner <- tabbed_secondround$outright_winner
                      
                      if(nrow(first_round_outcome$immediate_winner) > 0){
                        result = first_round_outcome$immediate_winner
                      } else if(nrow(winner) == 1){
                        result = winner
                      } else {
                        result = "No outright winner"
                        second_loser <- second_round[second_round$Votes == min(second_round$Votes), "Movie"]
                        final <- filter(second_round, !(Movie %in% second_loser$Movie))
                        if(nrow(final) == 0){
                          final <- second_round
                          result = c(paste("Tie:", paste(final$Movie, sep = " and ", collapse = " and ")))
                        } 
                      }
                      return(list("result" = result,
                                  "outright_winner" = tabbed_secondround$outright_winner,
                                  "second_round_loser" = second_loser,
                                  "second_round_remaining_votes" = final))
                    },
                    calculate_thirdround = function(ssh_session, first_round_outcome, second_round_outcome){
                      data = self$get_original_data(ssh_session = ssh_session)
                      tabbed_thirdround <- self$tabulate_nround(data, quo(rank3), "rank3",
                                                           quo(rank2),
                                                           first_round_outcome$denominator,
                                                           second_round_outcome$second_round_loser)
                      
                      third_round <- tabbed_thirdround$vote_tally %>%
                        rbind(second_round_outcome$second_round_remaining_votes) %>%
                        group_by(Movie) %>%
                        summarize(Votes = sum(Votes), .groups = "drop")
                      
                      winner <- tabbed_thirdround$outright_winner
                      
                      if(nrow(first_round_outcome$immediate_winner) > 0){
                        result = first_round_outcome$immediate_winner
                      } else if(nrow(second_round_outcome$outright_winner)  > 0){
                        result = second_round_outcome$outright_winner
                      } else if(nrow(winner) == 1){
                        result = winner
                      } else {
                        result = "No outright winner: must continue to next round."
                        third_loser <- third_round[third_round$Votes == min(third_round$Votes), "Movie"]
                        final <- filter(third_round, !(Movie %in% third_loser$Movie))
                        if(nrow(final) == 0){
                          final <- third_round
                          result = c(paste("Tie:", paste(final$Movie, sep = " and ", collapse = " and ")))                        }
                      }
                      return(list("result" = result,
                                  "outright_winner" = tabbed_thirdround$outright_winner,
                                  "third_round_loser" = third_loser,
                                  "third_round_remaining_votes" = final))
                    },
                    calculate_fourthround = function(ssh_session, first_round_outcome,
                                                      second_round_outcome, third_round_outcome){
                      data = self$get_original_data(ssh_session = ssh_session)
                      tabbed_fourthround <- self$tabulate_nround(data, quo(rank4), "rank4", quo(rank3),
                                                            first_round_outcome$denominator, 
                                                            third_round_outcome$third_round_loser)
                      
                      
                      fourth_round <- tabbed_fourthround$vote_tally %>%
                        rbind(third_round_outcome$third_round_remaining_votes) %>%
                        group_by(Movie) %>%
                        summarize(Votes = sum(Votes), .groups = "drop")
                      
                      fourth_loser <- fourth_round[fourth_round$Votes == min(fourth_round$Votes), "Movie"]
                      final_candidates <- filter(fourth_round, !(Movie %in% fourth_loser$Movie))
                      
                      winner <- tabbed_fourthround$outright_winner
                      
                      if(nrow(first_round_outcome$immediate_winner) > 0){
                        result = first_round_outcome$immediate_winner
                      } else if(nrow(second_round_outcome$outright_winner)  > 0){
                        result = second_round_outcome$outright_winner
                      } else if(nrow(third_round_outcome$outright_winner)  > 0){
                        result = third_round_outcome$outright_winner
                      } else if(nrow(winner) == 1){
                        result = winner
                      } else {
                        result = "No outright winner - tie break required."
                      }
                      
                      return(list("result" = result,
                                  "candidates" = final_candidates))
                    },
                    tie_break_finale = function(ssh_session, final_outcome){
                      data = self$get_original_data(ssh_session = ssh_session)
                      
                      if(final_outcome$result == "No outright winner - tie break required."){
                        vround <- data %>%
                          tidyr::pivot_longer(cols = c(rank1, rank2, rank3, rank4), names_to = c("ranking")) %>%
                          filter(value %in% final_outcome$candidates$Movie) %>%
                          select(c("name","value", "ranking", "date")) %>%
                          unique() %>%
                          group_by("Movie" = value) %>%
                          summarize(Votes = n(), .groups = "drop")
                        
                        last_loser <- vround[vround$Votes == min(vround$Votes), "Movie"]
                        tiebreak_round <- filter(vround, !(Movie %in% last_loser$Movie))
                        return(paste("Tie Break Winner:", tiebreak_round$Movie))
                      }
                    }
                  )
)