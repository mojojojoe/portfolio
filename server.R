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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$j <- renderPlot({ggplot(VJPN.L, aes(x=Index, y=close)) + geom_candlestick(aes(open=open,high=high,low=low,close=close)) + geom_ma(color = "black")})
  output$k <- renderPlot({ggplot(KOMP, aes(x=Index, y=close)) + geom_candlestick(aes(open=open,high=high,low=low,close=close)) + geom_ma(color = "black")})
  output$p.usd <- renderPlot({ggplot(portfolio.usd, aes(x=Index,y=komp.close)) + geom_line()})



  # output$dashboard <- renderText({
  # 
  #   paste("Invested over", 
  #   paste(print(difftime(input$window[2],input$window[1]),units = "days"),
  #   paste("days or", 
  #   paste(print(difftime(input$window[2],input$window[1]),units = "days")/365, 
  #   paste("years
  # 
  #    Today's value:                                                       
  #      USD                                                              
  #                                                                       
  # 
  #    Gains/Losses:                                                    
  #      1d
  #      7d
  #      14d
  #      1m
  #      3m
  #      6m
  #      1y
  #      2y
  #      3y
  #      5y
  #      from DOI
  #      dince inception 
  #      YTD")))))
  }
)

