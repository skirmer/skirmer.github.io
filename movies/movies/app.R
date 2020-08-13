
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
fields <- c("name", "title", "newtitle", "date")
starting_data = calcRankOrder(ssh_sesh=ssh_sesh)
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
              tabPanel("Current vote totals", textOutput("responses"),
                       textOutput("rounds_run"), 
                       dataTableOutput("r1"),  
                       dataTableOutput("r2"),  
                       dataTableOutput("r3"),  
                       dataTableOutput("r4")), 
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
    output$r1 <- DT::renderDataTable({
      input$submit
      datatable(
        calcRankOrder(ssh_sesh=ssh_sesh)[[3]]
        , rownames=FALSE)
    })
    
    output$r2 <- DT::renderDataTable({
      input$submit
      datatable(
        calcRankOrder(ssh_sesh=ssh_sesh)[[4]]
        , rownames=FALSE)
    })
    
    output$r3 <- DT::renderDataTable({
      input$submit
      datatable(
        calcRankOrder(ssh_sesh=ssh_sesh)[[5]]
        , rownames=FALSE)
    })
    
    
    output$r4 <- DT::renderDataTable({
      input$submit
      datatable(
        calcRankOrder(ssh_sesh=ssh_sesh)[[6]]
        , rownames=FALSE)
    })
    
    output$responses <- renderText({
        input$submit
      paste("Winning movie currently:",
        calcRankOrder(ssh_sesh=ssh_sesh)[[1]])
    })
    
    output$rounds_run <- renderText({
      input$submit
      paste("Rounds run before result:", 
        calcRankOrder(ssh_sesh=ssh_sesh)[[2]])
    })
    
    output$new_ideas <- DT::renderDataTable({
      input$submit
      datatable(
        calcRankOrder(ssh_sesh=ssh_sesh, votes = FALSE)
        , rownames=FALSE)
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)

