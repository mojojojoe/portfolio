# get price.lists, a list of xts objects of price information on stocks

source('get_my_tickers.R')
library(tsbox)

lists.price.adjusted <- lapply(price.lists,function(x){return(x[,6])})
lapply(lists.price.adjusted,plot)


# mergePriceTablesInList(priceDfList)
# merge all xts obj from a list of xts objects
unify.list <- function(lst){
  out <- lst[[1]]
  for(ts in seq(2,length(lst))){
    out<-tsbox::ts_c(out,lst[[ts]])
  }
  out
}

multi.xts<-unify.list(lpa)

# put into a list refs to dfs created from calls to xts symbols
# ticker.refs <-lapply(tickers,as.symbol)
# eval(parse(ticker.refs[[1]]))
# ticker.refs[[1]]