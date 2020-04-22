#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(FRAPO)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$default <- renderText( 
    "The initial investment was R1 213 573
     Made up of equity:    R1 196 499
              and cash:       R17 074")

    output$data_StockIdx <- renderDataTable(StockIndex)
#    output$measure_StockReturn <-
 #       na.omit(timeSeries(returnseries(StockIndex,
  #                                      method = "discrete"),
   #                        charvec = rownames(StockIndex)))
    
    
})
