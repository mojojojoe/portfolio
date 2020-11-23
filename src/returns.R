library(quantmod)
library(FRAPO)
library(fPortfolio)

###################################
#
#  Prepare the monthly return list
#
###################################
logret.list.mthly<-lapply(tickers,function(tick){
  t = eval(as.symbol(tick))
  quantmod::monthlyReturn(t,type = "log")})



logret.mthly <- na.omit(Reduce(f = merge.xts,logret.list.mthly))
colnames(logret.mthly)<-tickers

###################################
#
# Prepare the covariance matrix from monthly
# returns
#
###################################

(sig <- cov(logret.mthly))





###################################
#
# Also get the price list
# 
###################################
(prices.list.mthly<-lapply(tickers,function(tick){
    t <- eval(as.symbol(tick));
    t[,6]}))
  
prices.mthly <-as.timeSeries(na.omit(Reduce(f = merge.xts,prices.list.mthly)))
colnames(prices.mthly)<-tickers


