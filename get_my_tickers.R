
library(tidyquant)
tickers<-c("KOMP","VJPN.L","ZAR=X","GBPZAR=X","GBPUSD=X")
getSymbols(tickers,from='2018-01-01', to=TODAY())

colnames(KOMP) <- c("open","high","low","close","volume","adjusted")
colnames(`ZAR=X`) <- c("open","high","low","close","volume","adjusted")
colnames(`GBPZAR=X`) <- c("open","high","low","close","volume","adjusted")
colnames(VJPN.L) <- c("open","high","low","close","volume","adjusted")
colnames(`GBPUSD=X`) <- c("open","high","low","close","volume","adjusted")

komp <- cbind(KOMP$close)
vjp <- cbind(VJPN.L$close)
gbpx <- cbind(`GBPZAR=X`$close)
usdx <- cbind(`ZAR=X`$close)
usd_from_gbp <- cbind(`GBPUSD=X`$close)

us<-merge.xts(k,usd,join="inner")
uk<-merge.xts(vjp,gbp,fill=NA,join="inner")
uk.usd <- merge.xts(vjp,usd_from_gbp,join = "inner")

investment.us <- cbind(us$close*1950,1950*us$close*us$close.1)
investment.uk <- cbind(uk$close*450,450*uk$close*uk$close.1)
colnames(investment.us)<-c("usd","zar")
colnames(investment.uk)<-c("gbp","zar")

investment.uk.usd <- cbind(vjp$close*usd_from_gbp$close*450,vjp$close*usd_from_gbp$close)
investment.us.usd <- cbind(investments.us$usd,us$close)
colnames(investment.us.usd)<-c("usd","komp")
colnames(investment.uk.usd)<-c("usd","vjpn")

portfolio.usd <- merge(investment.uk.usd,investment.us.usd,join="outer")
