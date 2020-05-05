
library(tidyquant)
tickers<-c("KOMP","VJPN.L")
startDt <- '2016-01-01'

GBPxUSD <- getSymbols("GBPUSD=X",auto.assign=FALSE,from=startDt,to=TODAY())

ticky <- function(x){
  getSymbols(x,auto.assign=FALSE,from=startDt,to=TODAY())
}

chgColNames <- function(x){
  colnames()
}

quoteDfList <- lapply(tickers,ticky)  
 <- for(i in 1:length(quoteDfList)){
  colnames(quoteDfList[[i]]) <- c("open","high","low","close","volume","adjusted")
}

i <- quoteDfList[[2]]

# Conversion of GBP funds to USD
vjpn.merge <- merge(quoteDfList[[2]],quoteDfList[[3]],join = "inner")
vjpn.usd <- cbind(vjpn.merge$close * vjpn.merge$close.1)

# Create a portfolio ts
all <- merge(quoteDfList[[1]],vjpn.usd, join = "outer")
portfolio.usd <- cbind(na.omit(all$komp.close)*1950+na.omit(all$vjpn.close*450))
