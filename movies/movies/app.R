
library(shiny)
library(shinythemes)
library(dplyr)
library(DT)
library(ssh)
library(RCurl)

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
            uiOutput("rank1"), 
            uiOutput("rank2"),
            uiOutput("rank3"),
            uiOutput("rank4"),
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
    output$rank1 <- renderUI({
      selectizeInput('rank1', 'First choice', choices = c("select" = "", movielist))
    })
    
    output$rank2 <- renderUI({
      choice_var2 <- reactive({
        movielist[movielist != input$rank1]
      })

      selectizeInput('rank2', 'Second choice', choices = c("select" = "", choice_var2()))
    })
    
    output$rank3 <- renderUI({
      choice_var3 <- reactive({
        m1 <- movielist[movielist != input$rank1]
        m1[m1 != input$rank2]
      })
      
      selectizeInput('rank3', 'Third choice', choices = c("select" = "", choice_var3()))
    })
    
    
    output$rank4 <- renderUI({
      choice_var4 <- reactive({
        m1 <- movielist[movielist != input$rank1]
        m2 <- m1[m1 != input$rank2]
        m2[m2 != input$rank3]
      })
      
      selectizeInput('rank4', 'Fourth choice', choices = c("select" = "", choice_var4()))
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
      mv = MovieSelection$new(ssh_session = ssh_sesh)
      str1 <- paste(mv$get_results(ssh_session = ssh_sesh)$Round1)
      str2 <- paste(mv$get_results(ssh_session = ssh_sesh)$Round2)
      str3 <- paste(mv$get_results(ssh_session = ssh_sesh)$Round3)
      str4 <- paste(mv$get_results(ssh_session = ssh_sesh)$Round4)
      str5 <- paste(mv$get_results(ssh_session = ssh_sesh)$Tiebreak)
      
      HTML(paste(str1, str2, str3, str4, str5, sep = '<br/>'))
      
    })
    
    output$text2 <- renderUI({
      input$submit
      mv = MovieSelection$new(ssh_session = ssh_sesh)
      str1 <- paste(mv$get_detailed_results(ssh_session = ssh_sesh)$Round1)
      str2 <- paste(mv$get_detailed_results(ssh_session = ssh_sesh)$Round2)
      str3 <- paste(mv$get_detailed_results(ssh_session = ssh_sesh)$Round3)
      str4 <- paste(mv$get_detailed_results(ssh_session = ssh_sesh)$Round4)
      str5 <- paste(mv$get_detailed_results(ssh_session = ssh_sesh)$Tiebreak)
      
      HTML(paste(str1, str2, str3, str4, str5, sep = '<br/>'))
      
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

