#########  UTILITY FILE ############################
# returns a list of xts objects based on a list of #
# Ticker strings, and between startDt and Today()  #
####################################################
library(tidyquant)

tickers<-readxl::read_xls("/home/rstudio/portfolio/resources/KOMP_All_Holdings.xls",sheet='KOMP_All_Holdings',range = "B4:B55")
tickers<-as.list(tickers)
# for the moment just assume that it is all in USD...

# ticker.symbols<-lapply(tickers,as.symbol)

startDt <- '2018-10-01'

get.price.list <- function(x){
  getSymbols(x,auto.assign=FALSE,from=startDt,to=TODAY())
}

price.lists <- lapply(tickers[[1]],get.price.list)
