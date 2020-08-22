
library(shiny)
library(shinythemes)
library(tidyverse)
library(dplyr)
library(DT)
library(ssh)
library(RCurl)
library(knitr)

dw <- config::get("conn")
ssh_sesh <- ssh::ssh_connect(host = paste0(dw$login,'@dukkhalatte.ddns.net:49500'),
                             passwd=dw$pwd)

source("fns.R")
source("movie_select_class.R")

fields <- c("name", "title", "newtitle", "date")
history <- read.csv("history.csv")
colnames(history) <- c("Movie", "Date Watched")
movielist <- c("Terminator", "Clueless", "Escape from New York", "Clue", "Black Mirror", "The Social Network")

ui <- fluidPage(
    theme = shinytheme('lumen'),
    # Application title
    titlePanel("/home/common Data Science Movie Series"),
    h3("Next Movie: October 10, 2020: Clue"),
    h4("Check #movie-night to vote for the next round."),
    

    sidebarLayout(
        sidebarPanel(
            h4("Select the movies you think we should watch next, in order of your preferences."),
            textInput("name", "Your Name", ""),
            uiOutput("rank1_select"), 
            uiOutput("rank2_select"),
            uiOutput("rank3_select"),
            uiOutput("rank4_select"),
            h4("Submit your ideas for another movie not listed."),
            textInput("newtitle", "Title", ""),
            selectInput("service", "Streaming service where it is", c("", "Netflix", "Amazon Prime", "Hulu", "Other")),
            textInput("notes", "Notes if we need them to find the movie", ""),
            actionButton("submit", "Submit Responses")
        ),

        mainPanel(
          tabsetPanel(
              tabPanel("Current vote totals", htmlOutput("text")),
              tabPanel("Detailed Round Results", htmlOutput("text2")),
              tabPanel("Our watch history", dataTableOutput("history")), 
              tabPanel("New suggestions received", dataTableOutput("new_ideas"))
              #tabPanel("testing",textOutput("testtable"))
            ),
          img(src='popcorn.gif', align = "center", width='350'),
          img(src='votecat.gif', align = "center", width='350'),
        )
))

server <- function(input, output, session) {

    # Whenever a field is filled, aggregate all form data
    formData <- reactive({ 
        data.frame("name"=as.character(input$name), 
                   "rank1"=as.character(input$rank1),
                   "rank2"=as.character(input$rank2),
                   "rank3"=as.character(input$rank3),
                   "rank4"=as.character(input$rank4), 
                   "newtitle" = as.character(input$newtitle),
                   "date"=as.character(Sys.Date()), 
                   "notes" = as.character(input$notes), 
                   "service" = as.character(input$service))
        })

    ## Sorting out the ranked choices
    output$rank1_select <- renderUI({
      selectizeInput(inputId = 'rank1',
                     label = 'First choice',
                     choices = c("select" = "", movielist))
    })
    
    output$rank1_report <- renderText({
      paste(input$rank1)
    })
    
    output$rank2_select <- renderUI({
      m1 = input$rank1
      
      choice_var2 <- reactive({
        m2 = movielist[movielist != m1]
        return(m2)
      })
        
      selectizeInput(inputId = 'rank2', 
                     label = 'Second choice', 
                     choices = c("select" = "", choice_var2()))
    })
    
    output$rank3_select <- renderUI({
      m1 = input$rank1
      m2 = input$rank2
      
      choice_var3 <- reactive({
        m3 <- movielist[movielist != m1]
        m3 <- m3[m3 != m2]
        return(m3)
      })
      
      selectizeInput(inputId = 'rank3', 
                     label = 'Third choice', 
                     choices = c("select" = "", choice_var3()))
    })
    
    
    output$rank4_select <- renderUI({
      m1 = input$rank1
      m2 = input$rank2
      m3 = input$rank3
      
      choice_var4 <- reactive({
        m4 <- movielist[movielist != m1]
        m4 <- m4[m4 != m2]
        m4 <- m4[m4 != m3]
        return(m4)
      })
      
      selectizeInput(inputId = 'rank4', 
                     label = 'Fourth choice', 
                     choices = c("select" = "", choice_var4()))
    })
    
    output$history <- DT::renderDataTable({
      datatable(history, rownames=FALSE)})
    
    output$testtable <- renderText(testFilepath(ssh_sesh=ssh_sesh))
    
    # When the Submit button is clicked, save the form data
    observeEvent(input$submit, {
      saveData(formData(), ssh_sesh=ssh_sesh)
    })
    
    # Show the previous responses
    # (update with current response when Submit is clicked)
    
    output$text <- renderUI({
      input$submit
      mv = MovieSelection$new(ssh_session = ssh_sesh, path = response_filepath)
      
      str0 <- paste(mv$get_results(ssh_session = ssh_sesh)$headcount)
      str1 <- paste(mv$get_results(ssh_session = ssh_sesh)$Round1)
      str2 <- paste(mv$get_results(ssh_session = ssh_sesh)$Round2)
      str3 <- paste(mv$get_results(ssh_session = ssh_sesh)$Round3)
      str4 <- paste(mv$get_results(ssh_session = ssh_sesh)$Round4)
      str5 <- paste(mv$get_results(ssh_session = ssh_sesh)$Tiebreak)
      
      HTML(paste(str0, str1, str2, str3, str4, str5, sep = '<br/>'))
      
    })
    
    output$text2 <- renderUI({
      input$submit
      mv = MovieSelection$new(ssh_session = ssh_sesh, path = response_filepath)
      base = kable(mv$get_detailed_results(ssh_session = ssh_sesh)$baseline, "html")
      str1 <- kable(mv$get_detailed_results(ssh_session = ssh_sesh)$Round1, "html")
      str1b <- mv$get_detailed_results(ssh_session = ssh_sesh)$Round1_lose$Movie
      str2 <- kable(mv$get_detailed_results(ssh_session = ssh_sesh)$Round2, "html")
      str2b <- mv$get_detailed_results(ssh_session = ssh_sesh)$Round2_lose$Movie
      str3 <- kable(mv$get_detailed_results(ssh_session = ssh_sesh)$Round3, "html")
      str3b <- mv$get_detailed_results(ssh_session = ssh_sesh)$Round3_lose$Movie
      str4 <- kable(mv$get_detailed_results(ssh_session = ssh_sesh)$Round4, "html")
      str5 <- paste(mv$get_detailed_results(ssh_session = ssh_sesh)$Tiebreak)
      
      HTML(paste("Baseline", base,
                 paste("Dropped in R1:", str1b), 
                 "Round 1", str1,
                 paste("Dropped in R2:", str2b),
                 "Round 2", str2,
                 paste("Dropped in R3:", str3b),
                 "Round 3", str3,
                 "Round 4", str4, 
                 "Final Outcome", str5, sep = '<br/>'))
      
    })
    
    output$new_ideas <- DT::renderDataTable({
      input$submit
      datatable(
        add_suggestion(ssh_sesh=ssh_sesh)
        , rownames=FALSE)
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)

