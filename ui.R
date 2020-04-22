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
                dateRangeInput("tFrame", "Performance timeframe", format = "dd M yyyy", start = "20 Oct 2019", startview = "year" , language = "en", separator = " to ", autoclose = TRUE),
                verbatimTextOutput("default")
            ),
            mainPanel(
                tabsetPanel(
                    tabPanel("Dashboard"),
                    tabPanel("Performance overall"),
                    tabPanel("USD performances"),
                    tabPanel("GBP performances"),
                    tabPanel("Measures",tableOutput("measure_StockReturn")),
                    tabPanel("Dataset",tableOutput("data_StockIdx"))
                    )
                )
            )
        )
    )