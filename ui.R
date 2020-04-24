#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
    fluidPage(

        # Application title
        titlePanel("Portfolio information"),

        # Sidebar with a slider input for number of bins
        sidebarLayout(
            sidebarPanel(
                dateRangeInput("tFrame", "Performance timeframe", format = "dd-mm-yyyy", start = "20-10-2019", startview = "year" , language = "en", separator = " to ", autoclose = TRUE),
                verbatimTextOutput("textbox1"),
                verbatimTextOutput("textbox2"),
                verbatimTextOutput("textbox3")
                ),
            mainPanel(
                tabsetPanel(
                    tabPanel("Dashboard",verbatimTextOutput("dashboard")),
                    tabPanel("Performance"),
                    tabPanel("Measures",tableOutput("measure_StockReturn")),
                    tabPanel("Dataset",tableOutput("data_StockIdx"))
                    )
                )
            )
        )
    )