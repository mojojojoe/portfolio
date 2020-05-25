# get price.lists, a list of xts objects of price information on stocks

source("../src/get_my_tickers.R")

library(tsbox)

lists.price.adjusted <- lapply(price.lists,function(x){return(x[,6])})
lapply(lists.price.adjusted,plot)

# mergePriceTablesInList(priceDfList)
# merge all xts obj from a list of xts objects
# this is the same as the Reduce function with f=ts_c, x=lpa
unify.list <- function(lst){
  out <- lst[[1]]
  for(ts in seq(2,length(lst))){
    out<-tsbox::ts_c(out,lst[[ts]])
  }
  out
}



multi.xts<-unify.list(lists.price.adjusted)
colnames(multi.xts)<-tickers[[1]]
plot(multi.xts)