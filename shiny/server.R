#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
#source("get_my_tickers.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$one <- renderPlot({ggplot(priceDfList[[1]], aes(x=Index, y=close)) + geom_line() + geom_ma(color = "black")})
  output$two <- renderPlot({ggplot(priceDfList[[1]], aes(x=Index, y=close)) + geom_candlestick(aes(open=open,high=high,low=low,close=close)) + geom_ma(color = "black")})
  output$thr <- renderPlot({ggplot(priceDfList[[2]], aes(x=Index, y=close)) + geom_line() + geom_ma(color = "black")})
  output$fou <- renderPlot({ggplot(priceDfList[[2]], aes(x=Index, y=close)) + geom_candlestick(aes(open=open,high=high,low=low,close=close)) + geom_ma(color = "black")})
  
  output$dashboard <- renderText({
    
    timeWndw <- difftime(input$window[2],input$window[1],units = "days")
    
    paste("Invested over",
    paste(timeWndw,
    paste("days or",
    timeWndw/365)))
    })
})
  
