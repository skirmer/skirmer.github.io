
library(shiny)
library(shinythemes)
library(tidyverse)
library(dplyr)
library(DT)
library(ssh)
library(RCurl)
library(knitr)

library(shinyjs)


dw <- config::get("conn")
ssh_sesh <- ssh::ssh_connect(host = paste0(dw$login,'@dukkhalatte.ddns.net:49500'),
                             passwd=dw$pwd)

source("fns.R")
source("movie_select_class.R")

fields <- c("name", "title", "newtitle", "date")
history <- read.csv("history.csv")
colnames(history) <- c("Movie", "Date Watched")
movielist <- c("Airplane!", "Back to the Future", "Close Encounters of the Third Kind",
               "Clueless", "Escape from New York", "Fargo", "My Cousin Vinny", 
               "Pineapple Express", "The Social Network", "The Royal Tenenbaums",
               "Total Recall", "The DaVinci Code")
df = pullResponses(ssh_sesh)

ui <- fluidPage(
    theme = shinytheme('lumen'),
    shinyjs::useShinyjs(),
    # Application title
    titlePanel("/home/common Data Science Movie Series"),
    h3("Next Movie: February 2021, date TBD - 7 pm Central Time"),
    h4("Check #movie-night to get more info."),
    

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
              tabPanel("Detailed Round Results", htmlOutput("text2")),
              tabPanel("Our watch history", dataTableOutput("history")), 
              tabPanel("New suggestions received", dataTableOutput("new_ideas"))
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
    
    observeEvent(input$submit, {
      shinyjs::reset("name")
      shinyjs::reset("rank1_select")
      shinyjs::reset("rank2_select")
      shinyjs::reset("rank3_select")
      shinyjs::reset("rank4_select")
      shinyjs::reset("newtitle")
      shinyjs::reset("service")
      shinyjs::reset("notes")

    })
    
    # Show the previous responses
    # (update with current response when Submit is clicked)
   
    output$text2 <- renderUI({
      input$submit
      mv = MovieSelection$new(ssh_session = ssh_sesh, path = local_responsepath)
      str1 <- kable(mv$clean_results()$firstrd$votes, "html")
      str1b <- paste(unique(mv$clean_results()$firstrd$losers$Movie), sep = " and ", collapse = " and ")
      str2 <- kable(mv$clean_results()$secondrd$votes, "html")
      str2b <- paste(unique(mv$clean_results()$secondrd$losers$Movie), sep = " and ", collapse = " and ")
      str3 <- kable(mv$clean_results()$thirdrd$votes, "html")
      str3b <- paste(unique(mv$clean_results()$thirdrd$losers$Movie), sep = " and ", collapse = " and ")
      str4 <- kable(mv$clean_results()$fourthrd$votes, "html")
      str4b <- paste(unique(mv$clean_results()$fourthrd$losers$Movie), sep = " and ", collapse = " and ")
      str5 <- kable(mv$result_completion()[1], "html")
      
      HTML(paste("<h2>Tutorial</h2>",
                "Each round, the least popular movie is dropped. 
                The following round, the ballots whose votes were dropped will contribute their next-highest choice." ,
                "To win outright, a movie must accumulate at least 50% of the total votes.",
                "If there is an equal tie in Round 4 between 2 or more films, the entire pool of votes for the ones tied is the tie-breaker.",
                "<h2>Round 1</h2>", str1,
                 paste("Dropped in R1:", str1b),
                 "<h2>Round 2</h2>", str2,
                 paste("Dropped in R2:", str2b),
                 "<h2>Round 3</h2>", str3,
                 paste("Dropped in R3:", str3b),
                 "<h2>Round 4</h2>", str4, 
                 paste("Dropped in R4:", str4b),
                 str5, sep = '<br/>'))
      
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

