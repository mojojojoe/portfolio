#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyquant)

# Define UI for application
shinyUI(
    fluidPage(

        # Application title
        titlePanel("Portfolio synopsis"),
    
        # Sidebar with a slider input for number of bins
        verticalLayout(
            tabsetPanel(
                    tabPanel("Synopsis",
                             dateRangeInput("window","Investment Time Frame", start = "2018-10-20", end = TODAY()),
                             verbatimTextOutput("dashboard")),
                    tabPanel("Charts - USD",
                             plotOutput("one"),
                             plotOutput("two"),
                             plotOutput("thr"),
                             plotOutput("fou"))
                    )
            )
        )
    )
    