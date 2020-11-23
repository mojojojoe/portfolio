agitlibrary(quantmod)
library(FRAPO)
library(fPortfolio)
####################################################
# returns a list of xts objects based on a list of #
# Ticker strings                                   #
####################################################
# read in the ticker strings
# tickers<-readxl::read_xls("C:\\Users\\bruce\\dev\\portfolio\\resources\\KOMP_All_Holdings.xls",sheet='KOMP_All_Holdings',range = "B5:B14",col_types = "text",col_names=FALSE,trim_ws = TRUE)
# tickers<-tickers$...1

# The beta balanced portfolio is divided into 3 parts

#   1.Growth stocks
#   1a. Developed market equity
#   1b. Small cap
#   1c. Emerging market equity
#   1d. REITS

#   2.Diversification and deflation hedging sovereign bonds
#   2a. Develped market long duration ZCBs
#   2b. Synthetic using futures

#   3.Real assets for inflation hedging
#   3a. TIPS
#   3b. Diversified commodoties

###########################
# Define  portfolios
###########################
notickers <- c("IBTL.L","DJEU.L","TIPH.L")
tickers<- c("SPY","GLD","IVV","VWO","IAU","BABA","FXI","MCHI","VEA",
#            "EFA","LQD","IEFA","IEMG","JD","NTES","PDD","EWT","EEM","BIDU","TAL")
tickers <- c("IBTL.L","TIPH.L","UNIC.L","DJEU.L","SX5S.L","CRB.SW")

#  download the historical figures
# TODO: only download a ticker if it is not already loaded into the environment
quantmod::getSymbols(tickers)

###########################
#
# load the returns and prices data
#
###########################

source('~/dev/portfolio/src/returns.R')



###################################
#            
#  Optimize the portfolio 
#
###################################


# Mean-Variance optimized portfolio
MinVarBalanced<-FRAPO::PGMV(Returns=logret.mthly,percentage = TRUE)

# Equal risk optimized portfolio
ERBalanced<-FRAPO::PERC(Sigma = sig)

# Minimum conditional drawdown at risk
CDaRBalanced<- FRAPO::PCDaR(PriceData = prices.mthly.nona.ts, softBudget = TRUE)
barplot(tp@portfolio@portfolio$covRiskBudgets)



###########################
#
# Play with the FRAPO objects
#
###########################

CDaRBalanced@CDaR*60000
barplot(round(CDaRBalanced@weights*100))

MDBalanced <- FRAPO::PMD(Returns = logret.mthly, percentage = FALSE)
barplot(round(MDBalanced@weights,2))

barplot(ERBalanced@weights,legend.text = ERBalanced@type)

GMVBalanced<-FRAPO::PGMV(Returns = logret.mthly,percentage= FALSE)
(GMVBalanced@weights)
MTDBalanced<-FRAPO::PMTD(logret.mthly,percentage = FALSE)
barplot(MTDBalanced@weights, legend.text = MTDBalanced@type)

################################
# Play with fPortfolio
################################

library(fPortfolio)
plot.new()
tp<-fPortfolio::tangencyPortfolio(data = prices.mthly)

getWeights(tp)
getRiskFreeRate(tp)

barplot(tp@portfolio@portfolio$covRiskBudgets)
barplot(tp@portfolio@portfolio$weights)



prices.mthly
