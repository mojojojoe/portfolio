
library(tidyquant)
tickers<-c("KOMP","VJPN.L","GBPUSD=X")
getSymbols(tickers,from='2018-01-01', to=TODAY())

colnames(KOMP) <- c("open","high","low","close","volume","adjusted")
colnames(VJPN.L) <- c("open","high","low","close","volume","adjusted")
colnames(`GBPUSD=X`) <- c("open","high","low","close","volume","adjusted")

# Conversion of GBP funds to USD
vjpnxusd <- merge.xts(VJPN.L,`GBPUSD=X`,join = "inner")
vjpn.usd <- cbind(vjpnxusd$close * vjpnxusd$close.1)

# Create a portfolio ts
all <- merge(KOMP$close,vjpn.usd, join = "outer")
portfolio.usd <- cbind(na.omit(all$komp.close)*1950+na.omit(all$vjpn.close*450))
