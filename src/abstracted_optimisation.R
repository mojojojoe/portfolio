library(quantmod)
library(FRAPO)
library(fPortfolio)

tickers<-c('EDV','SPY')
quantmod::getSymbols(tickers)



lapply(tickers,function(t){to.monthly(tickers)})
       
       returns(EDV.month$EDV.Adjusted)#; tail(rEDV);head(rEDV)

rSPY<-returns(SPY.month$SPY.Adjusted)#; head(rSPY);tail(rSPY)

rSPY.trim<-rSPY[14:NROW(rSPY),]#;rSPY.trim

rEDV.trim<-rEDV[2:NROW(rEDV),]#;rEDV.trim

rmat <- cbind(rev(rEDV.trim),rev(rSPY.trim))

rmat.prune <- rmat[-1,];rmat.prune

MVBalanced<-fPortfolio::tangencyPortfolio(data = as.timeSeries(rmat.prune),constraints = 'maxW[1:2]=1')

sig <- cov(rmat.prune)

ERBalanced<-FRAPO::PERC(rmat.prune,Sigma = sig,par = c(0.40,0.60))

