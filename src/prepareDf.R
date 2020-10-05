# get price.lists, a list of xts objects of price information on stocks

source("../src/get_my_tickers.R")

library(tsbox)

list.price.col6 <- lapply(price.lists,function(x){return(x[,6])})
lapply(lists.price.col6,plot)

# mergePriceTablesInList(priceDfList)
# merge all xts obj from a list of xts objects
# this is the same as the Reduce function with f=ts_c, x=lpa
out = NULL
unify.list <- function(lst){
  out <- lst[[1]]
  for(ts in seq(2,length(lst))){
    out<-cbind(out,lst[[ts]])
  }
  out
}



multi.xts<-unify.list(lists.price.col6)
colnames(multi.xts)<-tickers
plot(multi.xts)