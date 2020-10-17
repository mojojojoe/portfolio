# SPY.ohlc<-quantmod::getSymbols("SPY")

averageReturn <- function(historic.ohlc){
  return <- annualReturn(historic.ohlc, type = "log")
  ret.first <- coredata(first(return))
  ret.last <- coredata(last(return))
  NR <- NROW(return)
  ret.ave <- ((ret.last/ret.first)^(1/NR))-1
  return(ret.ave)
}

cumulativeReturn.log <- function(historic.ohlc){
  return <- annualReturn(historic.ohlc, type = "log")
  head(return)
  tail(return)
  ret.first <- coredata(first(return))
  ret.last <- coredata(last(return))
  ret.cum <- (ret.last/ret.first)-1
  return(ret.cum)
}

cumulativeReturn.arith <- function(historic.ohlc){
  return <- annualReturn(historic.ohlc, type = "arithmetic")
  head(return)
  tail(return)
  ret.first <- coredata(first(return))
  ret.last <- coredata(last(return))
  ret.cum <- (ret.last/ret.first)-1
  return(ret.cum)
}
