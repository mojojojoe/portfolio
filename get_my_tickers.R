
library(tidyquant)
tickers<-c("KOMP","VJPN.L","ZAR=X","GBPZAR=X")
getSymbols(tickers,from='2017-01-01', to=TODAY())

plot(KOMP$KOMP.Close)
plot(`ZAR=X`$`ZAR=X.Close`)
plot(`GBPZAR=X`$`GBPZAR=X.Close`)
plot(VJPN.L$VJPN.L.Close)
