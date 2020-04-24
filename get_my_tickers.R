library(tidyquant)

install.packages("tidyquant")
tickers<-c("KOMP","VJPN.L","ZAR=X","GBPZAR=X")
getSymbols(tickers,from='2017-01-01', to='2020-04-24')
