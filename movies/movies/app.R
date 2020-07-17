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
basic_data = read.csv("./responses/data.csv", stringsAsFactors = F)
fields <- c("name", "title", "newtitle", "date")

# Define UI for application that draws a histogram
ui <- fluidPage(
    theme = shinytheme('lumen'),
    # Application title
    titlePanel("/home/common Data Science Movie Series"),
    
    sidebarLayout(
        sidebarPanel(
            "Vote for the movie you think we should watch next!",
            textInput("name", "Name", ""),
            selectInput("title", "Movie", c("",  "Terminator", "Knives Out")),
            "Optional: Submit your ideas for another movie not listed.",
            textInput("newtitle", "Title", ""),
            actionButton("submit", "Submit")
        ),
        mainPanel(
            dataTableOutput("responses")
        ))
)

server <- function(input, output) {

    # Whenever a field is filled, aggregate all form data
    formData <- reactive({ 
        data.frame("name"=as.character(input$name), 
                   "title"=as.character(input$title), 
                   "newtitle" = as.character(input$newtitle),
                   "date"=as.character(date()))
        })
    
    # When the Submit button is clicked, save the form data
    observeEvent(input$submit, {
        saveData(formData())
    })
    
    # Show the previous responses
    # (update with current response when Submit is clicked)
    output$responses <- DT::renderDataTable({
        input$submit
        loadData()
    })   
}

# Run the application 
shinyApp(ui = ui, server = server)

