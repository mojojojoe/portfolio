#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(lubridate)

# Define UI for application that draws a histogram
shinyUI(
    fluidPage(

        # Application title
        titlePanel("Portfolio information"),

        # Sidebar with a slider input for number of bins
        sidebarLayout(
            sidebarPanel(
              br(),
                dateRangeInput("TimeWindow", h3("Synopsis"), format = "dd-mm-yyyy", start = "2019-10-20", end=lubridate::today(), startview = "year" , language = "en", separator = " to ", autoclose = TRUE),
                verbatimTextOutput("textbox1"),
                verbatimTextOutput("textbox2"),
                verbatimTextOutput("textbox3")
                ),
            mainPanel(
                tabsetPanel(
                    tabPanel("Dashboard",verbatimTextOutput("startdt"), verbatimTextOutput("dashboard")),
                    tabPanel("Kenshoo 4th IR",tableOutput("komp")),
                    tabPanel("Japan",tableOutput("vjpn"))
                    )
                )
            )
        )
    )
