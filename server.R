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
  
  output$inv.us.zar <- renderPlot({
    plot(na.omit(investments.us$zar))  
  })

  output$inv.us.usd <- renderPlot({
    plot(na.omit(investments.us$usd))
  })

    output$inv.uk.gbp <- renderPlot({
    plot(na.omit(investments.uk$gbp))
  })
    
  output$inv.uk.zar <- renderPlot({
    plot.xts(na.omit(investments.uk$zar))
  })
  
  plot.ts
  output$vjpn <- renderPlot(plot(na.omit(vjpn$close)))
  
  output$gbp <- renderPlot(plot(na.omit(gbp$close)))
  
  output$usd <- renderPlot(plot(na.omit(usd$close)))
  
  output$dashboard <- renderText({

    paste("                                    Invested over", 
    paste(print(difftime(input$window[2],input$window[1]),
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
       USD                                                            Present term of investment is", paste(format(round(as.double(difftime(input$window[1],input$window[2]),
                                                                                                        units = "days")/365, 3), nsmall = 3), paste("years
       GBP
       ZAR
       ")))))})


  }
)

