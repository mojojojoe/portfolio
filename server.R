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
    
  
  output$textbox1 <- renderText( 
    "     The initial investment was R1 213 573
             Made up of equity: R1 196 499
                      and cash:    R17 074")

  output$textbox2 <- renderText( 
    "The investment today is worth   R1 213 573
             Made up of equity: R1 196 499
                      and cash:    R17 074")
  
  output$textbox3 <- renderText( 
    "In US dollar,
The investment today is worth   R1 213 573
             Made up of equity: R1 196 499
                      and cash:    R17 074")
  
  
  
  output$data_StockIdx <- renderTable(na.omit(KOMP))

  
  output$measure_StockReturn <- 
      renderTable(na.omit(VJPN.L))
                                                
  
  output$dashboard <- renderText("
                        Time frame dd-mmm-yyyy to dd-mm-yyyy      
                                Invested over x days

     Value in:                                                        Valuations:
       USD                                                              KOMP:US
       GBP                                                              VJPN:LN
       ZAR                                                              USD  
                                                                        GBP    

     Gain/Loss:                                                       Purchased:    at      on
       USD                                                              KOMP:US     34.0    20-10-2020
       GBP                                                              VJPN:LN     24.0    20-10-2020
       ZAR                                                              USD         14.54   20-10-2020
                                                                        GBP         16.50   20-10-2020
     Performance:                                                   
       USD                                                            Present term of investment is 0.444 years  
       GBP
       ZAR
       ")
  

  }
)