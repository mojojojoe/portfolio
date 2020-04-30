#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$textbox1 <- renderText( 
    "     The initial investment was R1 213 573")
  
  output$textbox2 <- renderText( 
    "  The investment today is worth R1 213 573")
  
  output$textbox3 <- renderText({ 
    paste("                  In US dollar,\nThe investment today is worth", 
    paste("umm"))})
    
  
  
  output$komp <- renderPlot(plot(na.omit(KOMP$KOMP.Close)))

  output$vjpn <- renderPlot(plot(na.omit(VJPN.L$VJPN.L.Close)))
  
  output$gbp <- renderPlot(plot(na.omit(`GBPZAR=X`$`GBPZAR=X.Close`)))
  
  output$usd <- renderPlot(plot(na.omit(`ZAR=X`$`ZAR=X.Close`)))
  
  output$startdt <- renderText({input$TimeWindow[1]})

  output$dashboard <- renderText({

    paste("                                    Invested over", 
    paste(print(difftime(input$TimeWindow[2],input$TimeWindow[1]),
                       units = "days"),
    paste("days

     Value in:                                                        Valuations:
       USD                                                              KOMP:US
       GBP                                                              VJPN:LN
       ZAR                                                              USD
                                                                        GBP

     Gains/Losses:                                                    Purchased:    at      on
       USD                                                              KOMP:US     34.0    20-10-2020
       ZAR                                                              VJPN:LN     24.0    20-10-2020
       GBP                                                              USD         14.54   20-10-2020
     Total Gain/(Loss) in USD                                           GBP         16.50   20-10-2020

     Performance:
       USD                                                            Present term of investment is", paste(format(round(as.double(difftime(input$TimeWindow[2],input$TimeWindow[1]),
                                                                                                        units = "days")/365, 3), nsmall = 3), paste("years
       GBP
       ZAR
       ")))))})


  }
)

