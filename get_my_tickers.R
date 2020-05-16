#########  UTILITY FILE ############################
# returns a list of xts objects based on a list of #
# Ticker strings, and between startDt and Today()  #
####################################################
library(tidyquant)

# for the moment just assume that it is all in USD...
tickers<-c("KOMP","VJPN.L","TSLA","AAPL")
# ticker.symbols<-lapply(tickers,as.symbol)

startDt <- '2018-10-01'

# GBPxUSD <- getSymbols("GBPUSD=X",auto.assign=FALSE,from=startDt,to=TODAY())

get.price.list <- function(x){
  getSymbols(x,auto.assign=FALSE,from=startDt,to=TODAY())
}

price.lists <- lapply(tickers,get.price.list)