#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(dplyr)
library(DT)

source("fns.R")
fields <- c("name", "title", "newtitle", "date")
starting_data = loadData()
history <- read.csv("history.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
    theme = shinytheme('lumen'),
    # Application title
    titlePanel("/home/common Data Science Movie Series"),
               h3("Next Movie: August 1, 2020"),
    
    sidebarLayout(
        sidebarPanel(
            h4("Vote for the movie you think we should watch next!"),
            textInput("name", "Your Name", ""),
            selectInput("title", "The Movie", c("", "Terminator", "Knives Out", "Clue", "Black Mirror")),
            selectInput("service", "Streaming service where it is", c("", "Netflix", "Amazon Prime", "Hulu", "Other")),
            textInput("notes", "Notes if we need them to find the movie", ""),
            h5("Optional: Submit your ideas for another movie not listed."),
            textInput("newtitle", "Title", ""),
            actionButton("submit", "Submit")
        ),

        mainPanel(
          tabsetPanel(
              tabPanel("Current vote totals", dataTableOutput("responses")), 
              tabPanel("Our watch history", dataTableOutput("history")), 
              tabPanel("New suggestions received", dataTableOutput("new_ideas"))
            )
        )
))

server <- function(input, output) {

    # Whenever a field is filled, aggregate all form data
    formData <- reactive({ 
        data.frame("name"=as.character(input$name), 
                   "title"=as.character(input$title), 
                   "newtitle" = as.character(input$newtitle),
                   "date"=as.character(Sys.Date()), 
                   "notes" = as.character(input$notes), 
                   "service" = as.character(input$service))
        })
    
    # When the Submit button is clicked, save the form data
    observeEvent(input$submit, {
        saveData(formData())
    })

    output$history <- DT::renderDataTable({
      datatable(
        history
        , rownames=FALSE)})
    
    # Show the previous responses
    # (update with current response when Submit is clicked)
    output$responses <- DT::renderDataTable({
        input$submit
      datatable(
        loadData()
        , rownames=FALSE)
    })
    
    output$new_ideas <- DT::renderDataTable({
      input$submit
      datatable(
        loadData(votes = FALSE)
        , rownames=FALSE)
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)

