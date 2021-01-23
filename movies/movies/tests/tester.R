library(testthat)

## Tests for the MovieSelection class

dw <- config::get("conn")
ssh_sesh <- ssh::ssh_connect(host = paste0(dw$login,'@dukkhalatte.ddns.net:49500'),
                             passwd=dw$pwd)

local_savepath = './tests'
remote_responsepath = './remote_responses/'
source("movie_select_class.R")

test_that("Returned objects sized correctly",
          {
            local_responsepath = './tests/remote_responses_t1/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$clean_results()
            complete=mv$result_completion()
            tie = mv$tie_catcher()
            
            expect_equal(length(cleandf), 2)
            expect_equal(length(allresults), 4)
            expect_equal(length(allresults$firstrd), 2)
            expect_equal(length(allresults$secondrd), 2)
            expect_equal(length(allresults$thirdrd), 2)
            expect_equal(length(allresults$fourthrd), 2)
            expect_equal(length(tie), 4)
            
          })

test_that("Returned objects sized correctly V2",
          {
            local_responsepath = './tests/remote_responses_t1/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$clean_results()
            complete=mv$result_completion()
            tie = mv$tie_catcher()
            
            expect_equal(length(cleandf), 2)
            expect_equal(length(allresults), 4)
            expect_equal(length(allresults$firstrd), 2)
            expect_equal(length(allresults$secondrd), 2)
            expect_equal(length(allresults$thirdrd), 2)
            expect_equal(length(allresults$fourthrd), 2)
            expect_equal(length(tie), 4)
            
          })


test_that("T1: Outright winner correctly found",
          {
            local_responsepath = './tests/remote_responses_t1/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$clean_results()
            complete=mv$result_completion()
            tie = mv$tie_catcher()
            
            expect_equal(length(orig), 13, label = "Raw Length")            
            expect_equal(length(tie), 4)
            expect_equal(nrow(cleandf$data), 8)
            
            expect_equal(complete[[1]], "Winner in Round 4 is War Games")
            expect_equal(tie[[4]], "Winner")
          })


test_that("T1b: Outright winner in R2 correctly found, extra rounds cleared",
          {
            local_responsepath = './tests/remote_responses_t1b/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$clean_results()
            complete=mv$result_completion()
            tie = mv$tie_catcher()
            
            expect_equal(length(orig), 5, label = "Raw Length")            
            expect_equal(length(tie), 4)
            expect_equal(nrow(cleandf$data), 4)
            
            expect_equal(complete[[1]], "Winner in Round 2 is Total Recall")
            expect_equal(complete[[2]], 2)
            
            expect_equal(tie[[2]], "Winner")
            
            expect_equal(nrow(allresults[[2]]$losers), 2)
            expect_equal(allresults[[3]]$votes, "Round 3 not required")
            expect_equal(allresults[[4]]$votes, "Round 4 not required")
            expect_equal(unique(allresults[[3]]$losers$Movie), " ")
            expect_equal(unique(allresults[[3]]$losers$Movie), " ")
          })

test_that("T2: Two Way Tie correctly broken",
          {
            local_responsepath = './tests/remote_responses_t2/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$calculate_rounds()
            complete=mv$result_completion()
            tie = mv$tie_catcher()
            
            expect_equal(length(orig), 11)            
            expect_equal(length(tie), 4)
            expect_equal(nrow(cleandf$data), 6)
            
            expect_equal(complete[[1]], "Winner in Round 4 is My Cousin Vinny")
            expect_equal(tie[[4]], "Win by Majority in Fourth Round")
          })

test_that("T3: Single vote correctly handled",
          {
            local_responsepath = './tests/remote_responses_t3/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$calculate_rounds()
            complete=mv$result_completion()
            tie = mv$tie_catcher()
            
            expect_equal(length(orig), 2)            
            expect_equal(nrow(cleandf$data), 1)
            
            expect_equal(complete[[1]], "No conclusive solution yet.")
            expect_equal(tie[[4]], "Total Tie")
          })

test_that("T4: Two votes correctly handled",
          {
            local_responsepath = './tests/remote_responses_t4/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$calculate_rounds()
            complete=mv$result_completion()
            tie = mv$tie_catcher()
            
            expect_equal(length(orig), 3)            
            expect_equal(nrow(cleandf$data), 2)
            
            expect_equal(complete[[1]], "No conclusive solution yet.")
            expect_equal(tie[[4]], "Total Tie")
          })

test_that("T5: Four votes, one dupe, correctly handled",
          {
            local_responsepath = './tests/remote_responses_t5/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$calculate_rounds()
            complete=mv$result_completion()[[1]]
            tie = mv$tie_catcher()
            
            expect_equal(length(orig), 5)            
            expect_equal(nrow(cleandf$data),3) #Dupe removed
            
            expect_equal(complete[[1]], "Winner in Round 1 is Escape from New York")
            expect_equal(tie[[4]], "Winner")
          })

test_that("T6: Zero votes correctly handled",
          {
            local_responsepath = './tests/remote_responses_t6/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$calculate_rounds()
            complete=mv$result_completion()[[1]]
            tie = mv$tie_catcher()
            
            expect_equal(length(orig), 1)            
            expect_equal(nrow(cleandf$data),0)
            
            expect_equal(complete[[1]], "No conclusive solution yet.")
            expect_equal(tie[[4]], "Total Tie")
          })

test_that("T7: Four votes, zero dupes, correctly handled",
          {
            local_responsepath = './tests/remote_responses_t7/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$calculate_rounds()
            complete=mv$result_completion()
            tie = mv$tie_catcher()
            
            expect_equal(length(orig), 5)            
            expect_equal(nrow(cleandf$data),4)
            
            expect_equal(complete[[1]], "Winner in Round 1 is Escape from New York")
            expect_equal(tie[[4]], "Winner")
          })

test_that("T8: Five votes, zero dupes, unsolvable: correctly handled",
          {
            local_responsepath = './tests/remote_responses_t8/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$calculate_rounds()
            complete=mv$result_completion()
            tie = mv$tie_catcher()
            
            expect_equal(length(orig), 6)            
            expect_equal(nrow(cleandf$data),5)
            
            expect_equal(complete[[1]], "No conclusive solution yet.")
            expect_equal(tie[[4]], "Total Tie")
          })


test_that("T9: NA values omitted",
          {
            local_responsepath = './tests/remote_responses_t9/'
            mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
            orig = mv$pull_responses()
            cleandf = mv$get_original_data()
            allresults= mv$calculate_rounds()
            complete=mv$result_completion()
            tie = mv$tie_catcher()
            
            expect_equal(length(orig), 6)
            expect_equal(nrow(allresults$firstrd$votes), 5)
            expect_equal(nrow(allresults$secondrd$votes), 5)
            expect_equal(nrow(allresults$thirdrd$votes), 4)
            expect_equal(nrow(allresults$fourthrd$votes), 4)
            
            expect_equal(nrow(cleandf$data),5)
            
            expect_equal(complete[[1]], "No conclusive solution yet.")
            expect_equal(tie[[4]], "Total Tie")
          })
