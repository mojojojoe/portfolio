
library(tidyquant)

# for the moment just assume that it is all in USD...
tickers<-c("KOMP","VJPN.L")
startDt <- '2016-01-01'

# GBPxUSD <- getSymbols("GBPUSD=X",auto.assign=FALSE,from=startDt,to=TODAY())

get.priceDf <- function(x){
  getSymbols(x,auto.assign=FALSE,from=startDt,to=TODAY())
}
# todo...
chgColNames <- function(x){
  colnames()
}
 
priceDfList <- lapply(tickers,get.priceDf)  
# broken...
priceDfList

# function to make the column names on stockPriceDfs more consistent across stocks
chgColNames <- function(pricedflist) {
  for(i in 1:length(pricedflist)){
    colnames(pricedflist[[i]]) <- c("open","high","low","close","volume","adjusted")
  }
  return(pricedflist)
}
 # apply that function
priceDfList<-chgColNames(priceDfList)
# inspect to be sure
# priceDfList[[2]]

# Conversion of GBP funds to USD (todo for later)
# vjpn.merge <- merge(quoteDfList[[2]],quoteDfList[[3]],join = "inner")
# vjpn.usd <- cbind(vjpn.merge$close * vjpn.merge$close.1)



# broken, must fix...
# # function to merge a list of priceDfs together
# mergePriceTablesInList <- function(priceDfs) {
#   for(i in 1:length(priceDfs)) {
#     # make sure i never reaches above the length of the list
#     if(i < length(priceDfs)){
#       merge(priceDfs[[i]],priceDfs[[i+1]], join = "outer")
#     }
#   }
#   priceDfs
# }
# i <-1
# while(...) {
#   l[[i]] <- new_element
#   i <- i + 1
# }
# 

# mergePriceTablesInList(priceDfList)

# portfolio.usd <- cbind(na.omit(all$komp.close)*1950+na.omit(all$vjpn.close*450))
