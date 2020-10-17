library(quantmod)
library(FRAPO)
library(fPortfolio)
#library(tidyquant)

####################################################
# returns a list of xts objects based on a list of #
# Ticker strings                                   #
####################################################
# read in the ticker strings
# tickers<-readxl::read_xls("C:\\Users\\bruce\\dev\\portfolio\\resources\\KOMP_All_Holdings.xls",sheet='KOMP_All_Holdings',range = "B5:B14",col_types = "text",col_names=FALSE,trim_ws = TRUE)
# tickers<-tickers$...1



# Ray Dalio's portfolio
# The beta balanced portfolio is divided into 3 parts
# 1.Growth stocks
#   1a. Developed market equity
#   1b. Small cap
#   1c. Emerging market equity
#   1d. REITS
# 2.Diversification and deflation hedging sovereign bonds
#   2a. Develped market long duration ZCBs
#   2b. Synthetic using futures
# 3.Real assets for inflation hedging
#   3a. TIPS
#   3b. Diversified commodoties

tickers<- c("SPY","GLD","IVV","VWO","IAU","BABA","FXI","MCHI","VEA",
            "EFA","LQD","IEFA","IEMG","JD","NTES","PDD","EWT","EEM","BIDU","TAL")

#  get the historical figures
quantmod::getSymbols(tickers)

# get the returns from the across the list of symbol's historical prices
return.listings<-lapply(tickers,function(tick){
  t = eval(as.symbol(tick))
  quantmod::monthlyReturn(t,type = "log")})

logret.mthly <- na.omit(Reduce(f = merge.xts,return.listings))
colnames(logret.mthly)<-tickers

################################
ret.mth.first <-coredata(first(ret.mthly.log));ret.mth.first
ret.mth.last<-coredata(last(ret.mthly.log));ret.mth.last
num.ret.mthly<-NROW(ret.mthly.log)
barplot((ret.mth.last/ret.mth.first)^(1/num.ret.mthly)-1)

ret.mthly.avg<-(ret.mth.last/ret.mth.first)^(1/num.ret.mthly)-1;ret.mthly.avg
invert.num.ret.mthly <- 1/num.ret.mthly
invert.num.ret.mthly
ret.mth.last
(ret.mth.last/ret.mth.first)^invert.num.ret.mthly
barplot(ret.mthly.avg)

ret.mthly.cum<-(ret.first/ret.last)-1;ret.mthly.cum
barplot(ret.mthly.cum)

plot(ret)


# do the same annually
# work on geometric returns
# extract cumulative and average returns
# plot them

ret.annual.list <-lapply(tickers,function(tick){
  t = eval(as.symbol(tick))
  annualReturn(t,type = "log")})

ret.annual.log <- na.omit(Reduce(f = merge.xts, ret.annual.list))
ret.annual.log
retMatrix <- as.matrix(ret.annual.log) # matrify xts objects

# intermediate values
colnames(ret.annual.log)<-tickers
ret.annual.log
ret.annual.first<-coredata(first(ret.annual))
ret.annual.last<-coredata(last(ret.annual))
inv.nrow.ret.annual <- 1/NROW(ret.annual.log)

# interesting return measurements
returns.avg<-((ret.annual.last/ret.annual.first)^inv.nrow.ret.annual)-1;returns.avg
returns.cum<-(ret.annual.last/ret.annual.first)-1;returns.cum



# give the column their respective names
colnames(ret)<-tickers

colnames(retMatrix)<-tickers

# prepare for the optimisation, (get a covariance matrix)
sig <- cov(ret)

###################################
#                                 # 
# Optimize the portfolio          #
#                                 #
###################################


# Mean-Variance optimized portfolio
MVBalanced<-fPortfolio::tangencyPortfolio(data = as.timeSeries(logret.mthly),constraints = 'maxW[1:2]=1')
# Equal risk optimized portfolio
sig <- cov(logret.mthly)
ERBalanced<-FRAPO::PERC(Sigma = sig)


MVBalanced@spec@portfolio$targetReturn
MVBalanced@spec@portfolio$targetRisk
MVBalanced@spec@portfolio$riskFreeRate
MVBalanced@spec@portfolio$status
barplot(MVBalanced@portfolio@portfolio$covRiskBudgets)
heatmap(retMatrix)
sum(MVBalanced@portfolio@portfolio$weights)
barplot(logret.mthly)
ERBalanced@weights



# convert the MV portfolio weights


##################################
# 
# Section on the Kelly Criterion
#
##################################
# Daily returns
return.listings.day<-lapply(tickers,function(tick){
  t = eval(as.symbol(tick))
  dailyReturn(t,type = "log")})

logret.daily <- na.omit(Reduce(f = merge.xts,return.listings.day))
colnames(logret.daily)<-tickers

logret.daily
# or Monthly returns
return.listings.month<-lapply(tickers,function(tick){
  t = eval(as.symbol(tick))
  monthlyReturn(t,type = "log")})

logret.mthly <- na.omit(Reduce(f = merge.xts,return.listings.month))
colnames(logret.mthly)<-tickers

logret.mthly



prob.win <- function(logret){
  s<-sign(logret)
  COUNT_IFS(s,x==1)/NROW(logret)}

wins<-as.matrix(lapply(return.listings.month,prob.win))
kelly.weights<-as.matrix(lapply(wins, function(x){2*x-1}))    
row.names(kelly.weights)<-tickers
sort.k.w<-sort(x = kelly.weights,decreasing = TRUE)
sum.k.w<-Filter(f = sum,x = kelly.weights)
Reduce(kelly.weights[1:4,], f = sum)